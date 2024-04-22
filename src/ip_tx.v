module ip_tx (
    input         clk              ,
    input         rst              ,

    input         s_udp_ip_req     ,
    output        s_udp_ip_grant   ,

    input  [ 7:0] s_ip_protocol    ,
    input  [ 7:0] s_ip_axis_data   ,
    input         s_ip_axis_valid  ,
    input         s_ip_axis_last   ,
    output        s_ip_axis_ready  ,

    output [47:0] m_mac_src_mac    ,
    output [47:0] m_mac_dst_mac    ,
    output [15:0] m_mac_op_len     ,
    output [ 7:0] m_mac_axis_data  ,
    output        m_mac_axis_valid ,
    output        m_mac_axis_last  ,
    input         m_mac_axis_ready ,
    output        m_mac_req        ,
    input         m_mac_grant        
);

localparam REQ_NUM = 1;

localparam IDLE     = 4'b0001;
localparam WAIT     = 4'b0010;
localparam UDP_HEAD = 4'b0100;
localparam UDP_DATA = 4'b1000;

reg [3:0] curr_state;
reg [3:0] next_state;

reg m_mac_req_r;

wire [REQ_NUM - 1:0] req;

reg  [REQ_NUM - 1:0] grant_ff;
wire [REQ_NUM - 1:0] grant   ;

assign req = (curr_state == IDLE) ? s_udp_ip_req : 1'b0;

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        curr_state <= IDLE;
    end
    else begin
        curr_state <= next_state;
    end
end

always @(*)begin
    case (curr_state)
        IDLE: begin
            if(|req)begin
                next_state = WAIT;
            end
            else begin
                next_state = IDLE;
            end
        end 
        WAIT: begin
            if(m_mac_grant == 1'b1)begin
                if(grant_ff[0] == 1'b1)begin
                    next_state = UDP_HEAD;
                end
                else begin
                    next_state = UDP_HEAD;
                end         
            end
            else begin
                next_state = WAIT;
            end
        end
        UDP_HEAD: begin
            
        end
        default: begin
            next_state = IDLE;
        end
    endcase
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        m_mac_req_r <= 1'b0;
    end
    else begin
        if(curr_state == WAIT)begin
            if((m_mac_req_r == 1'b1) && (m_mac_grant == 1'b1))begin
                m_mac_req_r <= 1'b0;
            end
            else begin
                m_mac_req_r <= 1'b1;
            end
        end
        else begin
            m_mac_req_r <= 1'b0;
        end
    end
end

assign m_mac_req = m_mac_req_r;

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        grant_ff <= {REQ_NUM{1'b0}};
    end
    else begin
        if(curr_state == IDLE)begin
            grant_ff <= grant;
        end
        else begin
            if(m_mac_grant == 1'b1)begin
                grant_ff <= {REQ_NUM{1'b0}};
            end
        end
    end
end

arbiter_rr #(
    .REQ_NUM (REQ_NUM)
) arbiter_rr_inst (
    .clk     (clk     ),
    .rst     (rst     ),
    .req     (req_ff  ),
    .grant   (grant) 
);

endmodule