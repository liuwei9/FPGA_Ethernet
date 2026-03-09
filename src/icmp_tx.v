module icmp_tx (
    input         clk              ,
    input         rst              ,

    input  [31:0] cfg_src_ip       ,

    input  [ 7:0] s_icmp_axis_data ,
    input  [15:0] s_icmp_axis_id   ,
    input  [15:0] s_icmp_axis_seq  ,
    input  [31:0] s_icmp_axis_ip   ,
    input         s_icmp_axis_valid,
    input         s_icmp_axis_last ,
    output        s_icmp_axis_ready,

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

localparam IDLE  = 6'b00_0001;
localparam WRITE = 6'b00_0010;
localparam REQ   = 6'b00_0100;
localparam READY = 6'b00_1000;
localparam HEAD  = 6'b01_0000;
localparam READ  = 6'b10_0000;

reg [5:0] curr_state;
reg [5:0] next_state;

reg [ 7:0] s_icmp_axis_data_ff ; 
reg [31:0] s_icmp_axis_ip_ff   ;  
reg [15:0] s_icmp_axis_id_ff   ; 
reg [15:0] s_icmp_axis_seq_ff  ; 
reg        s_icmp_axis_valid_ff;
reg        s_icmp_axis_last_ff ; 

reg        s_icmp_axis_valid_2ff;
reg        s_icmp_axis_last_2ff ; 

reg [ 2:0] head_cnt ;
reg [63:0] icmp_head;
reg [ 7:0] head      ;
reg        head_valid;

wire [7:0] wdata;
wire       wen  ;
reg  [4:0] waddr;
wire       ren  ;
reg  [4:0] raddr;
wire [7:0] rdata;
reg        ren_ff;
reg  [4:0] r_len ;
reg        r_last;

reg [16:0] fcs;
reg        fcs_cnt  ;
reg [15:0] data_temp;
reg        fcs_fire ;

reg [ 7:0] icmp_data;
reg        icmp_data_valid;
reg        icmp_data_last ;

reg [7:0]  m_ip_axis_data_r ;
reg        m_ip_axis_valid_r;
reg        m_ip_axis_last_r ;
reg [15:0] m_ip_axis_len_r  ;
reg [31:0] m_ip_src_ip_r; 
reg [31:0] m_ip_dst_ip_r; 

reg        m_ip_req_r;


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
            if(s_icmp_axis_valid)begin
                next_state = WRITE;
            end
            else begin
                next_state = IDLE ;
            end
        end
        WRITE: begin
            if(s_icmp_axis_valid_ff & s_icmp_axis_last_ff)begin
                next_state = REQ;
            end
            else begin
                next_state = WRITE;
            end
        end
        REQ: begin
            if(m_ip_req & m_ip_grant)begin
                next_state = READY;
            end
            else begin
                next_state = REQ;
            end
        end
        READY: begin
            if(m_ip_axis_ready)begin
                next_state = HEAD;
            end
            else begin
                next_state = READY;
            end
        end
        HEAD: begin
            if(head_cnt == 3'b111)begin
                next_state = READ;
            end
            else begin
                next_state = HEAD;
            end
        end
        READ: begin
            if((ren == 1'b1) && (raddr == r_len))begin
                next_state = IDLE;
            end
            else begin
                next_state = READ;
            end
        end
        default: begin
            next_state = IDLE;
        end
    endcase
end

always @(posedge clk ) begin
    s_icmp_axis_data_ff <= s_icmp_axis_data;
end

always @(posedge clk ) begin
    if(rst)begin
        s_icmp_axis_valid_ff  <= 1'b0; 
        s_icmp_axis_last_ff   <= 1'b0;

        s_icmp_axis_valid_2ff <= 1'b0; 
        s_icmp_axis_last_2ff  <= 1'b0;
    end
    else begin
        s_icmp_axis_valid_ff  <= s_icmp_axis_valid;
        s_icmp_axis_last_ff   <= s_icmp_axis_last ;

        s_icmp_axis_valid_2ff <= s_icmp_axis_valid_ff;
        s_icmp_axis_last_2ff  <= s_icmp_axis_last_ff ;
    end
end

always @(posedge clk ) begin
    if((curr_state == IDLE) && (s_icmp_axis_valid == 1'b1))begin
        s_icmp_axis_ip_ff  <= s_icmp_axis_ip ;
        s_icmp_axis_id_ff  <= s_icmp_axis_id ;
        s_icmp_axis_seq_ff <= s_icmp_axis_seq;
    end
end

assign wen   = s_icmp_axis_valid_ff;
assign wdata = s_icmp_axis_data_ff ;

always @(posedge clk ) begin
    if(rst)begin
        waddr <= 5'd0;
    end
    else begin
        if(wen)begin
            if(s_icmp_axis_last_ff)begin
                waddr <= 5'd0;
            end
            else begin
                waddr <= waddr + 5'd1;
            end
        end
    end
end

always @(posedge clk ) begin
    if(s_icmp_axis_valid_ff & s_icmp_axis_last_ff)begin
        r_len <= waddr;
    end
end

always @(posedge clk ) begin
    if(rst)begin
        fcs_cnt <= 1'b0;
    end
    else begin
        if(s_icmp_axis_valid)begin
            fcs_cnt <= ~fcs_cnt;
        end
        else begin
            fcs_cnt <= 1'b0;
        end
    end
end

always @(posedge clk ) begin
    if(s_icmp_axis_valid)begin
        if(fcs_cnt == 1'b0)begin
            data_temp <= {s_icmp_axis_data, 8'd0};
        end
        else begin
            data_temp <= {data_temp[15:8], s_icmp_axis_data};
        end
    end
end

always @(posedge clk ) begin
    if(rst)begin
        fcs_fire <= 1'b0;
    end
    else begin
        fcs_fire <= s_icmp_axis_valid & fcs_cnt;
    end
end

always @(posedge clk ) begin
    if(rst)begin
        fcs <= 17'd0;
    end
    else begin
        if((curr_state == IDLE) && (s_icmp_axis_valid))begin
            fcs <= s_icmp_axis_id + s_icmp_axis_seq;
        end
        else if(fcs_fire)begin
            fcs <= fcs[15:0] + data_temp + fcs[16];
        end
        else if(s_icmp_axis_valid_2ff & s_icmp_axis_last_2ff)begin
            fcs <= ~(fcs[15:0] + fcs[16]);
        end
    end
end

always @(posedge clk ) begin
    if(rst)begin
        icmp_head  <= 64'd0;
        head       <= 8'd0 ;
        head_valid <= 1'b0 ;
    end
    else if(curr_state == READY)begin
        icmp_head  <= {8'd0, 8'd0, fcs[15:0], s_icmp_axis_id_ff, s_icmp_axis_seq_ff};
        head       <= 8'd0 ;
        head_valid <= 1'b0 ;
    end
    else if(curr_state == HEAD)begin
        icmp_head  <= icmp_head << 4'd8 ;
        head       <= icmp_head[63 -: 8];
        head_valid <= 1'b1 ;
    end
    else begin
        icmp_head  <= 64'd0;
        head       <= 8'd0 ;
        head_valid <= 1'b0 ;
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        head_cnt <= 3'd0;
    end
    else begin
        if(curr_state == HEAD)begin
            if(head_cnt != 3'b111)begin
                head_cnt <= head_cnt + 3'd1;
            end
        end
        else begin
            head_cnt <= 3'd0;
        end
    end
end

assign ren = (curr_state == READ);
always @(posedge clk ) begin
    if(rst == 1'b1)begin
        ren_ff <= 1'b0;
    end
    else begin
        ren_ff <= ren;
    end
end
always @(posedge clk ) begin
    if(rst == 1'b1)begin
        raddr <= 5'd0;
    end
    else begin
        if(ren == 1'b1)begin
            raddr <= raddr + 5'd1;
        end
        else begin
            raddr <= 5'd0;
        end
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        r_last <= 1'b0;
    end
    else begin
        r_last <= (ren == 1'b1) && (raddr == r_len);
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        icmp_data <= 8'd0;
        icmp_data_valid <= 1'b0;
        icmp_data_last  <= 1'b0;
    end
    else begin
        icmp_data <= rdata[7:0];
        icmp_data_valid <= ren_ff;
        icmp_data_last  <= r_last;
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        m_ip_axis_data_r  <= 8'd0;
        m_ip_axis_valid_r <= 1'b0;
        m_ip_axis_last_r  <= 1'b0;
    end
    else begin
        if(head_valid == 1'b1)begin
            m_ip_axis_data_r  <= head;
            m_ip_axis_valid_r <= 1'b1;
            m_ip_axis_last_r  <= 1'b0;
        end
        else if(icmp_data_valid == 1'b1)begin
            m_ip_axis_data_r  <= icmp_data;
            m_ip_axis_valid_r <= 1'b1;
            m_ip_axis_last_r  <= icmp_data_last;
        end
        else begin
            m_ip_axis_data_r  <= 8'd0;
            m_ip_axis_valid_r <= 1'b0;
            m_ip_axis_last_r  <= 1'b0;
        end
    end
end

always @(posedge clk ) begin
    if(curr_state == REQ)begin
        m_ip_axis_len_r <= r_len + 16'd9;//head-->8
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        m_ip_req_r <= 1'b0;
    end
    else begin
        if(curr_state == REQ)begin
            if((m_ip_req_r == 1'b1) && (m_ip_grant == 1'b1))begin
                m_ip_req_r <= 1'b0;
            end
            else begin
                m_ip_req_r <= 1'b1;
            end
        end
        else begin
            m_ip_req_r <= 1'b0;
        end
    end
end

assign m_ip_req = m_ip_req_r;
assign m_ip_axis_data  = m_ip_axis_data_r ;
assign m_ip_axis_valid = m_ip_axis_valid_r;
assign m_ip_axis_last  = m_ip_axis_last_r ;
assign m_ip_axis_len   = m_ip_axis_len_r  ;
assign m_ip_src_ip     = cfg_src_ip       ;
assign m_ip_dst_ip     = s_icmp_axis_ip_ff;

assign s_icmp_axis_ready = curr_state == IDLE;

tpram #(
    .DP    (32  ),
    .WD    (8   )
) tpram_inst (
    .clk   (clk  ),
    .wdata (wdata),
    .wen   (wen  ),
    .waddr (waddr),
    .ren   (ren  ),
    .raddr (raddr),
    .rdata (rdata)

);
    
endmodule