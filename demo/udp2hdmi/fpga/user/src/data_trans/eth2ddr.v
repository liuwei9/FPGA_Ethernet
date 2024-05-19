module eth2ddr (
    input          clk         ,
    input          rst         ,

    input   [31:0] base_addr   ,

    input   [7:0]  s_axis_data ,
    input          s_axis_valid,
    input          s_axis_last ,
    input   [15:0] s_axis_len  ,
    input          s_axis_vsync,
 
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

wire [7:0]  ctrl_axis_data ;
wire        ctrl_axis_valid;
wire        ctrl_axis_last ;
wire [31:0] ctrl_axis_addr ;
wire [31:0] ctrl_axis_len  ;

wire [7:0]  ping_s_axis_data ; 
wire        ping_s_axis_valid;
wire        ping_s_axis_last ; 
wire [31:0] ping_s_axis_addr ; 
wire [31:0] ping_s_axis_len  ; 

wire [7:0]  pang_s_axis_data ; 
wire        pang_s_axis_valid;
wire        pang_s_axis_last ; 
wire [31:0] pang_s_axis_addr ; 
wire [31:0] pang_s_axis_len  ; 


wire        ping_m_cmd_valid;
wire [31:0] ping_m_cmd_addr ;
wire [31:0] ping_m_cmd_len  ;
wire        ping_m_cmd_ready;

wire        pang_m_cmd_valid;
wire [31:0] pang_m_cmd_addr ;
wire [31:0] pang_m_cmd_len  ;
wire        pang_m_cmd_ready;

wire [127:0] ping_m_axis_data ;
wire [ 15:0] ping_m_axis_keep ;
wire         ping_m_axis_valid;
wire         ping_m_axis_last ;
wire         ping_m_axis_ready;

wire [127:0] pang_m_axis_data ;
wire [ 15:0] pang_m_axis_keep ;
wire         pang_m_axis_valid;
wire         pang_m_axis_last ;
wire         pang_m_axis_ready;


reg w_ping;
reg r_ping;

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        w_ping <= 1'b0;
    end
    else begin
        if((ctrl_axis_valid == 1'b1) && (ctrl_axis_last == 1'b1))begin
            w_ping <= !w_ping;
        end
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        r_ping <= 1'b0;
    end
    else begin
        if((m_axis_valid == 1'b1) && (m_axis_ready == 1'b1) && (m_axis_last == 1'b1))begin
            r_ping <= !r_ping;
        end
    end
end

assign ping_s_axis_data  = w_ping == 1'b0 ? ctrl_axis_data  :  8'b0;
assign ping_s_axis_valid = w_ping == 1'b0 ? ctrl_axis_valid :  1'b0;
assign ping_s_axis_last  = w_ping == 1'b0 ? ctrl_axis_last  :  1'b0;
assign ping_s_axis_addr  = w_ping == 1'b0 ? ctrl_axis_addr  : 32'b0;
assign ping_s_axis_len   = w_ping == 1'b0 ? ctrl_axis_len   : 32'b0;

assign pang_s_axis_data  = w_ping == 1'b1 ? ctrl_axis_data  :  8'b0;
assign pang_s_axis_valid = w_ping == 1'b1 ? ctrl_axis_valid :  1'b0;
assign pang_s_axis_last  = w_ping == 1'b1 ? ctrl_axis_last  :  1'b0;
assign pang_s_axis_addr  = w_ping == 1'b1 ? ctrl_axis_addr  : 32'b0;
assign pang_s_axis_len   = w_ping == 1'b1 ? ctrl_axis_len   : 32'b0;

assign m_cmd_valid  = r_ping == 1'b0 ? ping_m_cmd_valid : pang_m_cmd_valid;
assign m_cmd_addr   = r_ping == 1'b0 ? ping_m_cmd_addr  : pang_m_cmd_addr ;
assign m_cmd_len    = r_ping == 1'b0 ? ping_m_cmd_len   : pang_m_cmd_len  ;

assign m_axis_data  = r_ping == 1'b0 ? ping_m_axis_data : pang_m_axis_data ;
assign m_axis_keep  = r_ping == 1'b0 ? ping_m_axis_keep : pang_m_axis_keep ;
assign m_axis_valid = r_ping == 1'b0 ? ping_m_axis_valid: pang_m_axis_valid;
assign m_axis_last  = r_ping == 1'b0 ? ping_m_axis_last : pang_m_axis_last ;

assign ping_m_cmd_ready  = r_ping == 1'b0 ? m_cmd_ready  : 1'b0;
assign pang_m_cmd_ready  = r_ping == 1'b1 ? m_cmd_ready  : 1'b0;

assign ping_m_axis_ready = r_ping == 1'b0 ? m_axis_ready : 1'b0;
assign pang_m_axis_ready = r_ping == 1'b1 ? m_axis_ready : 1'b0;


eth2ddr_ctrl eth2ddr_ctrl_inst(
    .clk          (clk            ),
    .rst          (rst            ),

    .base_addr    (base_addr      ),

    .s_axis_data  (s_axis_data    ),
    .s_axis_valid (s_axis_valid   ),
    .s_axis_last  (s_axis_last    ),
    .s_axis_len   (s_axis_len     ),
    .s_axis_vsync (s_axis_vsync   ),

    .m_axis_data  (ctrl_axis_data ),
    .m_axis_valid (ctrl_axis_valid),
    .m_axis_last  (ctrl_axis_last ),
    .m_axis_addr  (ctrl_axis_addr ),
    .m_axis_len   (ctrl_axis_len  )
);

eth2ddr_rbuf eth2ddr_rbuf_ping(
    .clk          (clk              ),
    .rst          (rst              ),

    .s_axis_data  (ping_s_axis_data ),
    .s_axis_valid (ping_s_axis_valid),
    .s_axis_last  (ping_s_axis_last ),
    .s_axis_addr  (ping_s_axis_addr ),
    .s_axis_len   (ping_s_axis_len  ),
 
    .m_cmd_valid  (ping_m_cmd_valid ),
    .m_cmd_addr   (ping_m_cmd_addr  ),
    .m_cmd_len    (ping_m_cmd_len   ),
    .m_cmd_ready  (ping_m_cmd_ready ),

    .m_axis_data  (ping_m_axis_data ),
    .m_axis_keep  (ping_m_axis_keep ),
    .m_axis_valid (ping_m_axis_valid),
    .m_axis_last  (ping_m_axis_last ),
    .m_axis_ready (ping_m_axis_ready)
);

eth2ddr_rbuf eth2ddr_rbuf_pang(
    .clk          (clk              ),
    .rst          (rst              ),

    .s_axis_data  (pang_s_axis_data ),
    .s_axis_valid (pang_s_axis_valid),
    .s_axis_last  (pang_s_axis_last ),
    .s_axis_addr  (pang_s_axis_addr ),
    .s_axis_len   (pang_s_axis_len  ),
 
    .m_cmd_valid  (pang_m_cmd_valid ),
    .m_cmd_addr   (pang_m_cmd_addr  ),
    .m_cmd_len    (pang_m_cmd_len   ),
    .m_cmd_ready  (pang_m_cmd_ready ),

    .m_axis_data  (pang_m_axis_data ),
    .m_axis_keep  (pang_m_axis_keep ),
    .m_axis_valid (pang_m_axis_valid),
    .m_axis_last  (pang_m_axis_last ),
    .m_axis_ready (pang_m_axis_ready)
);


    
endmodule