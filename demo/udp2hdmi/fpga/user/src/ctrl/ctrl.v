module ctrl (
    input         clk         ,
    input         rst         ,

    (*mark_debug = "true"*)input   [7:0] s_axis_data ,
    (*mark_debug = "true"*)input         s_axis_valid,
    (*mark_debug = "true"*)input         s_axis_last ,

    (*mark_debug = "true"*)output  [7:0] m_axis_data ,
    (*mark_debug = "true"*)output        m_axis_valid,
    (*mark_debug = "true"*)output        m_axis_last ,
    (*mark_debug = "true"*)output [15:0] m_axis_len  , 
    (*mark_debug = "true"*)output        m_axis_vsync  

);

genvar i;

localparam HEAD = 4'b0001;
localparam DATA = 4'b0010;
localparam CTRL = 4'b0100;
localparam TAIL = 4'b1000;

(*mark_debug = "true"*)reg [3:0] curr_state;
reg [3:0] next_state;

(*mark_debug = "true"*)reg [7:0]  s_axis_data_ff  [26:0];
(*mark_debug = "true"*)reg [26:0] s_axis_valid_ff ;
(*mark_debug = "true"*)reg [26:0] s_axis_last_ff  ; 

(*mark_debug = "true"*)reg [199:0] head;
(*mark_debug = "true"*)reg         head_check;
(*mark_debug = "true"*)reg         head_ctrl ;
(*mark_debug = "true"*)reg [199:0] tail      ;
(*mark_debug = "true"*)reg         tail_check;

(*mark_debug = "true"*)reg [15:0]  img_h         ;
(*mark_debug = "true"*)reg [15:0]  img_w         ;
(*mark_debug = "true"*)reg [31:0]  total_packet  ;
(*mark_debug = "true"*)reg [15:0]  algorithm_ctrl;

(*mark_debug = "true"*)reg [31:0] frame_num;
(*mark_debug = "true"*)reg [15:0] frame_len;
(*mark_debug = "true"*)reg [47:0] frame_head;
(*mark_debug = "true"*)reg [ 2:0] data_cnt  ;
// reg [31:0] num;
// reg        abnormal;

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
            if((head_check == 1'b1) && (s_axis_last_ff[26] == 1'b1))begin
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
            if((frame_num == total_packet) && (m_axis_last == 1'b1) && (m_axis_valid == 1'b1))begin
                next_state = TAIL;
            end
            else begin
                next_state = DATA;
            end
        end
        CTRL: begin
            next_state = HEAD;
        end
        TAIL: begin
            if(tail_check == 1'b1)begin
                next_state = HEAD;
            end
            else begin
                next_state = TAIL;
            end
        end
        default: begin
            next_state = HEAD;
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
        s_axis_valid_ff   <= {s_axis_valid_ff[25:0], s_axis_valid};
        s_axis_last_ff    <= {s_axis_last_ff [25:0], s_axis_last };
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
        else begin
            if(curr_state != HEAD)begin
                head <= 200'd0;
            end
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
        else begin
            if(curr_state != HEAD)begin
                head_check <= 1'b0;
            end
        end
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        frame_head <= 48'd0;
    end
    else begin
        if((curr_state == DATA) && (s_axis_valid == 1'b1))begin
            frame_head <= {frame_head[39:0], s_axis_data};
        end
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        frame_num <= 32'd0;
        frame_len <= 16'd0;
    end
    else begin
        if((curr_state == DATA) && (s_axis_valid_ff[5] == 1'b1) && (s_axis_valid_ff[6] == 1'b0))begin
            frame_num <= frame_head[47 -: 32];
            frame_len <= frame_head[0 +: 16];
        end
    end
end

// always @(posedge clk ) begin
//     if(rst == 1'b1)begin
//         num <= 32'd0;
//     end
//     else begin
//         if((curr_state == DATA) && (s_axis_valid_ff[7] == 1'b1) && (s_axis_valid_ff[8] == 1'b0))begin
//             num <= num + 32'd1;
//         end
//     end
// end

// always @(posedge clk ) begin
//     if(rst == 1'b1)begin
//         abnormal <= 1'b0;
//     end
//     else begin
//         if((curr_state == DATA) && (s_axis_valid_ff[6] == 1'b1) && (s_axis_valid_ff[7] == 1'b0))begin
//             abnormal <= abnormal | (frame_num != num);
//         end
//     end
// end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        data_cnt <= 3'd0;
    end
    else begin
        if(s_axis_valid_ff[26] == 1'b1)begin
            if(data_cnt < 3'd6)begin
                data_cnt <= data_cnt + 3'd1;
            end
        end
        else begin
            data_cnt <= 3'd0;
        end
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        tail <= 200'd0;
    end
    else begin
        if((curr_state == TAIL) && (s_axis_valid == 1'b1))begin
            tail <= {tail[191:0], s_axis_data};
        end
        else begin
            if(curr_state != TAIL)begin
                tail <= 200'd0;
            end
        end
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        tail_check <= 1'b1;
    end
    else begin
        if((curr_state == TAIL) && (s_axis_valid_ff[25] == 1'b1))begin
            tail_check <= tail == 200'h6633_7755_3322_4411_7733_9988_1144_6633_3366_4411_8899_3377_11; 
        end
        else begin
            if(curr_state != TAIL)begin
                tail_check <= 1'b0;
            end
        end
    end
end

assign m_axis_data  = (curr_state == DATA) ? s_axis_data_ff [26] : 8'b0;
assign m_axis_valid = (curr_state == DATA) ? s_axis_valid_ff[26] && (data_cnt == 3'd6) : 1'b0;
assign m_axis_last  = (curr_state == DATA) ? s_axis_last_ff [26] : 1'b0;
assign m_axis_len   = frame_len;
assign m_axis_vsync = (curr_state == DATA) ? s_axis_valid_ff[26] && (data_cnt == 3'd6) && (frame_num == 32'd0) : 1'b0;
    
endmodule