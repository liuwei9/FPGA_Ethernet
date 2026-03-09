module icmp_rx (
    input         clk              ,
    input         rst              ,

    input  [31:0] s_ip_axis_src_ip ,
    input  [ 7:0] s_ip_axis_data   ,
    input         s_ip_axis_valid  ,
    input         s_ip_axis_last   ,
    input         s_ip_axis_error  ,
    
    output [ 7:0] m_icmp_axis_data ,
    output [15:0] m_icmp_axis_id   ,
    output [15:0] m_icmp_axis_seq  ,
    output [31:0] m_icmp_axis_ip   ,
    output        m_icmp_axis_valid,
    output        m_icmp_axis_last ,
    input         m_icmp_axis_ready
);

localparam IDLE = 2'b01;
localparam DATA = 2'b10;

reg [1:0] curr_state;
reg [1:0] next_state;

reg [7:0] s_ip_axis_data_ff ; 
reg       s_ip_axis_valid_ff;
reg       s_ip_axis_last_ff ;


reg [7:0] type;
reg [7:0] code;
reg [2:0] cnt ;

reg [15:0] id ;
reg [15:0] seq;
reg [31:0] ip ;

reg req_nvalid;
reg data_valid;

always @(posedge clk ) begin
    if(rst)begin
        s_ip_axis_valid_ff <= 1'b0;
        s_ip_axis_last_ff  <= 1'b0;
    end
    else begin
        s_ip_axis_valid_ff <= s_ip_axis_valid;
        s_ip_axis_last_ff  <= s_ip_axis_last ;
    end
end

always @(posedge clk ) begin
    s_ip_axis_data_ff <= s_ip_axis_data;
end

always @(posedge clk ) begin
    if(rst)begin
        curr_state <= IDLE;
    end
    else begin
        curr_state <= next_state;
    end
end

always @(*) begin
    case (curr_state)
        IDLE: begin
            if(s_ip_axis_valid & (!s_ip_axis_valid_ff) & m_icmp_axis_ready)begin
                next_state = DATA;
            end
            else begin
                next_state = IDLE;
            end
        end
        DATA: begin
            if((s_ip_axis_valid_ff & s_ip_axis_last_ff) | req_nvalid)begin
                next_state = IDLE;
            end
            else begin
                next_state = DATA;
            end
        end
        default: begin
            next_state = IDLE;
        end
    endcase
end

always @(posedge clk ) begin
    if(rst)begin
        cnt <= 3'd0;
    end
    else begin
        if(curr_state == DATA)begin
            if(s_ip_axis_valid_ff && (cnt != 3'b111))begin
                cnt <= cnt + 3'd1;
            end
        end
        else begin
            cnt <= 3'd0;
        end
    end
end

always @(posedge clk ) begin
    if(s_ip_axis_valid_ff && (cnt == 3'd0))begin
        type <= s_ip_axis_data_ff;
    end
end

always @(posedge clk ) begin
    if(s_ip_axis_valid_ff && (cnt == 3'd1))begin
        code <= s_ip_axis_data_ff;
    end
end

always @(posedge clk ) begin
    if(s_ip_axis_valid_ff && (cnt == 3'd2) && ((type != 8'h08) || (code != 8'h00)))begin
        req_nvalid <= 1'b1;
    end
    else begin
        req_nvalid <= 1'b0;
    end
end

always @(posedge clk ) begin
    if(rst)begin
        data_valid <= 1'b0;
    end
    else begin
        if(curr_state == IDLE)begin
            data_valid <= 1'b0;
        end
        else if(s_ip_axis_valid_ff && (cnt == 3'd7))begin
            data_valid <= 1'b1;
        end
    end
end

always @(posedge clk ) begin
    if(s_ip_axis_valid_ff)begin
        if(cnt == 3'd4)begin
            id[15:8] <= s_ip_axis_data_ff;
        end
        else if(cnt == 3'd5)begin
            id[ 7:0] <= s_ip_axis_data_ff;
        end
    end
end

always @(posedge clk ) begin
    if(s_ip_axis_valid)begin
        if(cnt == 3'd5)begin
            seq[15:8] <= s_ip_axis_data;
        end
        else if(cnt == 3'd6)begin
            seq[ 7:0] <= s_ip_axis_data;
        end
    end
end

always @(posedge clk ) begin
    if(s_ip_axis_valid_ff & (cnt == 3'd1))begin
        ip <= s_ip_axis_src_ip;
    end
end

assign m_icmp_axis_data  = s_ip_axis_data_ff;
assign m_icmp_axis_id    = id ;
assign m_icmp_axis_seq   = seq;
assign m_icmp_axis_ip    = ip ;
assign m_icmp_axis_valid = s_ip_axis_valid_ff & data_valid;
assign m_icmp_axis_last  = s_ip_axis_last_ff;

endmodule