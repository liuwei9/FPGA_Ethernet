module ddr2hdmi (
    input          clk         ,
    input          rst         ,
    input          axi_clk     ,
    input          axi_rst     ,
    
    (*mark_debug = "true"*)input          vsync       ,
    (*mark_debug = "true"*)input  [31:0]  addr        ,
    (*mark_debug = "true"*)input  [31:0]  len         ,

    (*mark_debug = "true"*)input  [127:0] s_axis_data ,
    (*mark_debug = "true"*)input  [ 15:0] s_axis_keep ,
    (*mark_debug = "true"*)input          s_axis_valid,
    (*mark_debug = "true"*)input          s_axis_last ,
    (*mark_debug = "true"*)output         s_axis_ready,

    (*mark_debug = "true"*)output         m_cmd_valid ,
    (*mark_debug = "true"*)output [31:0]  m_cmd_addr  ,
    (*mark_debug = "true"*)output [31:0]  m_cmd_len   ,
    (*mark_debug = "true"*)input          m_cmd_ready ,
     
    (*mark_debug = "true"*)output [23:0]  tx_data     ,
    (*mark_debug = "true"*)input          tx_ready         
);

localparam IDLE = 4'b0001;
localparam RST  = 4'b0010;
localparam ADDR = 4'b0100;
localparam READ = 4'b1000;

(*mark_debug = "true"*)wire vsync_cdc;
(*mark_debug = "true"*)reg vsync_ff;

(*mark_debug = "true"*)reg [3:0] curr_state;
reg [3:0] next_state;

(*mark_debug = "true"*)reg [3:0] rst_cnt;

(*mark_debug = "true"*)reg         m_cmd_valid_r;
(*mark_debug = "true"*)reg [31:0]  m_cmd_addr_r ;
(*mark_debug = "true"*)reg [31:0]  m_cmd_len_r  ;

(*mark_debug = "true"*)reg rst_n;
(*mark_debug = "true"*)wire fifo_rst;

(*mark_debug = "true"*)wire          m_axis_tvalid;
(*mark_debug = "true"*)wire          m_axis_tready;
(*mark_debug = "true"*)wire [15 : 0] m_axis_tdata ;
(*mark_debug = "true"*)wire [1 : 0]  m_axis_tkeep ;
(*mark_debug = "true"*)wire          m_axis_tlast ;

(*mark_debug = "true"*)wire          wr_en ;
(*mark_debug = "true"*)wire          rd_en ;
(*mark_debug = "true"*)wire [15 : 0] dout  ;
(*mark_debug = "true"*)wire          full  ;
(*mark_debug = "true"*)wire          empty ;

(*mark_debug = "true"*)reg abnormal ;

always @(posedge axi_clk ) begin
    if(axi_rst == 1'b1)begin
        abnormal <= 1'b0;
    end
    else begin
        if(curr_state == READ)begin
            abnormal <= (vsync_cdc == 1'b1) && (vsync_ff == 1'b0) | abnormal;
        end
    end
end

   xpm_cdc_single #(
      .DEST_SYNC_FF(4),   // DECIMAL; range: 2-10
      .INIT_SYNC_FF(0),   // DECIMAL; 0=disable simulation init values, 1=enable simulation init values
      .SIM_ASSERT_CHK(0), // DECIMAL; 0=disable simulation messages, 1=enable simulation messages
      .SRC_INPUT_REG(1)   // DECIMAL; 0=do not register input, 1=register input
   )
   xpm_cdc_single_inst (
      .dest_out(vsync_cdc), // 1-bit output: src_in synchronized to the destination clock domain. This output is
                           // registered.

      .dest_clk(axi_clk), // 1-bit input: Clock signal for the destination clock domain.
      .src_clk(clk),   // 1-bit input: optional; required when SRC_INPUT_REG = 1
      .src_in(vsync)      // 1-bit input: Input signal to be synchronized to dest_clk domain.
   );

always @(posedge axi_clk ) begin
    if(axi_rst == 1'b1)begin
        vsync_ff <= 1'b0;
    end
    else begin
        vsync_ff <= vsync_cdc;
    end
end

always @(posedge axi_clk ) begin
    if(axi_rst == 1'b1)begin
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

always @(posedge axi_clk ) begin
    if(axi_rst == 1'b1)begin
        curr_state <= IDLE;
    end
    else begin
        curr_state <= next_state;
    end
end

always @(*) begin
    case (curr_state)
        IDLE: begin
            if((vsync_cdc == 1'b1) && (vsync_ff == 1'b0))begin
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

always @(posedge axi_clk ) begin
    if(axi_rst == 1'b1)begin
        rst_cnt <= 4'd0;
    end
    else begin
        if(curr_state == RST)begin
            rst_cnt <= rst_cnt + 4'd1;
        end
        else begin
            rst_cnt <= 4'd0;
        end
    end
end

always @(posedge axi_clk ) begin
    m_cmd_addr_r <= addr       ;
    m_cmd_len_r  <= len        ;
end

always @(posedge axi_clk ) begin
    if(axi_rst == 1'b1)begin
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

assign wr_en = (s_axis_valid == 1'b1) && (s_axis_ready == 1'b1);
assign s_axis_ready = !full && (curr_state == READ);
assign rd_en = tx_ready;
assign tx_data = {dout[15:11], 3'd0, dout[10:5], 2'd0, dout[4:0], 3'd0};

// axis_dwidth_converter_128to16 axis_dwc_128to16_inst (
//   .aclk(axi_clk),                    // input wire aclk
//   .aresetn(rst_n),              // input wire aresetn
//   .s_axis_tvalid(s_axis_valid),  // input wire s_axis_tvalid
//   .s_axis_tready(s_axis_ready),  // output wire s_axis_tready
//   .s_axis_tdata(s_axis_data),    // input wire [127 : 0] s_axis_tdata
//   .s_axis_tkeep(s_axis_keep),    // input wire [15 : 0] s_axis_tkeep
//   .s_axis_tlast(s_axis_last),    // input wire s_axis_tlast
//   .m_axis_tvalid(m_axis_tvalid),  // output wire m_axis_tvalid
//   .m_axis_tready(m_axis_tready),  // input  wire m_axis_tready
//   .m_axis_tdata(m_axis_tdata),    // output wire [15 : 0] m_axis_tdata
//   .m_axis_tkeep(m_axis_tkeep),    // output wire [1 : 0] m_axis_tkeep
//   .m_axis_tlast(m_axis_tlast)    //  output wire m_axis_tlast
// );

async_fifo_16_16_4096 async_fifo_16_16_4096_inst (
  .rst(fifo_rst),        // input wire rst
  .wr_clk(axi_clk),  // input wire wr_clk
  .rd_clk(clk),  // input wire rd_clk
  .din(s_axis_data),        // input wire [15 : 0] din
  .wr_en(wr_en),    // input wire wr_en
  .rd_en(rd_en),    // input wire rd_en
  .dout(dout),      // output wire [15 : 0] dout
  .full(full),      // output wire full
  .empty(empty)    // output wire empty
);

// sync_fifo_16_16_2048 sync_fifo_16_16_2048_inst (
//   .clk(clk),      // input wire clk
//   .srst(fifo_rst),    // input wire srst
//   .din(m_axis_tdata),      // input wire [15 : 0] din
//   .wr_en(wr_en),  // input  wire wr_en
//   .rd_en(rd_en),  // input  wire rd_en
//   .dout(dout),    // output wire [15 : 0] dout
//   .full(full),    // output wire full
//   .empty(empty)  // output  wire empty
// );
    
endmodule