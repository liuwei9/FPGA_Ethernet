`timescale  1ns/1ns 
module tb_udp_top (
);

parameter CLOCK_BUFF = "BUFG"       ;
parameter DEVICE     = "XILINX"     ;
parameter IDDR_PRIM  = "IODDR"      ;
parameter CLK_90     = "FALSE"       ;
parameter FLUSH_TIME = 32'hFFFF_FFFF;
parameter USE_FLUSH  = "TRUE"       ;
parameter RERNW_TIME = 16'hFFFF     ;

reg clk_200;
wire rst;
reg locked;
reg clk_out1;
wire clk_out2;

wire        phy_rgmii_rx_clk ;
wire        phy_rgmii_rx_ctl ;
wire  [3:0] phy_rgmii_rx_data;
wire        phy_rgmii_tx_clk ;
wire        phy_rgmii_tx_ctl ;
wire  [3:0] phy_rgmii_tx_data;

wire [15:0] cfg_udp_src_port = 16'h1234;
wire [15:0] cfg_udp_dst_port = 16'h5678;
wire [31:0] cfg_src_ip       = {8'd192, 8'd168, 8'd1, 8'd2};
wire [31:0] cfg_dst_ip       = {8'd192, 8'd168, 8'd1, 8'd2};
wire [47:0] cfg_src_mac      = {8'h11, 8'h22, 8'h33, 8'h44, 8'h55, 8'h66};

wire [10:0] cfg_udp_len;  

wire [ 7:0] m_udp_axis_data  ;
wire        m_udp_axis_valid ;
wire        m_udp_axis_last  ;
wire        m_udp_axis_error ;
wire [ 7:0] s_udp_axis_data  ;
wire        s_udp_axis_valid ;
wire        s_udp_axis_last  ;
wire        s_udp_axis_ready ;


reg [10:0] send_cnt  ;
wire [7:0] send_data ;
wire       send_valid;
wire       send_last ;

initial begin
    clk_200 = 1'b0;
    forever begin
        clk_200 = #2.5 ~clk_200;
    end
end

initial begin
    clk_out1 = 1'b0;
    forever begin
        clk_out1 = #4 ~clk_out1;
    end
end

initial begin
    locked = 1'b0;
    #100
    locked = 1'b1;
end

assign clk_out2 = clk_out1;

assign rst = !locked;

assign phy_rgmii_rx_clk  = phy_rgmii_tx_clk ;
assign phy_rgmii_rx_ctl  = phy_rgmii_tx_ctl ;
assign phy_rgmii_rx_data = phy_rgmii_tx_data;


assign cfg_udp_len = 11'd500;

localparam IDLE = 3'b001;
localparam SEND = 3'b010;
localparam GAP  = 3'b100;

localparam GAP_CNT = 1000;

reg [2:0] curr_state;
reg [2:0] next_state;
reg [31:0] gap_cnt;

always @(posedge clk_out1 ) begin
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
            if(s_udp_axis_ready == 1'b1)begin
                next_state = SEND;
            end
            else begin
                next_state = IDLE;
            end
        end 
        SEND: begin
            if((s_udp_axis_valid == 1'b1) && (s_udp_axis_ready == 1'b1) && (s_udp_axis_last == 1'b1))begin
                next_state = GAP;
            end
            else begin
                next_state = SEND;
            end
        end
        GAP: begin
            if(gap_cnt == GAP_CNT)begin
                next_state = IDLE;
            end
            else begin
                next_state = GAP;
            end
        end
        default: begin
            next_state = IDLE;
        end 
    endcase
end

always @(posedge clk_out1 ) begin
    if(rst == 1'b1)begin
        gap_cnt <= 32'd0;
    end
    else begin
        if(curr_state == GAP)begin
            gap_cnt <= gap_cnt + 32'd1;
        end
        else begin
            gap_cnt <= 32'd0;
        end
    end
end

always @(posedge clk_out1) begin
    if(rst == 1'b1)begin
        send_cnt <= 'd0;
    end
    else begin
        if(curr_state == SEND)begin
            if(s_udp_axis_ready && s_udp_axis_valid)begin
                send_cnt <= send_cnt + 'd1;
            end
        end
        else begin
            send_cnt <= 'd0;
        end
    end
end

assign send_data  = send_cnt[7:0];
assign send_valid = (curr_state == SEND);
assign send_last  = (send_cnt == cfg_udp_len - 1);
assign s_udp_axis_data  = send_data ;
assign s_udp_axis_valid = send_valid;
assign s_udp_axis_last  = send_last ;

//----------------------------------------------------------------------------
//  Output     Output      Phase    Duty Cycle   Pk-to-Pk     Phase
//   Clock     Freq (MHz)  (degrees)    (%)     Jitter (ps)  Error (ps)
//----------------------------------------------------------------------------
// clk_out1__125.00000______0.000______50.0______107.523_____89.971
// clk_out2__125.00000_____90.000______50.0______107.523_____89.971
//
//----------------------------------------------------------------------------
// Input Clock   Freq (MHz)    Input Jitter (UI)
//----------------------------------------------------------------------------
// __primary_________200.000____________0.010

// clk_wiz_0 clk_wiz_0_inst
//    (
//     // Clock out ports
//     .clk_out1(clk_out1),     // output clk_out1 125MHz 0°
//     .clk_out2(clk_out2),     // output clk_out2 125MHz 90°
//     // Status and control signals
//     .locked(locked),       // output locked
//    // Clock in ports
//     .clk_in1(clk_200)      // input clk_in1 200MHz
// );

eth_top #(
    .CLOCK_BUFF (CLOCK_BUFF),
    .DEVICE     (DEVICE    ),
    .IDDR_PRIM  (IDDR_PRIM ),
    .CLK_90     (CLK_90    ),
    .FLUSH_TIME (FLUSH_TIME),
    .USE_FLUSH  (USE_FLUSH ),
    .RERNW_TIME (RERNW_TIME)    
) eth_top_inst (
    .clk              (clk_out1),
    .rst              (rst     ),
    .clk90            (clk_out2),

    .phy_rgmii_rx_clk (phy_rgmii_rx_clk ),
    .phy_rgmii_rx_ctl (phy_rgmii_rx_ctl ),
    .phy_rgmii_rx_data(phy_rgmii_rx_data),
    .phy_rgmii_tx_clk (phy_rgmii_tx_clk ),
    .phy_rgmii_tx_ctl (phy_rgmii_tx_ctl ),
    .phy_rgmii_tx_data(phy_rgmii_tx_data),

    .cfg_udp_src_port (cfg_udp_src_port ),
    .cfg_udp_dst_port (cfg_udp_dst_port ), 
    .cfg_src_ip       (cfg_src_ip       ),
    .cfg_dst_ip       (cfg_dst_ip       ),
    .cfg_udp_len      (cfg_udp_len      ),
    .cfg_src_mac      (cfg_src_mac      ),

    .m_udp_axis_data  (m_udp_axis_data  ),
    .m_udp_axis_valid (m_udp_axis_valid ),
    .m_udp_axis_last  (m_udp_axis_last  ),
    .m_udp_axis_error (m_udp_axis_error ),

    .s_udp_axis_data  (s_udp_axis_data  ),
    .s_udp_axis_valid (s_udp_axis_valid ),
    .s_udp_axis_last  (s_udp_axis_last  ),
    .s_udp_axis_ready (s_udp_axis_ready )
);

endmodule