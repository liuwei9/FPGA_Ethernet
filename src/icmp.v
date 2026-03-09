module icmp (
    input         clk              ,
    input         rst              ,

    input  [31:0] cfg_src_ip       ,

    input  [31:0] s_ip_axis_src_ip ,
    input  [ 7:0] s_ip_axis_data   ,
    input         s_ip_axis_valid  ,
    input         s_ip_axis_last   ,
    input         s_ip_axis_error  ,

    output [7:0]  m_ip_axis_data   ,
    output        m_ip_axis_valid  ,
    output        m_ip_axis_last   ,
    output [15:0] m_ip_axis_len    ,
    input         m_ip_axis_ready  ,

    output        m_ip_req         ,
    input         m_ip_grant       ,
    output [31:0] m_ip_src_ip      ,
    output [31:0] m_ip_dst_ip      

);

wire [ 7:0] m_icmp_axis_data ;
wire [15:0] m_icmp_axis_id   ;
wire [15:0] m_icmp_axis_seq  ;
wire [31:0] m_icmp_axis_ip   ;
wire        m_icmp_axis_valid;
wire        m_icmp_axis_last ;
wire        m_icmp_axis_ready;

    

wire [ 7:0] ping_icmp_axis_data ;
wire [15:0] ping_icmp_axis_id   ;
wire [15:0] ping_icmp_axis_seq  ;
wire [31:0] ping_icmp_axis_ip   ;
wire        ping_icmp_axis_valid;
wire        ping_icmp_axis_last ;
wire        ping_icmp_axis_ready;

wire [7:0]  ping_ip_axis_data   ;
wire        ping_ip_axis_valid  ;
wire        ping_ip_axis_last   ;
wire [15:0] ping_ip_axis_len    ;
wire        ping_ip_axis_ready  ;

wire        ping_ip_req         ;
wire        ping_ip_grant       ;
wire [31:0] ping_ip_src_ip      ;
wire [31:0] ping_ip_dst_ip      ;

wire [ 7:0] pang_icmp_axis_data ;
wire [15:0] pang_icmp_axis_id   ;
wire [15:0] pang_icmp_axis_seq  ;
wire [31:0] pang_icmp_axis_ip   ;
wire        pang_icmp_axis_valid;
wire        pang_icmp_axis_last ;
wire        pang_icmp_axis_ready;

wire [7:0]  pang_ip_axis_data   ;
wire        pang_ip_axis_valid  ;
wire        pang_ip_axis_last   ;
wire [15:0] pang_ip_axis_len    ;
wire        pang_ip_axis_ready  ;

wire        pang_ip_req         ;
wire        pang_ip_grant       ;
wire [31:0] pang_ip_src_ip      ;
wire [31:0] pang_ip_dst_ip      ;

icmp_rx icmp_rx_inst(
    .clk              (clk              ),
    .rst              (rst              ),

    .s_ip_axis_src_ip (s_ip_axis_src_ip ),
    .s_ip_axis_data   (s_ip_axis_data   ),
    .s_ip_axis_valid  (s_ip_axis_valid  ),
    .s_ip_axis_last   (s_ip_axis_last   ),
    .s_ip_axis_error  (s_ip_axis_error  ),

    .m_icmp_axis_data (m_icmp_axis_data ),
    .m_icmp_axis_id   (m_icmp_axis_id   ),
    .m_icmp_axis_seq  (m_icmp_axis_seq  ),
    .m_icmp_axis_ip   (m_icmp_axis_ip   ),
    .m_icmp_axis_valid(m_icmp_axis_valid),
    .m_icmp_axis_last (m_icmp_axis_last ),
    .m_icmp_axis_ready(m_icmp_axis_ready)
);

icmp_tx_ctrl icmp_tx_ctrl_inst(
    .clk                 (clk                 ),
    .rst                 (rst                 ),

    .s_icmp_axis_data    (m_icmp_axis_data    ),
    .s_icmp_axis_id      (m_icmp_axis_id      ),
    .s_icmp_axis_seq     (m_icmp_axis_seq     ),
    .s_icmp_axis_ip      (m_icmp_axis_ip      ),
    .s_icmp_axis_valid   (m_icmp_axis_valid   ),
    .s_icmp_axis_last    (m_icmp_axis_last    ),
    .s_icmp_axis_ready   (m_icmp_axis_ready   ),

    .m_ip_axis_data      (m_ip_axis_data      ),
    .m_ip_axis_valid     (m_ip_axis_valid     ),
    .m_ip_axis_last      (m_ip_axis_last      ),
    .m_ip_axis_len       (m_ip_axis_len       ),
    .m_ip_axis_ready     (m_ip_axis_ready     ),

    .m_ip_req            (m_ip_req            ),
    .m_ip_grant          (m_ip_grant          ),
    .m_ip_src_ip         (m_ip_src_ip         ),
    .m_ip_dst_ip         (m_ip_dst_ip         ),

    .ping_icmp_axis_data (ping_icmp_axis_data ),
    .ping_icmp_axis_id   (ping_icmp_axis_id   ),
    .ping_icmp_axis_seq  (ping_icmp_axis_seq  ),
    .ping_icmp_axis_ip   (ping_icmp_axis_ip   ),
    .ping_icmp_axis_valid(ping_icmp_axis_valid),
    .ping_icmp_axis_last (ping_icmp_axis_last ),
    .ping_icmp_axis_ready(ping_icmp_axis_ready),

    .ping_ip_axis_data   (ping_ip_axis_data   ),
    .ping_ip_axis_valid  (ping_ip_axis_valid  ),
    .ping_ip_axis_last   (ping_ip_axis_last   ),
    .ping_ip_axis_len    (ping_ip_axis_len    ),
    .ping_ip_axis_ready  (ping_ip_axis_ready  ),

    .ping_ip_req         (ping_ip_req         ),
    .ping_ip_grant       (ping_ip_grant       ),
    .ping_ip_src_ip      (ping_ip_src_ip      ),
    .ping_ip_dst_ip      (ping_ip_dst_ip      ),

    .pang_icmp_axis_data (pang_icmp_axis_data ),
    .pang_icmp_axis_id   (pang_icmp_axis_id   ),
    .pang_icmp_axis_seq  (pang_icmp_axis_seq  ),
    .pang_icmp_axis_ip   (pang_icmp_axis_ip   ),
    .pang_icmp_axis_valid(pang_icmp_axis_valid),
    .pang_icmp_axis_last (pang_icmp_axis_last ),
    .pang_icmp_axis_ready(pang_icmp_axis_ready),

    .pang_ip_axis_data   (pang_ip_axis_data   ),
    .pang_ip_axis_valid  (pang_ip_axis_valid  ),
    .pang_ip_axis_last   (pang_ip_axis_last   ),
    .pang_ip_axis_len    (pang_ip_axis_len    ),
    .pang_ip_axis_ready  (pang_ip_axis_ready  ),

    .pang_ip_req         (pang_ip_req         ),
    .pang_ip_grant       (pang_ip_grant       ),
    .pang_ip_src_ip      (pang_ip_src_ip      ),
    .pang_ip_dst_ip      (pang_ip_dst_ip      )
);

icmp_tx icmp_tx_ping(
    .clk               (clk                 ),
    .rst               (rst                 ),

    .cfg_src_ip        (cfg_src_ip          ),

    .s_icmp_axis_data  (ping_icmp_axis_data ),
    .s_icmp_axis_id    (ping_icmp_axis_id   ),
    .s_icmp_axis_seq   (ping_icmp_axis_seq  ),
    .s_icmp_axis_ip    (ping_icmp_axis_ip   ),
    .s_icmp_axis_valid (ping_icmp_axis_valid),
    .s_icmp_axis_last  (ping_icmp_axis_last ),
    .s_icmp_axis_ready (ping_icmp_axis_ready),

    .m_ip_axis_data    (ping_ip_axis_data   ),
    .m_ip_axis_valid   (ping_ip_axis_valid  ),
    .m_ip_axis_last    (ping_ip_axis_last   ),
    .m_ip_axis_len     (ping_ip_axis_len    ),
    .m_ip_axis_ready   (ping_ip_axis_ready  ),

    .m_ip_req          (ping_ip_req         ),
    .m_ip_grant        (ping_ip_grant       ),
    .m_ip_src_ip       (ping_ip_src_ip      ),
    .m_ip_dst_ip       (ping_ip_dst_ip      )
);

icmp_tx icmp_tx_pang(
    .clk               (clk                 ),
    .rst               (rst                 ),

    .cfg_src_ip        (cfg_src_ip          ),

    .s_icmp_axis_data  (pang_icmp_axis_data ),
    .s_icmp_axis_id    (pang_icmp_axis_id   ),
    .s_icmp_axis_seq   (pang_icmp_axis_seq  ),
    .s_icmp_axis_ip    (pang_icmp_axis_ip   ),
    .s_icmp_axis_valid (pang_icmp_axis_valid),
    .s_icmp_axis_last  (pang_icmp_axis_last ),
    .s_icmp_axis_ready (pang_icmp_axis_ready),

    .m_ip_axis_data    (pang_ip_axis_data   ),
    .m_ip_axis_valid   (pang_ip_axis_valid  ),
    .m_ip_axis_last    (pang_ip_axis_last   ),
    .m_ip_axis_len     (pang_ip_axis_len    ),
    .m_ip_axis_ready   (pang_ip_axis_ready  ),

    .m_ip_req          (pang_ip_req         ),
    .m_ip_grant        (pang_ip_grant       ),
    .m_ip_src_ip       (pang_ip_src_ip      ),
    .m_ip_dst_ip       (pang_ip_dst_ip      )
);
    
endmodule