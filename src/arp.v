module arp (
    input        clk              ,
    input        rst              ,

    input [47:0] s_mac_src_mac    ,
    input [47:0] s_mac_dst_mac    ,
    input [15:0] s_mac_op_len     ,
    input [ 7:0] s_mac_axis_data  ,
    input        s_mac_axis_valid ,
    input        s_mac_axis_last  ,
    input        s_mac_axis_error  
);
    
endmodule