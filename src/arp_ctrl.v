module arp_ctrl #(
    parameter FLUSH_TIME = 32'hFFFF_FFFF,
    parameter USE_FLUSH  = "TRUE"
) (
    input         clk                     ,
    input         rst                     ,

    output        arp_rx_req_ready        ,
    input         arp_rx_req_arp          , 
    input [47:0]  arp_rx_req_src_mac      ,
    input [47:0]  arp_rx_req_dst_mac      ,
    input [31:0]  arp_rx_req_src_ip       ,
    input [31:0]  arp_rx_req_dst_ip       ,

    output        arp_rx_resp_ready       ,
    input         arp_rx_resp_arp         , 
    input  [47:0] arp_rx_resp_src_mac     ,
    input  [47:0] arp_rx_resp_dst_mac     ,
    input  [31:0] arp_rx_resp_src_ip      ,
    input  [31:0] arp_rx_resp_dst_ip      ,

    output        query_ready             ,
    input         query_valid             ,
    input  [31:0] query_ip                ,

    output [47:0] query_resp_mac          ,
    output [31:0] query_resp_ip           ,
    output        query_resp_valid        ,

    input         arp_tx_ready            ,
    output [47:0] arp_tx_mac              ,
    output [47:0] arp_tx_ip               ,
    output [ 1:0] arp_tx_op                
);

localparam QUERY_IDLE  = 5'b00001;
localparam QUERY_CACHE = 5'b00010;
localparam QUERY_TX    = 5'b00100;
localparam QUERY_WAIT  = 5'b01000;
localparam QUERY_RESP  = 5'b10000;

reg [4:0] query_curr_state;
reg [4:0] query_next_state;


wire ready;

reg [31:0] query_ip_ff;
reg        query_ready_r;
reg        query_state;

reg         arp_cache_r_valid;
reg  [31:0] arp_cache_r_ip   ;
wire [47:0] arp_cache_r_mac  ;
wire [ 1:0] arp_cache_r_hit  ;

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        query_state <= 1'b0;
    end
    else begin
        if((query_ready_r == 1'b1) && (query_valid == 1'b1))begin
            query_state <= 1'b1;
        end
        else if(query_resp_valid == 1'b1)begin
            query_state <= 1'b0;
        end
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        query_ready_r <= 1'b0;
    end
    else begin
        if(query_state == 1'b0)begin
            if((query_ready_r == 1'b1) && (query_valid == 1'b1))begin
                query_ready_r <= 1'b0;
            end
            else begin
                query_ready_r <= 1'b1;
            end
        end
        else begin
            query_ready_r <= 1'b0;
        end
    end
end
assign query_ready = query_ready_r;

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        query_curr_state <= QUERY_IDLE;
    end
    else begin
        query_curr_state <= query_next_state;
    end
end

always @(*) begin
    case (query_curr_state)
        QUERY_IDLE: begin
            if((query_ready == 1'b1) && (query_valid == 1'b1))begin
                query_next_state = QUERY_CACHE;
            end
            else begin
                query_next_state = QUERY_IDLE;
            end
        end 
        QUERY_CACHE: begin
            if(hit == 2'b01)begin
                query_next_state = QUERY_RESP;
            end
            else if(hit == 2'b10)begin
                query_next_state = QUERY_TX;
            end
            else begin
                query_next_state = QUERY_CACHE;
            end
        end
        QUERY_TX: begin
            
        end
        QUERY_WAIT: begin
            
        end
        QUERY_RESP: begin
            
        end
        default: begin
            query_next_state = QUERY_IDLE;
        end
    endcase
end


always @(posedge clk ) begin
    if(rst == 1'b1)begin
        query_ip_ff <= 32'd0;
    end
    else begin
        if((query_ready == 1'b1) && (query_valid == 1'b1))begin
            query_ip_ff <= query_ip;
        end
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        arp_cache_r_ip <= 32'd0;
        arp_cache_r_valid <= 1'b0;
    end
    else begin
        if((query_curr_state == QUERY_IDLE) && (query_next_state == QUERY_CACHE))begin
            arp_cache_r_ip <= query_ip;
            arp_cache_r_valid <= 1'b1;
        end
        else begin
            arp_cache_r_ip <= 32'd0;
            arp_cache_r_valid <= 1'b0;
        end
    end
end



assign arp_rx_resp_ready = ready;


arp_cache #(
    .FLUSH_TIME (FLUSH_TIME),
    .USE_FLUSH  (USE_FLUSH )
) arp_cache_inst (
    .clk        (clk                ),
    .rst        (rst                ),
    .w_valid    (arp_rx_resp_arp    ),
    .wip        (arp_rx_resp_src_ip ),
    .wmac       (arp_rx_resp_src_mac),
    .r_valid    (arp_cache_r_valid  ),
    .rip        (arp_cache_r_ip     ),
    .rmac       (arp_cache_r_mac    ),
    .hit        (arp_cache_r_hit    ), //01-->hit 10-->miss 
    .ready      (ready              ) 
);
    
endmodule