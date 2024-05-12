module th_eth2ddr (
);
reg clk;
reg rst;


wire  [7:0] ctrl_m_axis_data ;
wire        ctrl_m_axis_valid;
wire        ctrl_m_axis_last ;
wire [15:0] ctrl_m_axis_len  ;
wire        ctrl_m_axis_vsync;

wire        eth2ddr_m_cmd_valid; 
wire [31:0] eth2ddr_m_cmd_addr ; 
wire [31:0] eth2ddr_m_cmd_len  ; 
wire        eth2ddr_m_cmd_ready = 1; 

wire [127:0] eth2ddr_m_axis_data ;
wire [ 15:0] eth2ddr_m_axis_keep ;
wire         eth2ddr_m_axis_valid;
wire         eth2ddr_m_axis_last ;
wire         eth2ddr_m_axis_ready = 1;

localparam IDLE  = 3'b001;
localparam WRITE = 3'b010;
localparam WAIT  = 3'b100;

localparam WAIT_CNT = 128;

localparam ETH2DDR_BASEADDR = 0;

reg [2:0] curr_state;
reg [2:0] next_state;

reg start;
reg [31:0] cnt;
reg [31:0] wait_cnt;

reg vsync;

initial begin
    clk = 1'b0;
    forever begin
        clk = #5 !clk;
    end
end

initial begin
    rst = 1'b1;
    start = 1'b0;
    #50
    rst = 1'b0;
    #50
    start = 1'b1;
    #50
    start = 1'b0;
end


always @(posedge clk ) begin
    if(rst == 1'b1)begin
        curr_state <= IDLE;
    end
    else begin
        curr_state <= next_state;
    end
end

always @(*) begin
    case (curr_state)
        IDLE: begin
            if(start == 1'b1)begin
                next_state = WRITE;
            end
            else begin
                next_state = IDLE;
            end
        end 
        WRITE: begin
            if(ctrl_m_axis_last == 1'b1)begin
                next_state = WAIT;
            end
            else begin
                next_state= WRITE;
            end
        end
        WAIT: begin
            if(wait_cnt == WAIT_CNT)begin
                next_state = WRITE;
            end
            else begin
                next_state = WAIT;
            end
        end
        default: begin
            next_state = IDLE;
        end
    endcase
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        cnt <= 32'd0;
    end
    else begin
        if(curr_state == WRITE)begin
            cnt <= cnt + 32'd1;
        end
        else begin
            cnt <= 32'd0;
        end
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        wait_cnt <= 32'd0;
    end
    else begin
        if(curr_state == WAIT)begin
            wait_cnt <= wait_cnt + 32'd1;
        end
        else begin
            wait_cnt <= 32'd0;
        end
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        vsync <= 1'b0;
    end
    else begin
        if((curr_state == IDLE) && (next_state == WRITE))begin
            vsync <= 1'b1;
        end
        else begin
            vsync <= 1'b0;
        end
    end
end


assign ctrl_m_axis_data  = cnt[7:0];
assign ctrl_m_axis_valid = (curr_state == WRITE) && (cnt <= 1120);
assign ctrl_m_axis_last  = (curr_state == WRITE) && (cnt == 1120);
assign ctrl_m_axis_len   = 1121;
assign ctrl_m_axis_vsync = vsync;

eth2ddr eth2ddr_inst(
    .clk          (clk              ),
    .rst          (rst              ),

    .base_addr    (ETH2DDR_BASEADDR ),

    .s_axis_data  (ctrl_m_axis_data ),
    .s_axis_valid (ctrl_m_axis_valid),
    .s_axis_last  (ctrl_m_axis_last ),
    .s_axis_len   (ctrl_m_axis_len  ),
    .s_axis_vsync (ctrl_m_axis_vsync),
 
    .m_cmd_valid  (eth2ddr_m_cmd_valid),
    .m_cmd_addr   (eth2ddr_m_cmd_addr ),
    .m_cmd_len    (eth2ddr_m_cmd_len  ),
    .m_cmd_ready  (eth2ddr_m_cmd_ready),

    .m_axis_data  (eth2ddr_m_axis_data ),
    .m_axis_keep  (eth2ddr_m_axis_keep ),
    .m_axis_valid (eth2ddr_m_axis_valid),
    .m_axis_last  (eth2ddr_m_axis_last ),
    .m_axis_ready (eth2ddr_m_axis_ready)
);

endmodule