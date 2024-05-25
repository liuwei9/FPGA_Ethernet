module top (
    input         sys_clk          ,
    input         phy_rgmii_rx_clk ,
    input         phy_rgmii_rx_ctl ,
    input   [3:0] phy_rgmii_rx_data,
    output        phy_rgmii_tx_clk ,
    output        phy_rgmii_tx_ctl ,
    output  [3:0] phy_rgmii_tx_data,
    output        phy_rgmii_rst_n  ,

    output [14:0] DDR3_0_addr      ,
    output [2:0]  DDR3_0_ba        ,
    output        DDR3_0_cas_n     ,
    output [0:0]  DDR3_0_ck_n      ,
    output [0:0]  DDR3_0_ck_p      ,
    output [0:0]  DDR3_0_cke       ,
    output [0:0]  DDR3_0_cs_n      ,
    output [3:0]  DDR3_0_dm        ,
    inout  [31:0] DDR3_0_dq        ,
    inout  [3:0]  DDR3_0_dqs_n     ,
    inout  [3:0]  DDR3_0_dqs_p     ,
    output [0:0]  DDR3_0_odt       ,
    output        DDR3_0_ras_n     ,
    output        DDR3_0_reset_n   ,
    output        DDR3_0_we_n      ,

    output        hdmi_out_en1     ,
    output        tmds_clk_p       ,
    output        tmds_clk_n       ,
    output [2:0]  tmds_data_p      ,
    output [2:0]  tmds_data_n       
);

parameter CLOCK_BUFF = "BUFG"       ;
parameter DEVICE     = "XILINX"     ;
parameter IDDR_PRIM  = "IODDR"      ;
parameter CLK_90     = "FALSE"      ;
parameter FLUSH_TIME = 32'hFFFF_FFFF;
parameter USE_FLUSH  = "FALSE"      ;
parameter RERNW_TIME = 16'hFFFF     ;

parameter ETH2DDR_BASEADDR = 32'h0000_0000;

wire clk_125M   ;
wire clk_125M_90;
wire clk_200M;

wire locked;
wire rst;
assign rst = !locked;
assign phy_rgmii_rst_n = 1'b1;
assign hdmi_out_en1 = 1'b1;

wire [15:0] cfg_udp_src_port;
wire [15:0] cfg_udp_dst_port;
wire [31:0] cfg_src_ip      ;
wire [31:0] cfg_dst_ip      ;
wire [10:0] cfg_udp_len     ;
wire [47:0] cfg_src_mac     ;

wire [ 7:0] m_udp_axis_data ;
wire        m_udp_axis_valid;
wire        m_udp_axis_last ;
wire        m_udp_axis_error;

wire [ 7:0] s_udp_axis_data  = 8'd0;
wire        s_udp_axis_valid = 1'd0;
wire        s_udp_axis_last  = 1'd0;
wire        s_udp_axis_ready;


wire  [7:0] ctrl_m_axis_data ;
wire        ctrl_m_axis_valid;
wire        ctrl_m_axis_last ;
wire [15:0] ctrl_m_axis_len  ;
wire        ctrl_m_axis_vsync;

wire        eth2ddr_m_cmd_valid; 
wire [31:0] eth2ddr_m_cmd_addr ; 
wire [31:0] eth2ddr_m_cmd_len  ; 
wire        eth2ddr_m_cmd_ready; 

wire [127:0] eth2ddr_m_axis_data ;
wire [ 15:0] eth2ddr_m_axis_keep ;
wire         eth2ddr_m_axis_valid;
wire         eth2ddr_m_axis_last ;
wire         eth2ddr_m_axis_ready;

(*mark_debug = "true"*)wire [0:0]               eth2ddr_m_axi_awid    ;
(*mark_debug = "true"*)wire [31:0]              eth2ddr_m_axi_awaddr  ;
(*mark_debug = "true"*)wire [7:0]               eth2ddr_m_axi_awlen   ;
(*mark_debug = "true"*)wire [2:0]               eth2ddr_m_axi_awsize  ;
(*mark_debug = "true"*)wire [1:0]               eth2ddr_m_axi_awburst ;
(*mark_debug = "true"*)wire                     eth2ddr_m_axi_awlock  ;
(*mark_debug = "true"*)wire [3:0]               eth2ddr_m_axi_awcache ;
(*mark_debug = "true"*)wire [2:0]               eth2ddr_m_axi_awprot  ;
(*mark_debug = "true"*)wire                     eth2ddr_m_axi_awvalid ;
(*mark_debug = "true"*)wire                     eth2ddr_m_axi_awready ;
(*mark_debug = "true"*)wire [127:0]             eth2ddr_m_axi_wdata   ;
(*mark_debug = "true"*)wire [15:0]              eth2ddr_m_axi_wstrb   ;
(*mark_debug = "true"*)wire                     eth2ddr_m_axi_wlast   ;
(*mark_debug = "true"*)wire                     eth2ddr_m_axi_wvalid  ;
(*mark_debug = "true"*)wire                     eth2ddr_m_axi_wready  ;
(*mark_debug = "true"*)wire [0:0]               eth2ddr_m_axi_bid     ;
(*mark_debug = "true"*)wire [1:0]               eth2ddr_m_axi_bresp   ;
(*mark_debug = "true"*)wire                     eth2ddr_m_axi_bvalid  ;
(*mark_debug = "true"*)wire                     eth2ddr_m_axi_bready  ;

wire [0:0]               eth2ddr_m_axi_arid    ; 
wire [31:0]              eth2ddr_m_axi_araddr  ; 
wire [7:0]               eth2ddr_m_axi_arlen   ; 
wire [2:0]               eth2ddr_m_axi_arsize  ; 
wire [1:0]               eth2ddr_m_axi_arburst ; 
wire                     eth2ddr_m_axi_arlock  ; 
wire [3:0]               eth2ddr_m_axi_arcache ; 
wire [2:0]               eth2ddr_m_axi_arprot  ; 
wire                     eth2ddr_m_axi_arvalid ; 
wire                     eth2ddr_m_axi_arready ; 
wire [0:0]               eth2ddr_m_axi_rid     ; 
wire [127:0]             eth2ddr_m_axi_rdata   ; 
wire [1:0]               eth2ddr_m_axi_rresp   ; 
wire                     eth2ddr_m_axi_rlast   ; 
wire                     eth2ddr_m_axi_rvalid  ; 
wire                     eth2ddr_m_axi_rready  ; 

wire                     hdmi_clk              ;
wire                     hdmi_rst              ; 
wire                     ddr2hdmi_axi_clk      ;     
wire                     ddr2hdmi_axi_rst      ;     

wire [31:0]              hdmi_addr = 32'd0;
wire [31:0]              hdmi_len  = 32'd4147200; //1080P
wire [23:0]              hdmi_data              ;
wire                     hdmi_ready             ;
wire                     hdmi_vsync             ;

(*mark_debug = "true"*)wire                     ddr2hdmi_m_cmd_valid  ;
(*mark_debug = "true"*)wire [31:0]              ddr2hdmi_m_cmd_addr   ;
(*mark_debug = "true"*)wire [31:0]              ddr2hdmi_m_cmd_len    ;
(*mark_debug = "true"*)wire                     ddr2hdmi_m_cmd_ready  ;

(*mark_debug = "true"*)wire [127:0]             ddr2hdmi_s_axis_data  ;
(*mark_debug = "true"*)wire [15:0]              ddr2hdmi_s_axis_keep  = 16'hFFFF;
(*mark_debug = "true"*)wire                     ddr2hdmi_s_axis_valid ;
(*mark_debug = "true"*)wire                     ddr2hdmi_s_axis_last  ;
(*mark_debug = "true"*)wire                     ddr2hdmi_s_axis_ready ;

wire [0:0]               ddr2hdmi_m_axi_awid    ;
wire [31:0]              ddr2hdmi_m_axi_awaddr  ;
wire [7:0]               ddr2hdmi_m_axi_awlen   ;
wire [2:0]               ddr2hdmi_m_axi_awsize  ;
wire [1:0]               ddr2hdmi_m_axi_awburst ;
wire                     ddr2hdmi_m_axi_awlock  ;
wire [3:0]               ddr2hdmi_m_axi_awcache ;
wire [2:0]               ddr2hdmi_m_axi_awprot  ;
wire                     ddr2hdmi_m_axi_awvalid ;
wire                     ddr2hdmi_m_axi_awready ;
wire [127:0]             ddr2hdmi_m_axi_wdata   ;
wire [15:0]              ddr2hdmi_m_axi_wstrb   ;
wire                     ddr2hdmi_m_axi_wlast   ;
wire                     ddr2hdmi_m_axi_wvalid  ;
wire                     ddr2hdmi_m_axi_wready  ;
wire [0:0]               ddr2hdmi_m_axi_bid     ;
wire [1:0]               ddr2hdmi_m_axi_bresp   ;
wire                     ddr2hdmi_m_axi_bvalid  ;
wire                     ddr2hdmi_m_axi_bready  ;

(*mark_debug = "true"*)wire [0:0]               ddr2hdmi_m_axi_arid    ; 
(*mark_debug = "true"*)wire [31:0]              ddr2hdmi_m_axi_araddr  ; 
(*mark_debug = "true"*)wire [7:0]               ddr2hdmi_m_axi_arlen   ; 
(*mark_debug = "true"*)wire [2:0]               ddr2hdmi_m_axi_arsize  ; 
(*mark_debug = "true"*)wire [1:0]               ddr2hdmi_m_axi_arburst ; 
(*mark_debug = "true"*)wire                     ddr2hdmi_m_axi_arlock  ; 
(*mark_debug = "true"*)wire [3:0]               ddr2hdmi_m_axi_arcache ; 
(*mark_debug = "true"*)wire [2:0]               ddr2hdmi_m_axi_arprot  ; 
(*mark_debug = "true"*)wire                     ddr2hdmi_m_axi_arvalid ; 
(*mark_debug = "true"*)wire                     ddr2hdmi_m_axi_arready ; 
(*mark_debug = "true"*)wire [0:0]               ddr2hdmi_m_axi_rid     ; 
(*mark_debug = "true"*)wire [127:0]             ddr2hdmi_m_axi_rdata   ; 
(*mark_debug = "true"*)wire [1:0]               ddr2hdmi_m_axi_rresp   ; 
(*mark_debug = "true"*)wire                     ddr2hdmi_m_axi_rlast   ; 
(*mark_debug = "true"*)wire                     ddr2hdmi_m_axi_rvalid  ; 
(*mark_debug = "true"*)wire                     ddr2hdmi_m_axi_rready  ;

assign cfg_udp_src_port = 16'd8081;
assign cfg_udp_dst_port = 16'd8080;
assign cfg_src_ip       = {8'd192, 8'd168, 8'd1, 8'd100};
assign cfg_dst_ip       = {8'd192, 8'd168, 8'd1, 8'd101};
assign cfg_src_mac      = 48'h11_22_33_44_55_66;

assign ddr2hdmi_axi_clk = clk_200M;  
assign ddr2hdmi_axi_rst = !locked ;     

clk_wiz_0 clk_wiz_0_inst(
    // Clock out ports
    .clk_out1(clk_125M   ),     // output clk_out1
    .clk_out2(clk_125M_90),     // output clk_out2
    .clk_out3(clk_200M   ),     // output clk_out3
    // Status and control signals
    .locked(locked),       // output locked
   // Clock in ports
    .clk_in1(sys_clk)      // input clk_in1
);

eth_top #(
    .CLOCK_BUFF (CLOCK_BUFF),
    .DEVICE     (DEVICE    ),
    .IDDR_PRIM  (IDDR_PRIM ),
    .CLK_90     (CLK_90    ),
    .FLUSH_TIME (FLUSH_TIME),
    .USE_FLUSH  (USE_FLUSH ),
    .RERNW_TIME (RERNW_TIME)    
) eth_top_inst (
    .clk              (clk_125M         ),
    .rst              (rst              ),
    .clk90            (clk_125M_90      ),
    .clk_200M         (clk_200M         ),

    .phy_rgmii_rx_clk (phy_rgmii_rx_clk ),
    .phy_rgmii_rx_ctl (phy_rgmii_rx_ctl ),
    .phy_rgmii_rx_data(phy_rgmii_rx_data),
    .phy_rgmii_tx_clk (phy_rgmii_tx_clk ),
    .phy_rgmii_tx_ctl (phy_rgmii_tx_ctl ),
    .phy_rgmii_tx_data(phy_rgmii_tx_data),

    .cfg_udp_src_port (cfg_udp_src_port ),
    .cfg_udp_dst_port (cfg_udp_dst_port ), 
    .cfg_src_ip       (cfg_src_ip       ),
    .cfg_dst_ip       (cfg_dst_ip       ),
    .cfg_udp_len      (cfg_udp_len      ),
    .cfg_src_mac      (cfg_src_mac      ),

    .m_udp_axis_data  (m_udp_axis_data  ),
    .m_udp_axis_valid (m_udp_axis_valid ),
    .m_udp_axis_last  (m_udp_axis_last  ),
    .m_udp_axis_error (m_udp_axis_error ),

    .s_udp_axis_data  (s_udp_axis_data  ),
    .s_udp_axis_valid (s_udp_axis_valid ),
    .s_udp_axis_last  (s_udp_axis_last  ),
    .s_udp_axis_ready (s_udp_axis_ready )
);

ctrl ctrl_inst(
    .clk          (clk_125M         ),
    .rst          (rst              ),

    .s_axis_data  (m_udp_axis_data  ),
    .s_axis_valid (m_udp_axis_valid ),
    .s_axis_last  (m_udp_axis_last  ),

    .m_axis_data  (ctrl_m_axis_data ),
    .m_axis_valid (ctrl_m_axis_valid),
    .m_axis_last  (ctrl_m_axis_last ),
    .m_axis_len   (ctrl_m_axis_len  ), 
    .m_axis_vsync (ctrl_m_axis_vsync)  

);

eth2ddr eth2ddr_inst(
    .clk          (clk_125M         ),
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

ddr2hdmi ddr2hdmi_inst(
    .clk             (hdmi_clk             ),
    .rst             (hdmi_rst             ),
    .axi_clk         (ddr2hdmi_axi_clk     ),
    .axi_rst         (ddr2hdmi_axi_rst     ),
    
    .vsync           (hdmi_vsync           ),
    .addr            (hdmi_addr            ),
    .len             (hdmi_len             ),

    .s_axis_data     (ddr2hdmi_s_axis_data ),
    .s_axis_keep     (ddr2hdmi_s_axis_keep ),
    .s_axis_valid    (ddr2hdmi_s_axis_valid),
    .s_axis_last     (ddr2hdmi_s_axis_last ),
    .s_axis_ready    (ddr2hdmi_s_axis_ready),

    .m_cmd_valid     (ddr2hdmi_m_cmd_valid ),
    .m_cmd_addr      (ddr2hdmi_m_cmd_addr  ),
    .m_cmd_len       (ddr2hdmi_m_cmd_len   ),
    .m_cmd_ready     (ddr2hdmi_m_cmd_ready ),
     
    .tx_data         (hdmi_data            ),
    .tx_ready        (hdmi_ready           ) 
);

hdmi_top hdmi_top_inst(
    .sys_clk         (clk_200M    ),
    .hdmi_clk        (hdmi_clk    ),
    .hdmi_rst        (hdmi_rst    ),
    
    .tmds_clk_p      (tmds_clk_p  ),    
    .tmds_clk_n      (tmds_clk_n  ),
    .tmds_data_p     (tmds_data_p ),  
    .tmds_data_n     (tmds_data_n ),


    .data_in         (hdmi_data   ),
    .data_in_ready   (hdmi_ready  ),
    .vsyns           (hdmi_vsync  )
);

axi_dma 	#(

    .BURST_LEN    (8  ),
    .ID_WIDTH     (1  ),
    .DATA_WIDTH   (128),
    .KEEP_WIDTH   (16 ) 
)eth2ddr_dma(
    .clk  (clk_125M         ),    // Clock
    .rst  (rst              ),  // Asynchronous reset active high


    .write_cmd_valid                    (eth2ddr_m_cmd_valid),
    .write_cmd_addr                     (eth2ddr_m_cmd_addr ),
    .write_cmd_len                      (eth2ddr_m_cmd_len  ),
    .write_cmd_id                       (1'b0               ),
    .write_cmd_ready                    (eth2ddr_m_cmd_ready),


    .data_in                           (eth2ddr_m_axis_data ),
    .data_in_keep                      (eth2ddr_m_axis_keep ),
    .data_in_valid                     (eth2ddr_m_axis_valid),
    .data_in_last                      (                    ),
    .data_in_ready                     (eth2ddr_m_axis_ready),	
    //trans data in
    .data_out                          (    ),
    .data_out_valid                    (    ),
    .data_out_last                     (    ),
    .data_out_ready                    (1'b0),

    .read_cmd_valid                    (1'b0 ),
    .read_cmd_addr                     (32'd0),
    .read_cmd_len                      (32'd0),
    .read_cmd_id                       (1'b0 ),
    .read_cmd_ready                    (    ),



    .m_axi_awid                        (eth2ddr_m_axi_awid    ),
    .m_axi_awaddr                      (eth2ddr_m_axi_awaddr  ),
    .m_axi_awlen                       (eth2ddr_m_axi_awlen   ),
    .m_axi_awsize                      (eth2ddr_m_axi_awsize  ),
    .m_axi_awburst                     (eth2ddr_m_axi_awburst ),
    .m_axi_awlock                      (eth2ddr_m_axi_awlock  ),
    .m_axi_awcache                     (eth2ddr_m_axi_awcache ),
    .m_axi_awprot                      (eth2ddr_m_axi_awprot  ),
    .m_axi_awvalid                     (eth2ddr_m_axi_awvalid ),
    .m_axi_awready                     (eth2ddr_m_axi_awready ),
    .m_axi_wdata                       (eth2ddr_m_axi_wdata   ),
    .m_axi_wstrb                       (eth2ddr_m_axi_wstrb   ),
    .m_axi_wlast                       (eth2ddr_m_axi_wlast   ),
    .m_axi_wvalid                      (eth2ddr_m_axi_wvalid  ),
    .m_axi_wready                      (eth2ddr_m_axi_wready  ),
    .m_axi_bid                         (eth2ddr_m_axi_bid     ),
    .m_axi_bresp                       (eth2ddr_m_axi_bresp   ),
    .m_axi_bvalid                      (eth2ddr_m_axi_bvalid  ),
    .m_axi_bready                      (eth2ddr_m_axi_bready  ),	

    .m_axi_arid                        (eth2ddr_m_axi_arid   ),
    .m_axi_araddr                      (eth2ddr_m_axi_araddr ),
    .m_axi_arlen                       (eth2ddr_m_axi_arlen  ),
    .m_axi_arsize                      (eth2ddr_m_axi_arsize ),
    .m_axi_arburst                     (eth2ddr_m_axi_arburst),
    .m_axi_arlock                      (eth2ddr_m_axi_arlock ),
    .m_axi_arcache                     (eth2ddr_m_axi_arcache),
    .m_axi_arprot                      (eth2ddr_m_axi_arprot ),
    .m_axi_arvalid                     (eth2ddr_m_axi_arvalid),	
    .m_axi_arready                     (eth2ddr_m_axi_arready),
    .m_axi_rid                         (eth2ddr_m_axi_rid    ),
    .m_axi_rdata                       (eth2ddr_m_axi_rdata  ),
    .m_axi_rresp                       (eth2ddr_m_axi_rresp  ),
    .m_axi_rlast                       (eth2ddr_m_axi_rlast  ),
    .m_axi_rvalid                      (eth2ddr_m_axi_rvalid ),
    .m_axi_rready                      (eth2ddr_m_axi_rready ) 
);

axi_dma 	#(

    .BURST_LEN    (64 ),
    .ID_WIDTH     (1  ),
    .DATA_WIDTH   (128),
    .KEEP_WIDTH   (16 ) 
)ddr2hdmi_dma(
    .clk                                (ddr2hdmi_axi_clk   ),    // Clock
    .rst                                (ddr2hdmi_axi_rst   ),  // Asynchronous reset active high


    .write_cmd_valid                    (1'b0 ),
    .write_cmd_addr                     (32'b0),
    .write_cmd_len                      (32'b0),
    .write_cmd_id                       (1'b0 ),
    .write_cmd_ready                    (     ),


    .data_in                           (16'd0               ),
    .data_in_keep                      (16'd0               ),
    .data_in_valid                     (1'b0                ),
    .data_in_last                      (                    ),
    .data_in_ready                     (                    ),	
    //trans data in
    .data_out                          (ddr2hdmi_s_axis_data ),
    .data_out_valid                    (ddr2hdmi_s_axis_valid),
    .data_out_last                     (ddr2hdmi_s_axis_last ),
    .data_out_ready                    (ddr2hdmi_s_axis_ready),

    .read_cmd_valid                    (ddr2hdmi_m_cmd_valid),
    .read_cmd_addr                     (ddr2hdmi_m_cmd_addr ),
    .read_cmd_len                      (ddr2hdmi_m_cmd_len  ),
    .read_cmd_id                       (1'b0                ),
    .read_cmd_ready                    (ddr2hdmi_m_cmd_ready),



    .m_axi_awid                        (ddr2hdmi_m_axi_awid    ),
    .m_axi_awaddr                      (ddr2hdmi_m_axi_awaddr  ),
    .m_axi_awlen                       (ddr2hdmi_m_axi_awlen   ),
    .m_axi_awsize                      (ddr2hdmi_m_axi_awsize  ),
    .m_axi_awburst                     (ddr2hdmi_m_axi_awburst ),
    .m_axi_awlock                      (ddr2hdmi_m_axi_awlock  ),
    .m_axi_awcache                     (ddr2hdmi_m_axi_awcache ),
    .m_axi_awprot                      (ddr2hdmi_m_axi_awprot  ),
    .m_axi_awvalid                     (ddr2hdmi_m_axi_awvalid ),
    .m_axi_awready                     (ddr2hdmi_m_axi_awready ),
    .m_axi_wdata                       (ddr2hdmi_m_axi_wdata   ),
    .m_axi_wstrb                       (ddr2hdmi_m_axi_wstrb   ),
    .m_axi_wlast                       (ddr2hdmi_m_axi_wlast   ),
    .m_axi_wvalid                      (ddr2hdmi_m_axi_wvalid  ),
    .m_axi_wready                      (ddr2hdmi_m_axi_wready  ),
    .m_axi_bid                         (ddr2hdmi_m_axi_bid     ),
    .m_axi_bresp                       (ddr2hdmi_m_axi_bresp   ),
    .m_axi_bvalid                      (ddr2hdmi_m_axi_bvalid  ),
    .m_axi_bready                      (ddr2hdmi_m_axi_bready  ),	

    .m_axi_arid                        (ddr2hdmi_m_axi_arid   ),
    .m_axi_araddr                      (ddr2hdmi_m_axi_araddr ),
    .m_axi_arlen                       (ddr2hdmi_m_axi_arlen  ),
    .m_axi_arsize                      (ddr2hdmi_m_axi_arsize ),
    .m_axi_arburst                     (ddr2hdmi_m_axi_arburst),
    .m_axi_arlock                      (ddr2hdmi_m_axi_arlock ),
    .m_axi_arcache                     (ddr2hdmi_m_axi_arcache),
    .m_axi_arprot                      (ddr2hdmi_m_axi_arprot ),
    .m_axi_arvalid                     (ddr2hdmi_m_axi_arvalid),	
    .m_axi_arready                     (ddr2hdmi_m_axi_arready),
    .m_axi_rid                         (ddr2hdmi_m_axi_rid    ),
    .m_axi_rdata                       (ddr2hdmi_m_axi_rdata  ),
    .m_axi_rresp                       (ddr2hdmi_m_axi_rresp  ),
    .m_axi_rlast                       (ddr2hdmi_m_axi_rlast  ),
    .m_axi_rvalid                      (ddr2hdmi_m_axi_rvalid ),
    .m_axi_rready                      (ddr2hdmi_m_axi_rready ) 
);


design_1_wrapper design_1_wrapper_inst
   (.DDR3_0_addr       (DDR3_0_addr    ),
    .DDR3_0_ba         (DDR3_0_ba      ),
    .DDR3_0_cas_n      (DDR3_0_cas_n   ),
    .DDR3_0_ck_n       (DDR3_0_ck_n    ),
    .DDR3_0_ck_p       (DDR3_0_ck_p    ),
    .DDR3_0_cke        (DDR3_0_cke     ),
    .DDR3_0_cs_n       (DDR3_0_cs_n    ),
    .DDR3_0_dm         (DDR3_0_dm      ),
    .DDR3_0_dq         (DDR3_0_dq      ),
    .DDR3_0_dqs_n      (DDR3_0_dqs_n   ),
    .DDR3_0_dqs_p      (DDR3_0_dqs_p   ),
    .DDR3_0_odt        (DDR3_0_odt     ),
    .DDR3_0_ras_n      (DDR3_0_ras_n   ),
    .DDR3_0_reset_n    (DDR3_0_reset_n ),
    .DDR3_0_we_n       (DDR3_0_we_n    ),
    .S00_AXI_0_araddr  (eth2ddr_m_axi_araddr ),
    .S00_AXI_0_arburst (eth2ddr_m_axi_arburst),
    .S00_AXI_0_arcache (eth2ddr_m_axi_arcache),
    .S00_AXI_0_arid    (eth2ddr_m_axi_arid   ),
    .S00_AXI_0_arlen   (eth2ddr_m_axi_arlen  ),
    .S00_AXI_0_arlock  (eth2ddr_m_axi_arlock ),
    .S00_AXI_0_arprot  (eth2ddr_m_axi_arprot ),
    .S00_AXI_0_arqos   (),
    .S00_AXI_0_arready (eth2ddr_m_axi_arready),
    .S00_AXI_0_arsize  (eth2ddr_m_axi_arsize ),
    .S00_AXI_0_arvalid (eth2ddr_m_axi_arvalid),
    .S00_AXI_0_awaddr  (eth2ddr_m_axi_awaddr  ),
    .S00_AXI_0_awburst (eth2ddr_m_axi_awburst ),
    .S00_AXI_0_awcache (eth2ddr_m_axi_awcache ),
    .S00_AXI_0_awid    (eth2ddr_m_axi_awid    ),
    .S00_AXI_0_awlen   (eth2ddr_m_axi_awlen   ),
    .S00_AXI_0_awlock  (eth2ddr_m_axi_awlock  ),
    .S00_AXI_0_awprot  (eth2ddr_m_axi_awprot  ),
    .S00_AXI_0_awready (eth2ddr_m_axi_awready ),
    .S00_AXI_0_awsize  (eth2ddr_m_axi_awsize  ),
    .S00_AXI_0_awvalid (eth2ddr_m_axi_awvalid ),
    .S00_AXI_0_bid     (eth2ddr_m_axi_bid     ),
    .S00_AXI_0_bready  (eth2ddr_m_axi_bready  ),
    .S00_AXI_0_bresp   (eth2ddr_m_axi_bresp   ),
    .S00_AXI_0_bvalid  (eth2ddr_m_axi_bvalid  ),
    .S00_AXI_0_rdata   (eth2ddr_m_axi_rdata   ),
    .S00_AXI_0_rid     (eth2ddr_m_axi_rid     ),
    .S00_AXI_0_rlast   (eth2ddr_m_axi_rlast   ),
    .S00_AXI_0_rready  (eth2ddr_m_axi_rready  ),
    .S00_AXI_0_rresp   (eth2ddr_m_axi_rresp   ),
    .S00_AXI_0_rvalid  (eth2ddr_m_axi_rvalid  ),
    .S00_AXI_0_wdata   (eth2ddr_m_axi_wdata   ),
    .S00_AXI_0_wlast   (eth2ddr_m_axi_wlast   ),
    .S00_AXI_0_wready  (eth2ddr_m_axi_wready  ),
    .S00_AXI_0_wstrb   (eth2ddr_m_axi_wstrb   ),
    .S00_AXI_0_wvalid  (eth2ddr_m_axi_wvalid  ),
    
    .S01_AXI_0_araddr  (ddr2hdmi_m_axi_araddr ),
    .S01_AXI_0_arburst (ddr2hdmi_m_axi_arburst),
    .S01_AXI_0_arcache (ddr2hdmi_m_axi_arcache),
    .S01_AXI_0_arid    (ddr2hdmi_m_axi_arid   ),
    .S01_AXI_0_arlen   (ddr2hdmi_m_axi_arlen  ),
    .S01_AXI_0_arlock  (ddr2hdmi_m_axi_arlock ),
    .S01_AXI_0_arprot  (ddr2hdmi_m_axi_arprot ),
    .S01_AXI_0_arqos   (),
    .S01_AXI_0_arready (ddr2hdmi_m_axi_arready),
    .S01_AXI_0_arregion(),
    .S01_AXI_0_arsize  (ddr2hdmi_m_axi_arsize ),
    .S01_AXI_0_arvalid (ddr2hdmi_m_axi_arvalid),
    .S01_AXI_0_awaddr  (ddr2hdmi_m_axi_awaddr  ),
    .S01_AXI_0_awburst (ddr2hdmi_m_axi_awburst ),
    .S01_AXI_0_awcache (ddr2hdmi_m_axi_awcache ),
    .S01_AXI_0_awid    (ddr2hdmi_m_axi_awid    ),
    .S01_AXI_0_awlen   (ddr2hdmi_m_axi_awlen   ),
    .S01_AXI_0_awlock  (ddr2hdmi_m_axi_awlock  ),
    .S01_AXI_0_awprot  (ddr2hdmi_m_axi_awprot  ),
    .S01_AXI_0_awqos   (),
    .S01_AXI_0_awready (ddr2hdmi_m_axi_awready ),
    .S01_AXI_0_awregion(),
    .S01_AXI_0_awsize  (ddr2hdmi_m_axi_awsize  ),
    .S01_AXI_0_awvalid (ddr2hdmi_m_axi_awvalid ),
    .S01_AXI_0_bid     (ddr2hdmi_m_axi_bid     ),
    .S01_AXI_0_bready  (ddr2hdmi_m_axi_bready  ),
    .S01_AXI_0_bresp   (ddr2hdmi_m_axi_bresp   ),
    .S01_AXI_0_bvalid  (ddr2hdmi_m_axi_bvalid  ),
    .S01_AXI_0_rdata   (ddr2hdmi_m_axi_rdata   ),
    .S01_AXI_0_rid     (ddr2hdmi_m_axi_rid     ),
    .S01_AXI_0_rlast   (ddr2hdmi_m_axi_rlast   ),
    .S01_AXI_0_rready  (ddr2hdmi_m_axi_rready  ),
    .S01_AXI_0_rresp   (ddr2hdmi_m_axi_rresp   ),
    .S01_AXI_0_rvalid  (ddr2hdmi_m_axi_rvalid  ),
    .S01_AXI_0_wdata   (ddr2hdmi_m_axi_wdata   ),
    .S01_AXI_0_wlast   (ddr2hdmi_m_axi_wlast   ),
    .S01_AXI_0_wready  (ddr2hdmi_m_axi_wready  ),
    .S01_AXI_0_wstrb   (ddr2hdmi_m_axi_wstrb   ),
    .S01_AXI_0_wvalid  (ddr2hdmi_m_axi_wvalid  ),
    // .sys_clk           (sys_clk               ),
    .eth_clk           (clk_125M              ),
    .eth_rst           (rst                   ),
    .hdmi_clk          (ddr2hdmi_axi_clk      ),
    .hdmi_rst          (ddr2hdmi_axi_rst      )
    );
    
endmodule