module gmii_axis#(
 
) (

    input  [7:0] mac_rx_gmii_data ,
    input        mac_rx_gmii_clk  ,
    input        mac_rx_gmii_dv   ,
    input        mac_rx_gmii_err  ,    
    output [7:0] m_eth_axis_data  ,
    output       m_eth_axis_valid ,
    output       m_eth_axis_last  ,
    output       m_eth_axis_error ,

    output [7:0] mac_tx_gmii_data ,
    output       mac_tx_gmii_clk  ,
    output       mac_tx_gmii_dv   ,
    input  [7:0] s_eth_axis_data  ,
    input        s_eth_axis_valid ,
    input        s_eth_axis_last  
);

    
endmodule