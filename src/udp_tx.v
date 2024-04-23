module udp_tx (
    input         clk              ,
    input         rst              ,

    input  [15:0] cfg_udp_src_port ,
    input  [15:0] cfg_udp_dst_port ,
    input  [31:0] cfg_src_ip       ,
    input  [31:0] cfg_dst_ip       ,
    input  [10:0] cfg_udp_len      ,

    input  [ 7:0] s_udp_axis_data  ,
    input         s_udp_axis_valid ,
    input         s_udp_axis_last  ,
    output        s_udp_axis_ready ,

    output [7:0]  m_ip_axis_data   ,
    output        m_ip_axis_valid  ,
    output        m_ip_axis_last   ,
    output [15:0] m_ip_axis_len    ,
    input         m_ip_axis_ready  ,

    output        m_ip_req         ,
    input         m_ip_grant        

);

localparam IDLE  = 7'b0000001;
localparam WRITE = 7'b0000010;
localparam WAIT  = 7'b0000100;
localparam REQ   = 7'b0001000;
localparam READY = 7'b0010000;
localparam HEAD  = 7'b0100000;
localparam READ  = 7'b1000000;

reg [6:0] curr_state;
reg [6:0] next_state;

wire [ 8:0] wdata;
wire        wen  ;
reg  [10:0] waddr;
wire        ren  ;
reg  [10:0] raddr;
wire [ 8:0] rdata;
reg         ren_ff;

reg  [ 3:0] wait_cnt;

reg         s_udp_axis_valid_ff;

reg         s_udp_axis_fire;
reg         s_udp_axis_fire_last;

reg [15:0] cfg_udp_src_port_r;
reg [15:0] cfg_udp_dst_port_r;
reg [31:0] cfg_src_ip_r      ;
reg [31:0] cfg_dst_ip_r      ;
reg [15:0] cfg_udp_len_r     ;

reg [16:0] fcs;
reg [ 1:0] fcs_cnt;
reg [31:0] data_temp;

reg [159:0] check_head;

reg [63:0] head;
reg [ 2:0] head_cnt;
reg [ 7:0] udp_head;
reg        udp_head_valid;

reg [ 7:0] udp_data;
reg        udp_data_valid;
reg        udp_data_last ;

reg [7:0]  m_ip_axis_data_r ;
reg        m_ip_axis_valid_r;
reg        m_ip_axis_last_r ;
reg [15:0] m_ip_axis_len_r  ;

reg        m_ip_req_r;

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        s_udp_axis_valid_ff <= 1'b0;
    end
    else begin
        s_udp_axis_valid_ff <= s_udp_axis_valid;
    end
end

always @(posedge clk ) begin
    if((s_udp_axis_valid == 1'b1) && (curr_state == IDLE))begin
        cfg_udp_src_port_r <= cfg_udp_src_port;
        cfg_udp_dst_port_r <= cfg_udp_dst_port;
        cfg_src_ip_r       <= cfg_src_ip      ;
        cfg_dst_ip_r       <= cfg_dst_ip      ;
        cfg_udp_len_r      <= cfg_udp_len + 11'd8   ;
    end
end

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
            if(s_udp_axis_valid == 1'b1)begin
                next_state = WRITE;
            end
            else begin
                next_state = IDLE;
            end
        end 
        WRITE: begin
            if((s_udp_axis_valid == 1'b1) && (s_udp_axis_last == 1'b1))begin
                next_state = WAIT;
            end
            else begin
                next_state = WRITE;
            end
        end
        WAIT: begin
            if(wait_cnt == 4'b1111)begin
                next_state =REQ;
            end
            else begin
                next_state = WAIT;
            end
        end
        REQ: begin
            if((m_ip_req_r == 1'b1) && (m_ip_grant == 1'b1))begin
                next_state =HEAD;
            end
            else begin
                next_state = REQ;
            end
        end
        READY: begin
            if(m_ip_axis_ready == 1'b1)begin
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
            if((ren_ff == 1'b1) && (rdata[8] == 1'b1))begin
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
    if(rst == 1'b1)begin
        wait_cnt <= 4'd0;
    end
    else begin
        if(curr_state == WAIT)begin
            wait_cnt <= wait_cnt + 4'd1;
        end
        else begin
            wait_cnt <= 4'd0;
        end
    end
end

assign wen = s_udp_axis_valid;
assign s_udp_axis_ready = (curr_state == IDLE) || (curr_state == WRITE);
always @(posedge clk ) begin
    if(rst == 1'b1)begin
        waddr <= 11'd0;
    end
    else begin
        if(s_udp_axis_valid == 1'b1)begin
            if(s_udp_axis_last == 1'b1)begin
                waddr <= 11'd0;
            end
            else begin
                waddr <= waddr + 11'd1;
            end
        end
    end
end

assign ren = ((curr_state == READ) && (rdata[8] == 1'b0));
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
        raddr <= 11'd0;
    end
    else begin
        if(ren == 1'b1)begin
            raddr <= raddr + 11'd1;
        end
        else begin
            raddr <= 11'd0;
        end
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

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        fcs_cnt <= 2'b0;
    end
    else begin
        if((s_udp_axis_valid == 1'b1) && (s_udp_axis_ready == 1'b1))begin
            fcs_cnt <= fcs_cnt + 2'b1;
        end
        else begin
            fcs_cnt <= 2'b0;
        end
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        data_temp <= 32'd0;
    end
    else begin
        if((s_udp_axis_valid == 1'b1) && (s_udp_axis_ready == 1'b1))begin
            case (fcs_cnt)
                2'd0: begin
                    data_temp <= {s_udp_axis_data, 24'd0};
                end 
                2'd1: begin
                    data_temp <= {data_temp[31:24], s_udp_axis_data, 16'd0};
                end 
                2'd2: begin
                    data_temp <= {data_temp[31:16], s_udp_axis_data, 8'd0};
                end 
                2'd3: begin
                    data_temp <= {data_temp[31:8], s_udp_axis_data};
                end 
            endcase
        end
        else begin
            if(curr_state == READ)begin
                data_temp <= 32'd0;
            end
        end
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        s_udp_axis_fire <= 1'b0;
        s_udp_axis_fire_last <= 1'b0;
    end
    else begin
        s_udp_axis_fire <= (s_udp_axis_valid == 1'b1) && (s_udp_axis_ready == 1'b1);
        s_udp_axis_fire_last <= (s_udp_axis_valid == 1'b1) && (s_udp_axis_ready == 1'b1) && (s_udp_axis_last == 1'b1);
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        fcs <= 17'd0;
        check_head <= 16'd0;
    end
    else begin
        if((curr_state == WAIT) && (wait_cnt == 4'd0))begin
            check_head <= {cfg_src_ip_r, cfg_dst_ip_r, 8'd0, 8'd17, cfg_udp_len_r, cfg_udp_src_port_r, cfg_udp_dst_port_r, cfg_udp_len_r, 8'd0};
        end

        if(s_udp_axis_fire == 1'b1)begin
            fcs <= ((fcs + data_temp) & 17'hFFFF) + ((fcs + data_temp) & 17'1_0000);
        end
        else begin
            if((wait_cnt > 4'd0) && (wait_cnt < 4'd11))begin
                fcs <= ((fcs + check_head[159 -: 16]) & 17'hFFFF) + ((fcs + check_head[159 -: 16]) & 17'1_0000);
                check_head <= check_head << 5'd16;
            end
            else begin
                if(wait_cnt == 4'd11)begin
                    fcs <= ~fcs;
                end
            end
        end
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        head <= 64'd0;
        udp_head <= 8'd0;
        udp_head_valid <= 1'b0;
    end
    else begin
        if(wait_cnt == 4'd12)begin
            head <= {cfg_udp_src_port_r, cfg_udp_dst_port_r, cfg_udp_len_r, fcs[15:0]};
        end
        if(curr_state == HEAD)begin
            udp_head <= head[63 -: 8];
            head <= head << 4'd8;
            udp_head_valid <= 1'b1;
        end
        else begin
            udp_head <= 8'd0;
            udp_head_valid <= 1'b0;
        end
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        udp_data <= 8'd0;
        udp_data_valid <= 1'b0;
        udp_data_last  <= 1'b0;
    end
    else begin
        udp_data <= ren_ff;
        udp_data_valid <= rdata[7:0];
        udp_data_last  <= rdata[8];
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        m_ip_axis_data_r  <= 8'd0;
        m_ip_axis_valid_r <= 1'b0;
        m_ip_axis_last_r  <= 1'b0;
    end
    else begin
        if(udp_head_valid == 1'b1)begin
            m_ip_axis_data_r  <= udp_head;
            m_ip_axis_valid_r <= 1'b1;
            m_ip_axis_last_r  <= 1'b0;
        end
        else if(udp_data_valid == 1'b1)begin
            m_ip_axis_data_r  <= udp_data;
            m_ip_axis_valid_r <= 1'b1;
            m_ip_axis_last_r  <= udp_data_last;
        end
        else begin
            m_ip_axis_data_r  <= 8'd0;
            m_ip_axis_valid_r <= 1'b0;
            m_ip_axis_last_r  <= 1'b0;
        end
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        m_ip_axis_len_r <= 16'd0;
    end
    else begin
        if(curr_state == WAIT)begin
            m_ip_axis_len_r <= cfg_udp_len_r;
        end
    end
end

assign m_ip_axis_data  = m_ip_axis_data_r ;
assign m_ip_axis_valid = m_ip_axis_valid_r;
assign m_ip_axis_last  = m_ip_axis_last_r ;
assign m_ip_axis_len   = m_ip_axis_len_r  ;

tpram #(
    .DP    (2048),
    .WD    (9   )
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