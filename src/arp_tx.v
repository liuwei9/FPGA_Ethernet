module arp_tx (
    input         clk              ,
    input         rst              ,

    input  [31:0] cfg_ip           ,
    input  [47:0] cfg_mac          ,

    input         arp_tx_valid     ,
    output        arp_tx_ready     ,
    input  [31:0] arp_tx_ip        ,
    input  [47:0] arp_tx_mac       ,
    input  [ 1:0] arp_tx_op        ,

    output [47:0] m_mac_src_mac    ,
    output [47:0] m_mac_dst_mac    ,
    output [15:0] m_mac_op_len     ,
    output [ 7:0] m_mac_axis_data  ,
    output        m_mac_axis_valid ,
    input         m_mac_axis_ready ,
    output        m_mac_axis_last  

);

localparam IDLE = 3'b001;
localparam SEND = 3'b010;
localparam LAST = 3'b100; 

reg [2:0] curr_state;
reg [2:0] next_state;


reg [47:0] m_mac_src_mac_r;
reg [47:0] m_mac_dst_mac_r;
reg [15:0] m_mac_op_len_r ;

reg [4:0] cnt;

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        curr_state <= IDLE;
    end
    else begin
        curr_state <= next_state;
    end
end

always @(*) begin
    case (curr_state)
        IDLE: begin
            if((m_mac_axis_ready == 1'b1) && (arp_tx_valid == 1'b1))begin
                next_state = SEND;
            end
            else begin
                next_state = IDLE;
            end
        end 
        SEND: begin
            
        end
        LAST: begin
            
        end
        default: begin
            next_state = IDLE;
        end
    endcase
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        m_mac_src_mac_r <= 48'd0;
        m_mac_dst_mac_r <= 48'd0;
        m_mac_op_len_r  <= 16'd0;
    end
    else begin
        if((arp_tx_valid == 1'b1) && (arp_tx_ready == 1'b1))begin
            m_mac_src_mac_r <= cfg_mac;
            m_mac_dst_mac_r <= arp_tx_mac;
            m_mac_op_len_r  <= 16'h0806;
        end
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        cnt <= 5'd0;
    end
    else begin
        if(curr_state == SEND)begin
            cnt <= cnt + 5'd1;
        end
        else begin
            cnt <= 5'd0;
        end
    end
end


    
endmodule