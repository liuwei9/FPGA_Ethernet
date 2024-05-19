module ddr2hdmi (
    input          clk         ,
    input          rst         ,
    
    input          vsync       ,
    input  [31:0]  addr        ,
    input  [31:0]  len         ,

    input  [127:0] s_axis_data ,
    input  [ 15:0] s_axis_keep ,
    input          s_axis_valid,
    input          s_axis_last ,
    output         s_axis_ready,

    output         m_cmd_valid ,
    output [31:0]  m_cmd_addr  ,
    output [31:0]  m_cmd_len   ,
    input          m_cmd_ready ,
     
    output [23:0]  tx_data     ,
    input          tx_ready         
);

localparam IDLE = 4'b0001;
localparam RST  = 4'b0010;
localparam ADDR = 4'b0100;
localparam READ = 4'b1000;

reg vsync_ff;

reg [3:0] curr_state;
reg [3:0] next_state;

reg [3:0] rst_cnt;

reg         m_cmd_valid_r;
reg [31:0]  m_cmd_addr_r ;
reg [31:0]  m_cmd_len_r  ;

reg rst_n;
wire fifo_rst;

wire          m_axis_tvalid;
wire          m_axis_tready;
wire [15 : 0] m_axis_tdata ;
wire [1 : 0]  m_axis_tkeep ;
wire          m_axis_tlast ;

wire          wr_en ;
wire          rd_en ;
wire [15 : 0] dout  ;
wire          full  ;
wire          empty ;

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        vsync_ff <= 1'b0;
    end
    else begin
        vsync_ff <= vsync;
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        rst_n <= 1'b0;
    end
    else begin
        if(curr_state == RST)begin
            rst_n <= 1'b0;
        end
        else begin
            rst_n <= 1'b1;
        end
    end
end

assign fifo_rst = !rst_n;

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
            if((vsync == 1'b1) && (vsync_ff == 1'b0))begin
                next_state = RST;
            end
            else begin
                next_state = IDLE;
            end
        end 
        RST: begin
            if(rst_cnt == 4'b1111)begin
                next_state = ADDR;
            end
            else begin
                next_state = RST;
            end
        end
        ADDR: begin
            if((m_cmd_ready == 1'b1) && (m_cmd_valid == 1'b1))begin
                next_state = READ;
            end
            else begin
                next_state = ADDR;
            end
        end
        READ: begin
            if((s_axis_valid == 1'b1) && (s_axis_ready == 1'b1) && (s_axis_last == 1'b1))begin
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
    m_cmd_addr_r <= addr       ;
    m_cmd_len_r  <= len        ;
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        m_cmd_valid_r <= 1'b0;
    end
    else begin
        if(curr_state == ADDR)begin
            if((m_cmd_valid_r == 1'b1) && (m_cmd_ready == 1'b1))begin
                m_cmd_valid_r <= 1'b0;
            end
            else begin
                m_cmd_valid_r <= 1'b1;
            end
        end
        else begin
            m_cmd_valid_r <= 1'b0;
        end
    end
end

assign m_cmd_valid = m_cmd_valid_r;
assign m_cmd_addr  = m_cmd_addr_r ;
assign m_cmd_len   =m_cmd_len_r   ; 

assign wr_en = (m_axis_tvalid == 1'b1) && (m_axis_tready == 1'b1);
assign m_axis_tready = !full;
assign rd_en = tx_ready;
assign tx_data = {dout[15:11], 3'd0, dout[10:5], 2'd0, dout[4:0], 3'd0};

axis_dwidth_converter_128to16 axis_dwc_128to16_inst (
  .aclk(clk),                    // input wire aclk
  .aresetn(rst_n),              // input wire aresetn
  .s_axis_tvalid(s_axis_valid),  // input wire s_axis_tvalid
  .s_axis_tready(s_axis_ready),  // output wire s_axis_tready
  .s_axis_tdata(s_axis_data),    // input wire [127 : 0] s_axis_tdata
  .s_axis_tkeep(s_axis_keep),    // input wire [15 : 0] s_axis_tkeep
  .s_axis_tlast(s_axis_last),    // input wire s_axis_tlast
  .m_axis_tvalid(m_axis_tvalid),  // output wire m_axis_tvalid
  .m_axis_tready(m_axis_tready),  // input  wire m_axis_tready
  .m_axis_tdata(m_axis_tdata),    // output wire [15 : 0] m_axis_tdata
  .m_axis_tkeep(m_axis_tkeep),    // output wire [1 : 0] m_axis_tkeep
  .m_axis_tlast(m_axis_tlast)    //  output wire m_axis_tlast
);

sync_fifo_16_16_2048 sync_fifo_16_16_2048_inst (
  .clk(clk),      // input wire clk
  .srst(fifo_rst),    // input wire srst
  .din(m_axis_tdata),      // input wire [15 : 0] din
  .wr_en(wr_en),  // input  wire wr_en
  .rd_en(rd_en),  // input  wire rd_en
  .dout(dout),    // output wire [15 : 0] dout
  .full(full),    // output wire full
  .empty(empty)  // output  wire empty
);
    
endmodule