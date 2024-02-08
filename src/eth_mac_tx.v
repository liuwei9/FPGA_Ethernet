module eth_mac_tx (
    input clk,
    input rst,
    
    input  [47:0] s_mac_src_mac    ,
    input  [47:0] s_mac_dst_mac    ,
    input  [15:0] s_mac_op_len     ,     
    input  [ 7:0] s_mac_axis_data  ,
    input         s_mac_axis_valid ,
    output        s_mac_axis_ready ,
    input         s_mac_axis_last  ,

    output [ 7:0] m_eth_axis_data  ,
    output        m_eth_axis_valid ,
    input         m_eth_axis_ready ,
    output        m_eth_axis_last   
);

localparam IDLE  = 6'b000001;
localparam RECV  = 6'b000010;
localparam WAIT  = 6'b000100;
localparam PRE   = 6'b000100;
localparam SEND  = 6'b010000;
localparam FCS   = 6'b100000;

reg [5:0] curr_state;
reg [5:0] next_state;

genvar i;
reg [ 7:0] s_mac_axis_data_ff[13:0] ;
reg        s_mac_axis_valid_ff[13:0];
reg        s_mac_axis_last_ff[13:0] ;

reg [ 3:0] pre_cnt ;
reg [10:0] send_cnt;
reg [10:0] recv_len;
reg [ 1:0] fcs_cnt ;

reg [103:0] eth_frame_head;

reg  [ 7:0] wdata;
reg         wen  ;
reg  [10:0] waddr;
wire        ren  ;
wire [10:0] raddr;
wire [ 7:0] rdata;

wire [31:0] crc_out ;
reg         crc_clr ;
reg  [31:0] crc_data;

reg  [ 7:0] tx_data ;
reg         tx_valid;
reg         tx_last ;
reg  [63:0] tx_pre  ;
reg  [31:0] tx_fcs  ;

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
            if((s_mac_axis_ready == 1'b1) && (s_mac_axis_valid == 1'b1))begin
                next_state = RECV;
            end
            else begin
                next_state = IDLE;
            end
        end 
        RECV: begin
            if((s_mac_axis_valid_ff[13] == 1'b1) && (s_mac_axis_last_ff[13] == 1'b1))begin
                next_state = WAIT;
            end
            else begin
                next_state = RECV;
            end
        end
        WAIT: begin
            if(m_eth_axis_ready == 1'b1)begin
                next_state = PRE;
            end
            else begin
                next_state = WAIT;
            end
        end
        PRE: begin
            if(pre_cnt == 4'd7)begin
                next_state = SEND;
            end
            else begin
                next_state = PRE;
            end
        end
        SEND: begin
            if(send_cnt == recv_len)begin
                next_state = FCS;
            end
            else begin
                next_state = SEND;
            end
        end
        FCS: begin
            if(fcs_cnt == 2'b11)begin
                next_state = IDLE;
            end
            else begin
                next_state = FCS;
            end
        end
        default: begin
            next_state = IDLE;
        end
    endcase
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        s_mac_axis_data_ff[0]  <= 8'd0;
        s_mac_axis_valid_ff[0] <= 1'b0;
        s_mac_axis_last_ff[0]  <= 1'b0;
    end
    else begin
        s_mac_axis_data_ff[0]  <= s_mac_axis_data ;
        s_mac_axis_valid_ff[0] <= s_mac_axis_valid;
        s_mac_axis_last_ff[0]  <= s_mac_axis_last ;
    end
end

generate
    for (i = 1; i < 14; i = i + 1) begin
        always @(posedge clk ) begin
            if(rst == 1'b1)begin
                s_mac_axis_data_ff[i]  <= 8'd0;
                s_mac_axis_valid_ff[i] <= 1'b0;
                s_mac_axis_last_ff[i]  <= 1'b0;
            end
            else begin
                s_mac_axis_data_ff[i]  <= s_mac_axis_data_ff[i - 1] ;
                s_mac_axis_valid_ff[i] <= s_mac_axis_valid_ff[i - 1];
                s_mac_axis_last_ff[i]  <= s_mac_axis_last_ff[i - 1] ;
            end
        end
    end
endgenerate

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        wen <= 1'b0;
    end
    else begin
        if(((curr_state == IDLE) && (s_mac_axis_valid == 1'b1)) || (curr_state == RECV))begin
            wen <= 1'b1;
        end
        else begin
            wen <= 1'b0;
        end
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        waddr <= 11'd0;
    end
    else begin
        if(wen == 1'b1)begin
            waddr <= waddr + 11'd1;
        end
        else begin
            waddr <= 11'd0;
        end
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        wdata <= 8'd0;
        eth_frame_head <= 104'd0;
    end
    else begin
        if((curr_state == IDLE) && (s_mac_axis_valid == 1'b1))begin
            wdata <= s_mac_dst_mac[47 -: 8];
            eth_frame_head <= {s_mac_dst_mac[39:0], s_mac_src_mac, s_mac_op_len};
        end
        else begin
            if((s_mac_axis_valid == 1'b1) && (s_mac_axis_valid_ff[13] == 1'b0))begin
                wdata <= eth_frame_head[103 -: 8];
                eth_frame_head <= eth_frame_head << 4'd8;
            end
            else begin
                wdata <= s_mac_axis_data_ff[13];
            end
        end
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        recv_len <= 11'd0;
    end
    else begin
        if(curr_state == IDLE)begin
            recv_len <= 11'd0;
        end
        else begin
            if(wen == 1'b1)begin
                recv_len <= recv_len + 11'd1;
            end
        end
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        crc_clr <= 1'b0;
    end
    else begin
        if(curr_state == IDLE)begin
            crc_clr <= 1'b1;
        end
        else begin
            crc_clr <= 1'b0;
        end
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        crc_data <= 31'd0;
    end
    else begin
        if(curr_state == WAIT)begin
            crc_data <= crc_out;
        end
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        send_cnt <= 11'd0;
    end
    else begin
        if(ren == 1'b1)begin
            send_cnt <= send_cnt + 11'd1;
        end
        else begin
            send_cnt <= 11'd0;
        end
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        pre_cnt <= 4'd0;
    end
    else begin
        if(curr_state == PRE)begin
            pre_cnt <= pre_cnt + 4'd1;
        end
        else begin
            pre_cnt <= 4'd0;
        end
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        tx_data  <= 8'b0;
        tx_valid <= 1'b0;
        tx_pre   <= {8'h55, 8'h55, 8'h55, 8'h55, 8'h55, 8'h55, 8'h55, 8'hd5};
        tx_fcs   <= 32'd0;
    end
    else begin
        if(curr_state == IDLE)begin
            tx_pre <= {8'h55, 8'h55, 8'h55, 8'h55, 8'h55, 8'h55, 8'h55, 8'hd5};
        end
        if(curr_state == PRE)begin
            tx_data  <= tx_pre[63 -: 8];
            tx_valid <= 1'b1;
            tx_pre   <= tx_pre << 4'd8;
            tx_fcs   <= crc_data;
        end
        else if(curr_state == SEND)begin
            tx_data  <= rdata;
            tx_valid <= 1'b1;
        end
        else if(curr_state == FCS)begin
            tx_data  <= tx_fcs[31 -: 8];
            tx_valid <= 1'b1;
            tx_fcs   <= tx_fcs << 3'd8;
        end
        else begin
            tx_data  <= 8'b0;
            tx_valid <= 1'b0;
        end
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        tx_last <= 1'b0;
    end
    else begin
        if(fcs_cnt == 2'b11)begin
            tx_last <= 1'b1;
        end
        else begin
            tx_last <= 1'b0;
        end
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        fcs_cnt <= 2'b0;
    end
    else begin
        if(curr_state == FCS)begin
            fcs_cnt <= fcs_cnt + 2'b1;
        end
        else begin
            fcs_cnt <= 2'b0;
        end
    end
end

assign s_mac_axis_ready = curr_state == IDLE;
assign ren = (curr_state == SEND) || ((curr_state == PRE) && (next_state == SEND));
assign raddr = send_cnt;

assign m_eth_axis_data  = tx_data ;
assign m_eth_axis_valid = tx_valid;
assign m_eth_axis_last  = tx_last ;

tpram #(
    .DP (2048),
    .WD (8   )
) tpram_inst (
    .clk      (clk  ),
    .wdata    (wdata),
    .wen      (wen  ),
    .waddr    (waddr),
    .ren      (ren  ),
    .raddr    (raddr),
    .rdata    (rdata)

);

crc crc_inst(

    .rst          (rst    ),
    .clk          (clk    ),
    .crc_data_in  (wdata  ),
    .crc_en       (wen    ),
    .crc_clr      (crc_clr),
    .crc_out      (crc_out)

);

endmodule