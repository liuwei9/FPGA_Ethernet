module udp (
    input         clk              ,
    input         rst              ,

    input  [15:0] cfg_udp_src_port ,
    input  [15:0] cfg_udp_dst_port ,

    input  [ 7:0] s_ip_axis_data   ,
    input         s_ip_axis_valid  ,
    input         s_ip_axis_last   ,
    input         s_ip_axis_error  ,

    output [ 7:0] m_udp_axis_data  ,
    output        m_udp_axis_valid ,
    output        m_udp_axis_last  ,
    output        m_udp_axis_error 
);

udp_rx udp_rx_inst(
    .clk              (clk             ),
    .rst              (rst             ),

    .cfg_udp_src_port (cfg_udp_src_port),
    .cfg_udp_dst_port (cfg_udp_dst_port),

    .s_ip_axis_data   (s_ip_axis_data ),
    .s_ip_axis_valid  (s_ip_axis_valid),
    .s_ip_axis_last   (s_ip_axis_last ),
    .s_ip_axis_error  (s_ip_axis_error),

    .m_udp_axis_data  (m_udp_axis_data ),
    .m_udp_axis_valid (m_udp_axis_valid),
    .m_udp_axis_last  (m_udp_axis_last ),
    .m_udp_axis_error (m_udp_axis_error)  
);
    
endmodule