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

localparam IDLE  = 5'b00001;
localparam RECV  = 5'b00010;
localparam WAIT  = 5'b00100;
localparam PRE   = 5'b00100;
localparam SEND  = 5'b10000;

reg [4:0] curr_state;
reg [4:0] next_state;

genvar i;
reg [ 7:0] s_mac_axis_data_ff[13:0] ;
reg        s_mac_axis_valid_ff[13:0];
reg        s_mac_axis_last_ff[13:0] ;

reg [3:0] pre_cnt;

reg [103:0] eth_frame_head;

reg  [ 7:0] wdata;
reg         wen  ;
reg  [10:0] waddr;
wire        ren  ;
wire [10:0] raddr;
wire [ 7:0] rdata;

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
            if((m_eth_axis_last == 1'b1) && (m_eth_axis_valid == 1'b1))begin
                next_state = IDLE;
            end
            else begin
                next_state = SEND;
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

assign s_mac_axis_ready = curr_state == IDLE;


tpram #(
    .DP (2048),
    .WD (8   )
) tpram_inst (
    .clk      (clk),
    .wdata    (),
    .wen      (),
    .waddr    (),
    .ren      (),
    .raddr    (),
    .rdata    ()

);



endmodule