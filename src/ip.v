module ip (
    input         clk              ,
    input         rst              ,
    input  [31:0] cfg_ip           ,  

    input  [47:0] s_mac_src_mac    ,
    input  [47:0] s_mac_dst_mac    ,
    input  [15:0] s_mac_op_len     ,
    input  [ 7:0] s_mac_axis_data  ,
    input         s_mac_axis_valid ,
    input         s_mac_axis_last  ,
    input         s_mac_axis_error ,
);

localparam ICMP = 8'd1 ;
localparam TCP  = 8'd6 ;
localparam UDP  = 8'd17;

wire [ 7:0] m_ip_protocol  ;
wire [ 7:0] m_ip_axis_data ;
wire        m_ip_axis_valid;
wire        m_ip_axis_last ;
wire        m_ip_axis_error;

reg [ 7:0] m_ip_axis_data_ff  ;
reg        m_ip_axis_last_ff  ;
reg        m_ip_axis_error_ff ;
reg        m_ip_udp_axis_valid;

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        m_ip_axis_data_ff   <= 8'b0;
        m_ip_axis_last_ff   <= 1'b0;
        m_ip_axis_error_ff  <= 1'b0;
        m_ip_udp_axis_valid <= 1'b0;
    end
    else begin
        m_ip_axis_data_ff   <= m_ip_axis_data ;
        m_ip_axis_last_ff   <= m_ip_axis_last ;
        m_ip_axis_error_ff  <= m_ip_axis_error;
        m_ip_udp_axis_valid <= m_ip_axis_valid && (m_ip_protocol == UDP);
    end
end

ip_rx ip_rx_inst(
    .clk              (clk             ),
    .rst              (rst             ),

    .cfg_ip           (cfg_ip          ),  

    .s_mac_src_mac    (s_mac_src_mac   ),
    .s_mac_dst_mac    (s_mac_dst_mac   ),
    .s_mac_op_len     (s_mac_op_len    ),
    .s_mac_axis_data  (s_mac_axis_data ),
    .s_mac_axis_valid (s_mac_axis_valid),
    .s_mac_axis_last  (s_mac_axis_last ),
    .s_mac_axis_error (s_mac_axis_error),

    .m_ip_protocol    (m_ip_protocol   ),
    .m_ip_axis_data   (m_ip_axis_data  ),
    .m_ip_axis_valid  (m_ip_axis_valid ),
    .m_ip_axis_last   (m_ip_axis_last  ),
    .m_ip_axis_error  (m_ip_axis_error ) 
);
    
endmodule