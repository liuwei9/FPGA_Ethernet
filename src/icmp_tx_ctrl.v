module icmp_tx_ctrl (
    input         clk                 ,
    input         rst                 ,

    input  [ 7:0] s_icmp_axis_data    ,
    input  [15:0] s_icmp_axis_id      ,
    input  [15:0] s_icmp_axis_seq     ,
    input  [31:0] s_icmp_axis_ip      ,
    input         s_icmp_axis_valid   ,
    input         s_icmp_axis_last    ,
    output        s_icmp_axis_ready   ,

    output [7:0]  m_ip_axis_data      ,
    output        m_ip_axis_valid     ,
    output        m_ip_axis_last      ,
    output [15:0] m_ip_axis_len       ,
    input         m_ip_axis_ready     ,

    output        m_ip_req            ,
    input         m_ip_grant          ,
    output [31:0] m_ip_src_ip         ,
    output [31:0] m_ip_dst_ip         ,

    output [ 7:0] ping_icmp_axis_data ,
    output [15:0] ping_icmp_axis_id   ,
    output [15:0] ping_icmp_axis_seq  ,
    output [31:0] ping_icmp_axis_ip   ,
    output        ping_icmp_axis_valid,
    output        ping_icmp_axis_last ,
    input         ping_icmp_axis_ready,

    input  [7:0]  ping_ip_axis_data   ,
    input         ping_ip_axis_valid  ,
    input         ping_ip_axis_last   ,
    input  [15:0] ping_ip_axis_len    ,
    output        ping_ip_axis_ready  ,

    input         ping_ip_req         ,
    output        ping_ip_grant       ,
    input  [31:0] ping_ip_src_ip      ,
    input  [31:0] ping_ip_dst_ip      ,

    output [ 7:0] pang_icmp_axis_data ,
    output [15:0] pang_icmp_axis_id   ,
    output [15:0] pang_icmp_axis_seq  ,
    output [31:0] pang_icmp_axis_ip   ,
    output        pang_icmp_axis_valid,
    output        pang_icmp_axis_last ,
    input         pang_icmp_axis_ready,

    input  [7:0]  pang_ip_axis_data   ,
    input         pang_ip_axis_valid  ,
    input         pang_ip_axis_last   ,
    input  [15:0] pang_ip_axis_len    ,
    output        pang_ip_axis_ready  ,

    input         pang_ip_req         ,
    output        pang_ip_grant       ,
    input  [31:0] pang_ip_src_ip      ,
    input  [31:0] pang_ip_dst_ip      
);

reg w_ping;
reg r_ping;

always @(posedge clk ) begin
    if(rst)begin
        w_ping <= 1'b0;
    end
    else begin
        if(s_icmp_axis_valid & s_icmp_axis_last)begin
            w_ping <= !w_ping;
        end
    end
end

always @(posedge clk ) begin
    if(rst)begin
        r_ping <= 1'b0;
    end
    else begin
        if(m_ip_axis_valid & m_ip_axis_last)begin
            r_ping <= !r_ping;
        end
    end
end

assign ping_icmp_axis_data  = s_icmp_axis_data ;
assign ping_icmp_axis_id    = s_icmp_axis_id   ;
assign ping_icmp_axis_seq   = s_icmp_axis_seq  ;
assign ping_icmp_axis_ip    = s_icmp_axis_ip   ;
assign ping_icmp_axis_valid = w_ping == 1'b0 ? s_icmp_axis_valid : 1'b0;
assign ping_icmp_axis_last  = w_ping == 1'b0 ? s_icmp_axis_last  : 1'b0;

assign pang_icmp_axis_data  = s_icmp_axis_data ;
assign pang_icmp_axis_id    = s_icmp_axis_id   ;
assign pang_icmp_axis_seq   = s_icmp_axis_seq  ;
assign pang_icmp_axis_ip    = s_icmp_axis_ip   ;
assign pang_icmp_axis_valid = w_ping == 1'b1 ? s_icmp_axis_valid : 1'b0;
assign pang_icmp_axis_last  = w_ping == 1'b1 ? s_icmp_axis_last  : 1'b0;

assign s_icmp_axis_ready    = w_ping == 1'b0 ? ping_icmp_axis_ready : pang_icmp_axis_ready;

assign m_ip_axis_data  = r_ping == 1'b0 ? ping_ip_axis_data  : pang_ip_axis_data ;
assign m_ip_axis_valid = r_ping == 1'b0 ? ping_ip_axis_valid : pang_ip_axis_valid;
assign m_ip_axis_last  = r_ping == 1'b0 ? ping_ip_axis_last  : pang_ip_axis_last ;
assign m_ip_axis_len   = r_ping == 1'b0 ? ping_ip_axis_len   : pang_ip_axis_len  ;

assign ping_ip_axis_ready = r_ping == 1'b0 ? m_ip_axis_ready : 1'b0;
assign pang_ip_axis_ready = r_ping == 1'b1 ? m_ip_axis_ready : 1'b0;

assign ping_ip_grant = r_ping == 1'b0 ? m_ip_grant : 1'b0;
assign pang_ip_grant = r_ping == 1'b1 ? m_ip_grant : 1'b0;

assign m_ip_req    = r_ping == 1'b0 ? ping_ip_req    : pang_ip_req   ;
assign m_ip_src_ip = r_ping == 1'b0 ? ping_ip_src_ip : pang_ip_src_ip;
assign m_ip_dst_ip = r_ping == 1'b0 ? ping_ip_dst_ip : pang_ip_dst_ip;


endmodule