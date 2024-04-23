module ip_tx (
    input         clk                  ,
    input         rst                  ,

    input         s_udp_ip_req         ,
    output        s_udp_ip_grant       ,

    input  [ 7:0] s_udp_ip_axis_data   ,
    input         s_udp_ip_axis_valid  ,
    input         s_udp_ip_axis_last   ,
    input  [15:0] s_udp_ip_axis_len    ,
    input  [31:0] s_udp_ip_axis_src_ip ,
    input  [31:0] s_udp_ip_axis_dst_ip ,
    output        s_udp_ip_axis_ready  ,

    output [47:0] m_mac_src_mac        ,
    output [47:0] m_mac_dst_mac        ,
    output [15:0] m_mac_op_len         ,
    output [ 7:0] m_mac_axis_data      ,
    output        m_mac_axis_valid     ,
    output        m_mac_axis_last      ,
    input         m_mac_axis_ready     ,
    output        m_mac_req            ,
    input         m_mac_grant            
);

localparam REQ_NUM = 1;
localparam ICMP = 8'd1 ;
localparam TCP  = 8'd6 ;
localparam UDP  = 8'd17;

integer i;

localparam IDLE= 3'b001;
localparam WAIT= 3'b010;
localparam UDP = 3'b100;

reg [2:0] curr_state;
reg [2:0] next_state;

reg m_mac_req_r;

wire [REQ_NUM - 1:0] req;

reg  [REQ_NUM - 1:0] grant_ff;
wire [REQ_NUM - 1:0] grant   ;

reg [ 7:0] s_udp_ip_axis_data_ff [20:0]; 
reg [20:0] s_udp_ip_axis_valid_ff      ;
reg [20:0] s_udp_ip_axis_last_ff       ;

reg [ 7:0] s_ip_protocol_r;
reg [15:0] s_ip_len_r     ;
reg [31:0] s_ip_src_ip_r  ;
reg [31:0] s_ip_dst_ip_r  ;

reg [16:0] fcs;
reg [16:0] fcs_src_ip;
reg [16:0] fcs_dst_ip;
reg [16:0] fcs_len_index;
reg [16:0] fcs_protocol;

reg [ 7:0] index;

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
                    next_state = UDP;
                end
                else begin
                    next_state = UDP;
                end         
            end
            else begin
                next_state = WAIT;
            end
        end
        UDP: begin
            
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

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        s_ip_axis_data_ff[0] <= 8'b0;
        s_ip_axis_valid_ff   <= 21'b0;
        s_ip_axis_last_ff    <= 21'b0;
    end
    else begin
        if(curr_state == UDP)begin
            s_ip_axis_data_ff[0] <= s_udp_ip_axis_data ;
            s_ip_axis_valid_ff   <= {s_udp_ip_axis_valid_ff[19:0], s_udp_ip_axis_valid};
            s_ip_axis_last_ff    <= {s_udp_ip_axis_last_ff [19:0], s_udp_ip_axis_last };
        end      
    end
end

generate
    for (i = 0; i < 20; i = i + 1) begin : LOOP_UDP_DATA
        always @(posedge clk ) begin
            s_ip_axis_data_ff[i + 1] <= s_ip_axis_data_ff[i];
        end
    end
endgenerate

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        s_ip_protocol_r <=  8'd0;
        s_ip_len_r      <= 16'd0;
        s_ip_src_ip_r   <= 31'd0;
        s_ip_dst_ip_r   <= 31'd0;
    end
    else begin
        if((s_udp_ip_axis_valid == 1'b1) && (s_ip_axis_valid_ff[0] == 1'b0))begin
            s_ip_protocol_r <= UDP;
            s_ip_len_r      <= s_udp_ip_axis_len + 16'd20;
            s_ip_src_ip_r   <= s_udp_ip_axis_src_ip;
            s_ip_dst_ip_r   <= s_udp_ip_axis_dst_ip; 
        end
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        index <= 8'd0;
    end
    else begin
        if((curr_state == IDLE) && (next_state == WAIT))begin
            index <= index + 8'd1;
        end
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        fcs_src_ip <= 17'd0;
        fcs_dst_ip <= 17'd0;
        fcs_len_index <= 17'd0;
        fcs_protocol  <= 17'd0;
    end
    else begin
        if((s_ip_axis_valid_ff[0] == 1'b1) && (s_ip_axis_valid_ff[1] == 1'b0))begin
            fcs_src_ip <= ((s_ip_src_ip_r[15:0] + s_ip_src_ip_r[31:16]) & 17'hFFFF) + ((s_ip_src_ip_r[15:0] + s_ip_src_ip_r[31:16]) & 17'1_0000);
            fcs_dst_ip <= ((s_ip_dst_ip_r[15:0] + s_ip_dst_ip_r[31:16]) & 17'hFFFF) + ((s_ip_dst_ip_r[15:0] + s_ip_dst_ip_r[31:16]) & 17'1_0000);
            fcs_len_index <= ((index + s_ip_len_r) & 17'hFFFF) + ((index + s_ip_len_r) & 17'1_0000);
            fcs_protocol  <= {8'h40, s_ip_protocol_r};
        end
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        fcs <= 17'h8500; // 0x4500 + 0x4000
    end
    else begin
        if(curr_state == IDLE)begin
            fcs <= 17'h8500;
        end
        else if((s_ip_axis_valid_ff[1] == 1'b1) && (s_ip_axis_valid_ff[2] == 1'b0))begin
            fcs <= ((fcs + fcs_src_ip) & 17'hFFFF) + ((fcs + fcs_src_ip) & 17'1_0000);
        end
        else if((s_ip_axis_valid_ff[2] == 1'b1) && (s_ip_axis_valid_ff[3] == 1'b0))begin
            fcs <= ((fcs + fcs_dst_ip) & 17'hFFFF) + ((fcs + fcs_dst_ip) & 17'1_0000);
        end
        else if((s_ip_axis_valid_ff[3] == 1'b1) && (s_ip_axis_valid_ff[4] == 1'b0))begin
            fcs <= ((fcs + fcs_len_index) & 17'hFFFF) + ((fcs + fcs_len_index) & 17'1_0000);
        end
        else if((s_ip_axis_valid_ff[4] == 1'b1) && (s_ip_axis_valid_ff[5] == 1'b0))begin
            fcs <= ((fcs + fcs_protocol) & 17'hFFFF) + ((fcs + fcs_protocol) & 17'1_0000);
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