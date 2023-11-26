module rgmii_phy #(
    parameter CLOCK_BUFF = "BUFG"  ,
    parameter DEVICE     = "XILINX",
    parameter IDDR_PRIM  = "IODDR" ,
    parameter CLK_90     = "TRUE"   
) (
    input        clk           ,
    input        rst           ,
    input        clk90         ,

    input        phy_rgmii_clk ,
    input        phy_rgmii_ctl ,
    input  [3:0] phy_rgmii_data,

    output [7:0] mac_gmii_data ,
    output       mac_gmii_clk  ,
    output       mac_gmii_dv   ,
    output       mac_gmii_err  
);

rgmii_rx #(
    .CLOCK_BUFF  (CLOCK_BUFF),
    .DEVICE      (DEVICE    ),
    .IDDR_PRIM   (IDDR_PRIM )
) rgmii_rx_inst (
    .phy_rgmii_clk  (phy_rgmii_clk ),
    .phy_rgmii_ctl  (phy_rgmii_ctl ),
    .phy_rgmii_data (phy_rgmii_data),

    .mac_gmii_data  (mac_gmii_data ),
    .mac_gmii_clk   (mac_gmii_clk  ),
    .mac_gmii_dv    (mac_gmii_dv   ),
    .mac_gmii_err   (mac_gmii_err  ) 

);
    
endmodule