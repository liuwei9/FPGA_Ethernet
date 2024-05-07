module top (
    input         sys_clk          ,
    input         phy_rgmii_rx_clk ,
    input         phy_rgmii_rx_ctl ,
    input   [3:0] phy_rgmii_rx_data,
    output        phy_rgmii_tx_clk ,
    output        phy_rgmii_tx_ctl ,
    output  [3:0] phy_rgmii_tx_data,
    output        phy_rgmii_rst_n   
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

wire [0:0]               eth2ddr_m_axi_awid    ;
wire [31:0]              eth2ddr_m_axi_awaddr  ;
wire [7:0]               eth2ddr_m_axi_awlen   ;
wire [2:0]               eth2ddr_m_axi_awsize  ;
wire [1:0]               eth2ddr_m_axi_awburst ;
wire                     eth2ddr_m_axi_awlock  ;
wire [3:0]               eth2ddr_m_axi_awcache ;
wire [2:0]               eth2ddr_m_axi_awprot  ;
wire                     eth2ddr_m_axi_awvalid ;
wire                     eth2ddr_m_axi_awready ;
wire [127:0]             eth2ddr_m_axi_wdata   ;
wire [15:0]              eth2ddr_m_axi_wstrb   ;
wire                     eth2ddr_m_axi_wlast   ;
wire                     eth2ddr_m_axi_wvalid  ;
wire                     eth2ddr_m_axi_wready  ;
wire [0:0]               eth2ddr_m_axi_bid     ;
wire [1:0]               eth2ddr_m_axi_bresp   ;
wire                     eth2ddr_m_axi_bvalid  ;
wire                     eth2ddr_m_axi_bready  ;

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

assign cfg_udp_src_port = 16'd8081;
assign cfg_udp_dst_port = 16'd8080;
assign cfg_src_ip       = {8'd192, 8'd168, 8'd1, 8'd100};
assign cfg_dst_ip       = {8'd192, 8'd168, 8'd1, 8'd101};
assign cfg_src_mac      = 48'h11_22_33_44_55_66;

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
    .data_in_last                      (eth2ddr_m_axis_last ),
    .data_in_ready                     (eth2ddr_m_axis_ready),	
    //trans data in
    .data_out                          (    ),
    .data_out_valid                    (    ),
    .data_out_last                     (    ),
    .data_out_ready                    (1'b0),

    .read_cmd_valid                    (    ),
    .read_cmd_addr                     (    ),
    .read_cmd_len                      (    ),
    .read_cmd_id                       (    ),
    .read_cmd_ready                    (1'b0),



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
    
endmodule