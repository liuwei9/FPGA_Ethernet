module ctrl (
    input       clk         ,
    input       rst         ,

    input [7:0] s_axis_data ,
    input       s_axis_valid,
    input       s_axis_last ,
);

genvar i;

localparam HEAD = 4'b0001;
localparam DATA = 4'b0010;
localparam CTRL = 4'b0100;
localparam TAIL = 4'b1000;

reg [3:0] curr_state;
reg [3:0] next_state;

reg [7:0] s_axis_data_ff  [26:0];
reg       s_axis_valid_ff [26:0];
reg       s_axis_last_ff  [26:0]; 

reg [199:0] head;
reg         head_check;
reg         head_ctrl ;

reg [15:0]  img_h         ;
reg [15:0]  img_w         ;
reg [31:0]  total_packet  ;
reg [15:0]  algorithm_ctrl;

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        curr_state <= HEAD;
    end
    else begin
        curr_state <= next_state;
    end
end

always @(*) begin
    case (curr_state)
        HEAD: begin
            if(check_head == 1'b1)begin
                if(head_ctrl == 1'b0)begin
                    next_state = DATA;
                end
                else begin
                    next_state = CTRL;
                end
            end
            else begin
                next_state = HEAD;
            end
        end
        DATA: begin
            
        end
        CTRL: begin
            
        end
        TAIL: begin
            
        end
        default: begin
            next_state = IDLE;
        end
    endcase
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        s_axis_data_ff[0] <= 8'b0;
        s_axis_valid_ff   <= 8'b0;
        s_axis_last_ff    <= 8'b0;
    end
    else begin
        s_axis_data_ff[0] <= s_axis_data;
        s_axis_valid_ff   <= {s_axis_valid_ff[6:0], s_axis_valid};
        s_axis_last_ff    <= {s_axis_last_ff [6:0], s_axis_last };
    end
end

generate
    for (i = 0; i < 26; i = i + 1) begin : LOOP_S_DATA
        always @(posedge clk ) begin
            if(rst == 1'b1)begin
                s_axis_data_ff[i + 1] <= 8'b0;
            end
            else begin
                s_axis_data_ff[i + 1] <= s_axis_data_ff[i];
            end
        end
    end
endgenerate

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        head <= 200'd0;
    end
    else begin
        if((curr_state == HEAD) && (s_axis_valid == 1'b1))begin
            head <= {head[191:0], s_axis_data};
        end
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        head_check <= 1'b0;
        head_ctrl  <= 1'b0;

        img_h          <= 16'd0;
        img_w          <= 16'd0;
        total_packet   <= 32'd0;
        algorithm_ctrl <= 16'd0;
    end
    else begin
        if((curr_state == HEAD) && (s_axis_valid_ff[25] == 1'b1))begin
            head_check <= (head[199 -: 64] == 64'h7755_2211_3366_1155) && (head[0 +: 64] == 64'h5511_6633_1122_5577);
            head_ctrl  <= head[135 -: 8] == 8'd1 ? 1'b0 : 1'b1;
            img_h          <= head[127 -: 16];
            img_w          <= head[111 -: 16];
            total_packet   <= head[95  -: 32];
            algorithm_ctrl <= head[127 -: 16];
        end
    end
end
    
endmodule