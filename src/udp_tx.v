module udp_tx (
    input         clk              ,
    input         rst              ,

    input  [15:0] cfg_udp_src_port ,
    input  [15:0] cfg_udp_dst_port ,

    input  [ 7:0] s_udp_axis_data  ,
    input         s_udp_axis_valid ,
    input         s_udp_axis_last  ,
    output        s_udp_axis_ready ,

);

localparam IDLE  = 5'b00001;
localparam WRITE = 5'b00010;
localparam WAIT  = 5'b00100;
localparam HEAD  = 5'b01000;
localparam READ  = 5'b10000;

reg [4:0] curr_state;
reg [4:0] next_state;

wire [ 8:0] wdata;
wire        wen  ;
reg  [10:0] waddr;
wire        ren  ;
reg  [10:0] raddr;
wire [ 8:0] rdata;

reg  [ 3:0] wait_cnt;

reg  [ 4:0] s_udp_axis_valid_ff;

reg [15:0] cfg_udp_src_port_r;
reg [15:0] cfg_udp_dst_port_r;

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        s_udp_axis_valid_ff <= 5'b0;

    end
    else begin
        s_udp_axis_valid_ff <= {s_udp_axis_valid_ff[3:0], s_udp_axis_valid};

    end
end

always @(posedge clk ) begin
    if((s_udp_axis_valid == 1'b1) && (s_udp_axis_valid_ff[0] == 1'b0))begin
        cfg_udp_src_port_r <= cfg_udp_src_port;
        cfg_udp_dst_port_r <= cfg_udp_dst_port;
    end
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
            if(s_udp_axis_valid == 1'b1)begin
                next_state = WRITE;
            end
            else begin
                next_state = IDLE;
            end
        end 
        WRITE: begin
            if((s_udp_axis_valid == 1'b1) && (s_udp_axis_last == 1'b1))begin
                next_state = WAIT;
            end
            else begin
                next_state = WRITE;
            end
        end
        WAIT: begin
            if(wait_cnt == 4'b1111)begin
                next_state =HEAD;
            end
            else begin
                next_state = WAIT;
            end
        end
        HEAD: begin
            
        end
        READ: begin
            
        end
        default: begin
            next_state = IDLE;
        end
    endcase
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        wait_cnt <= 4'd0;
    end
    else begin
        if(curr_state == WAIT)begin
            wait_cnt <= wait_cnt + 4'd1;
        end
        else begin
            wait_cnt <= 4'd0;
        end
    end
end

assign wen = s_udp_axis_valid;
assign s_udp_axis_ready = (curr_state == IDLE) || (curr_state == WRITE);
always @(posedge clk ) begin
    if(rst == 1'b1)begin
        waddr <= 11'd0;
    end
    else begin
        if(s_udp_axis_valid == 1'b1)begin
            if(s_udp_axis_last == 1'b1)begin
                waddr <= 11'd0;
            end
            else begin
                waddr <= waddr + 11'd1;
            end
        end
    end
end

assign ren = ((curr_state == READ) && (rdata[8] == 1'b0)) || ((curr_state == HEAD) && (next_state == READ));
always @(posedge clk ) begin
    if(rst == 1'b1)begin
        raddr <= 11'd0;
    end
    else begin
        if(ren == 1'b1)begin
            raddr <= raddr + 11'd1;
        end
        else begin
            raddr <= 11'd0;
        end
    end
end

tpram #(
    .DP    (2048),
    .WD    (9   )
) tpram_inst (
    .clk   (clk  ),
    .wdata (wdata),
    .wen   (wen  ),
    .waddr (waddr),
    .ren   (ren  ),
    .raddr (raddr),
    .rdata (rdata)

);
    
endmodule