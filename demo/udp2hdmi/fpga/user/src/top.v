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
    
endmodule