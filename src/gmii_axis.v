module gmii_axis#(
    parameter DEVICE     = "XILINX"
) (
    input        clk              ,
    input        rst              ,

    input        mac_rx_gmii_clk  ,
    input  [7:0] mac_rx_gmii_data ,
    input        mac_rx_gmii_dv   ,
    input        mac_rx_gmii_err  ,    
    output [7:0] m_eth_axis_data  ,
    output       m_eth_axis_valid ,
    output       m_eth_axis_last  ,
    output       m_eth_axis_error ,

    output       mac_tx_gmii_clk  ,
    output [7:0] mac_tx_gmii_data ,
    output       mac_tx_gmii_dv   ,
    input  [7:0] s_eth_axis_data  ,
    input        s_eth_axis_valid ,
    input        s_eth_axis_last  
);

 gmii_axis_rx #(
    .DEVICE     (DEVICE)
 ) gmii_axis_rx_inst (
    .clk              (clk              ),
    .rst              (rst              ),
    .mac_rx_gmii_clk  (mac_rx_gmii_clk  ),
    .mac_rx_gmii_data (mac_rx_gmii_data ),
    .mac_rx_gmii_dv   (mac_rx_gmii_dv   ),
    .mac_rx_gmii_err  (mac_rx_gmii_err  ),    
    .m_eth_axis_data  (m_eth_axis_data  ),
    .m_eth_axis_valid (m_eth_axis_valid ),
    .m_eth_axis_last  (m_eth_axis_last  ),
    .m_eth_axis_error (m_eth_axis_error )
);

    
endmodule