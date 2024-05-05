module eth2ddr_rbuf (
    input          clk         ,
    input          rst         ,

    input   [7:0]  s_axis_data ,
    input          s_axis_valid,
    input          s_axis_last ,
    input   [31:0] s_axis_addr ,
    input   [31:0] s_axis_len  ,
 
    output         m_cmd_valid ,
    output  [31:0] m_cmd_addr  ,
    output  [31:0] m_cmd_len   ,
    input          m_cmd_ready ,

    output [127:0] m_axis_data ,
    output [ 15:0] m_axis_keep ,
    output         m_axis_valid,
    output         m_axis_last ,
    input          m_axis_ready
);

localparam IDLE  = 4'b0001;
localparam WRITE = 4'b0010;
localparam WAIT  = 4'b0100;
localparam READ  = 4'b1000;

reg [3:0] curr_state;
reg [3:0] next_state;

reg [7:0]  s_axis_data_ff ; 
reg        s_axis_valid_ff;
reg        s_axis_last_ff ;

reg [31:0] m_addr;
reg [31:0] m_len ;

reg        m_cmd_valid_r;

reg [11:0] r_len;

wire wr_en;
wire rd_en;
wire [8:0] din;
wire [8:0] dout;
wire full;
wire empty;

wire s_axis_tvalid;
wire s_axis_tready;
wire [7 : 0] s_axis_tdata;
wire [0 : 0] s_axis_tkeep;
wire s_axis_tlast;
wire m_axis_tvalid;
wire m_axis_tready;
wire [127 : 0] m_axis_tdata;
wire [15 : 0] m_axis_tkeep;
wire m_axis_tlast;

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        s_axis_data_ff  <= 8'b0;
        s_axis_valid_ff <= 1'b0;
        s_axis_last_ff  <= 1'b0;
    end
    else begin
        s_axis_data_ff  <= s_axis_data ;
        s_axis_valid_ff <= s_axis_valid;
        s_axis_last_ff  <= s_axis_last ;
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        m_addr <= 32'd0;
    end
    else begin
        if((s_axis_valid == 1'b1) && (s_axis_valid_ff == 1'b0))begin
            m_addr <= s_axis_addr;
            m_len  <= s_axis_len ;
        end
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
            if(s_axis_valid == 1'b1)begin
                next_state = WRITE;
            end
            else begin
                next_state = IDLE;
            end
        end 
        WRITE: begin
            if((s_axis_last_ff == 1'b1) && (s_axis_valid_ff == 1'b1))begin
                next_state = WAIT;
            end
            else begin
                next_state = WRITE;
            end
        end
        WAIT: begin
            if((m_cmd_valid == 1'b1) && (m_cmd_ready == 1'b1))begin
                next_state = READ;
            end
            else begin
                next_state = WAIT;
            end
        end
        READ: begin
            if((m_axis_valid == 1'b1) && (m_axis_ready == 1'b1) && (m_axis_last == 1'b1))begin
                next_state = IDLE;
            end
            else begin
                next_state = READ;
            end
        end
        default: begin
            next_state = IDLE;
        end
    endcase
end



always @(posedge clk ) begin
    if(rst == 1'b1)begin
        m_cmd_valid_r <= 1'b0;
    end
    else begin
        if((curr_state == WAIT) && (m_cmd_valid_r == 1'b0))begin
            m_cmd_valid_r <= 1'b1;
        end
        else begin
            if((m_cmd_valid_r == 1'b1) && (m_cmd_ready == 1'b1))begin
                m_cmd_valid_r <= 1'b0;
            end
        end
    end
end

assign m_cmd_valid = m_cmd_valid_r;
assign m_cmd_addr  = m_addr       ;
assign m_cmd_len   = m_len        ;

assign din = {s_axis_last, s_axis_data};
assign wr_en = s_axis_valid;

assign rd_en = (s_axis_tvalid == 1'b1) && (s_axis_tready == 1'b1);
assign s_axis_tvalid = (curr_state == READ) && (empty == 1'b0);
assign s_axis_tdata = dout[7:0];
assign s_axis_tlast = dout[8];
assign s_axis_tkeep = 1'b1;

assign m_axis_tready = m_axis_ready;
assign m_axis_data = m_axis_tdata;
assign m_axis_valid = m_axis_tvalid;
assign m_axis_last = m_axis_tlast;
assign m_axis_keep = m_axis_tkeep;

sync_fifo_9_9_2048 sync_fifo_9_9_2048_inst (
  .clk(clk),      // input wire clk
  .srst(rst),    // input wire srst
  .din(din),      // input wire [8 : 0] din
  .wr_en(wr_en),  // input wire wr_en
  .rd_en(rd_en),  // input wire rd_en
  .dout(dout),    // output wire [8 : 0] dout
  .full(full),    // output wire full
  .empty(empty)  // output wire empty
);

axis_dwidth_converter_8to128 your_instance_name (
  .aclk(clk),                    // input wire aclk
  .aresetn(!rst),              // input wire aresetn
  .s_axis_tvalid(s_axis_tvalid),  // input wire s_axis_tvalid
  .s_axis_tready(s_axis_tready),  // output wire s_axis_tready
  .s_axis_tdata(s_axis_tdata),    // input wire [7 : 0] s_axis_tdata
  .s_axis_tkeep(s_axis_tkeep),    // input wire [0 : 0] s_axis_tkeep
  .s_axis_tlast(s_axis_tlast),    // input wire s_axis_tlast
  .m_axis_tvalid(m_axis_tvalid),  // output wire m_axis_tvalid
  .m_axis_tready(m_axis_tready),  // input wire m_axis_tready
  .m_axis_tdata(m_axis_tdata),    // output wire [127 : 0] m_axis_tdata
  .m_axis_tkeep(m_axis_tkeep),    // output wire [15 : 0] m_axis_tkeep
  .m_axis_tlast(m_axis_tlast)    // output wire m_axis_tlast
);

endmodule