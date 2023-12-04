module arp_ctrl #(
    parameter FLUSH_TIME = 32'hFFFF_FFFF,
    parameter USE_FLUSH  = "TRUE"
) (
    input         clk                     ,
    input         rst                     ,

    output        arp_rx_req_ready        ,
    input         arp_rx_req_arp          , 
    input [47:0]  arp_rx_req_src_mac      ,
    input [47:0]  arp_rx_req_dst_mac      ,
    input [31:0]  arp_rx_req_src_ip       ,
    input [31:0]  arp_rx_req_dst_ip       ,

    output        arp_rx_resp_ready       ,
    input         arp_rx_resp_arp         , 
    input  [47:0] arp_rx_resp_src_mac     ,
    input  [47:0] arp_rx_resp_dst_mac     ,
    input  [31:0] arp_rx_resp_src_ip      ,
    input  [31:0] arp_rx_resp_dst_ip      ,

    output        query_ready             ,
    input         query_valid             ,
    input  [31:0] query_ip                ,

    output [47:0] query_resp_mac          ,
    output [31:0] query_resp_ip           ,
    output        query_resp_valid         
);

wire ready;

arp_cache #(
    .FLUSH_TIME (FLUSH_TIME),
    .USE_FLUSH  (USE_FLUSH )
) arp_cache_inst (
    .clk        (clk                ),
    .rst        (rst                ),
    .w_valid    (arp_rx_resp_arp    ),
    .wip        (arp_rx_resp_src_ip ),
    .wmac       (arp_rx_resp_src_mac),
    .r_valid    (),
    .rip        (),
    .rmac       (),
    .hit        (), //01-->hit 10-->miss 
    .ready      (ready) 
);
    
endmodule