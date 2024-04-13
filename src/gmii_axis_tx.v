module gmii_axis_tx #(
    parameter DEVICE     = "XILINX"
) (
    input        clk              ,
    input        rst              ,

    input  [7:0] s_eth_axis_data  ,
    input        s_eth_axis_valid ,
    input        s_eth_axis_last  ,
    output       s_eth_axis_ready ,

    input        mac_tx_gmii_clk  ,
    output [7:0] mac_tx_gmii_data ,
    output       mac_tx_gmii_dv     
);

// reg       s_mac_tx_gmii_clk ;
// reg [7:0] s_mac_tx_gmii_data;
// reg       s_mac_tx_gmii_dv  ;
// reg       s_mac_tx_gmii_err ;

wire [7:0] fifo_axis_data ;
wire       fifo_axis_valid;
wire       fifo_axis_last ;
wire       fifo_axis_ready;

reg rst_r;
reg rst_2r;

reg w_ping;
reg r_ping;

wire [7:0] s_data    ;
wire       s_valid   ;
wire       s_last    ;
wire       s_ready   ;

wire [7:0] m_data    ;
wire       m_valid   ;
wire       m_last    ;

wire [7:0] ping_s_data ;
wire       ping_s_valid;
wire       ping_s_last ;
wire       ping_s_ready;

wire [7:0] pang_s_data ;
wire       pang_s_valid;
wire       pang_s_last ;
wire       pang_s_ready;

wire [7:0] ping_m_data ;
wire       ping_m_valid;
wire       ping_m_last ;

wire [7:0] pang_m_data ;
wire       pang_m_valid;
wire       pang_m_last ;

reg  [7:0] m_data_ff ;
reg        m_valid_ff;

always @(posedge mac_tx_gmii_clk ) begin
    rst_r  <= rst  ;
    rst_2r <= rst_r;
end

always @(posedge mac_tx_gmii_clk ) begin
    if(rst_2r == 1'b1)begin
        w_ping <= 1'b0;
    end
    else begin
        if((s_valid == 1'b1) && (s_ready == 1'b1) && (s_last == 1'b1))begin
            w_ping <= !w_ping;
        end
    end
end

always @(posedge mac_tx_gmii_clk ) begin
    if(rst_2r == 1'b1)begin
        r_ping <= 1'b0;
    end
    else begin
        if((m_valid == 1'b1) && (m_last == 1'b1))begin
            r_ping <= !r_ping;
        end
    end
end

assign ping_s_data  = (w_ping == 1'b0) ? s_data[7:0]  : 8'b0;
assign ping_s_valid = (w_ping == 1'b0) ? s_valid      : 1'b0;
assign ping_s_last  = (w_ping == 1'b0) ? s_last[8]    : 1'b0;

assign pang_s_data  = (w_ping == 1'b1) ? s_data[7:0]  : 8'b0;
assign pang_s_valid = (w_ping == 1'b1) ? s_valid      : 1'b0;
assign pang_s_last  = (w_ping == 1'b1) ? s_last[8]    : 1'b0;

assign s_ready = (w_ping == 1'b0) ? ping_s_ready : pang_s_ready;

assign m_valid = (r_ping == 1'b0) ? ping_m_valid : pang_m_valid;
assign m_data  = (r_ping == 1'b0) ? ping_m_data  : pang_m_data ;
assign m_last  = (r_ping == 1'b0) ? ping_m_last  : pang_m_last ;

always @(posedge mac_tx_gmii_clk ) begin
    if(rst_2r == 1'b1)begin
        m_data_ff  <= 8'b0;
        m_valid_ff <= 1'b0;
    end
    else begin
        m_data_ff  <= m_data ;
        m_valid_ff <= m_valid;
    end
end

assign mac_tx_gmii_data = m_data_ff ;
assign mac_tx_gmii_dv   = m_valid_ff; 

gmii_axis_tx_mem gmii_axis_tx_mem_ping(
    .clk        (mac_tx_gmii_clk),
    .rst        (rst_2r         ),
    .s_data     (ping_s_data    ),
    .s_valid    (ping_s_valid   ),
    .s_last     (ping_s_last    ),
    .s_ready    (ping_s_ready   ),
    .m_data     (ping_m_data    ),
    .m_valid    (ping_m_valid   ),
    .m_last     (ping_m_last    )
);

gmii_axis_tx_mem gmii_axis_tx_mem_pang(
    .clk        (mac_tx_gmii_clk),
    .rst        (rst_2r         ),
    .s_data     (pang_s_data    ),
    .s_valid    (pang_s_valid   ),
    .s_last     (pang_s_last    ),
    .s_ready    (pang_s_ready   ),
    .m_data     (pang_m_data    ),
    .m_valid    (pang_m_valid   ),
    .m_last     (pang_m_last    )
);

stream_fifo #(
    .DP (2048),
    .WD (8   )
) stream_fifo_inst (
    .clk     (clk              ),
    .rst     (rst              ),
    .s_data  (s_eth_axis_data  ),
    .s_valid (s_eth_axis_valid ),
    .s_last  (s_eth_axis_last  ),
    .s_ready (s_eth_axis_ready ),

    .m_data  (fifo_axis_data   ),
    .m_valid (fifo_axis_valid  ),
    .m_last  (fifo_axis_last   ),
    .m_ready (fifo_axis_ready  ) 
);

generate
    if(DEVICE == "XILINX")begin
   xpm_fifo_axis #(
      .CASCADE_HEIGHT(0),             // DECIMAL
      .CDC_SYNC_STAGES(2),            // DECIMAL
      .CLOCKING_MODE("independent_clock"), // String
      .ECC_MODE("no_ecc"),            // String
      .FIFO_DEPTH(512),              // DECIMAL
      .FIFO_MEMORY_TYPE("auto"),      // String
      .PACKET_FIFO("false"),          // String
      .PROG_EMPTY_THRESH(10),         // DECIMAL
      .PROG_FULL_THRESH(10),          // DECIMAL
      .RD_DATA_COUNT_WIDTH(9),        // DECIMAL
      .RELATED_CLOCKS(0),             // DECIMAL
      .SIM_ASSERT_CHK(0),             // DECIMAL; 0=disable simulation messages, 1=enable simulation messages
      .TDATA_WIDTH(9),               // DECIMAL
      .TDEST_WIDTH(1),                // DECIMAL
      .TID_WIDTH(1),                  // DECIMAL
      .TUSER_WIDTH(1),                // DECIMAL
      .USE_ADV_FEATURES("1000"),      // String
      .WR_DATA_COUNT_WIDTH(9)         // DECIMAL
   )
   xpm_fifo_axis_inst (
      .almost_empty_axis(),   // 1-bit output: Almost Empty : When asserted, this signal
                                               // indicates that only one more read can be performed before the
                                               // FIFO goes to empty.

      .almost_full_axis(),     // 1-bit output: Almost Full: When asserted, this signal
                                               // indicates that only one more write can be performed before
                                               // the FIFO is full.

      .dbiterr_axis(),             // 1-bit output: Double Bit Error- Indicates that the ECC
                                               // decoder detected a double-bit error and data in the FIFO core
                                               // is corrupted.

      .m_axis_tdata(s_data),             // TDATA_WIDTH-bit output: TDATA: The primary payload that is
                                               // used to provide the data that is passing across the
                                               // interface. The width of the data payload is an integer number
                                               // of bytes.

      .m_axis_tdest(),             // TDEST_WIDTH-bit output: TDEST: Provides routing information
                                               // for the data stream.

      .m_axis_tid(),                 // TID_WIDTH-bit output: TID: The data stream identifier that
                                               // indicates different streams of data.

      .m_axis_tkeep(),             // TDATA_WIDTH/8-bit output: TKEEP: The byte qualifier that
                                               // indicates whether the content of the associated byte of TDATA
                                               // is processed as part of the data stream. Associated bytes
                                               // that have the TKEEP byte qualifier deasserted are null bytes
                                               // and can be removed from the data stream. For a 64-bit DATA,
                                               // bit 0 corresponds to the least significant byte on DATA, and
                                               // bit 7 corresponds to the most significant byte. For example:
                                               // KEEP[0] = 1b, DATA[7:0] is not a NULL byte KEEP[7] = 0b,
                                               // DATA[63:56] is a NULL byte

      .m_axis_tlast(),             // 1-bit output: TLAST: Indicates the boundary of a packet.
      .m_axis_tstrb(),             // TDATA_WIDTH/8-bit output: TSTRB: The byte qualifier that
                                               // indicates whether the content of the associated byte of TDATA
                                               // is processed as a data byte or a position byte. For a 64-bit
                                               // DATA, bit 0 corresponds to the least significant byte on
                                               // DATA, and bit 0 corresponds to the least significant byte on
                                               // DATA, and bit 7 corresponds to the most significant byte. For
                                               // example: STROBE[0] = 1b, DATA[7:0] is valid STROBE[7] = 0b,
                                               // DATA[63:56] is not valid

      .m_axis_tuser(),             // TUSER_WIDTH-bit output: TUSER: The user-defined sideband
                                               // information that can be transmitted alongside the data
                                               // stream.

      .m_axis_tvalid(s_valid),           // 1-bit output: TVALID: Indicates that the master is driving a
                                               // valid transfer. A transfer takes place when both TVALID and
                                               // TREADY are asserted

      .prog_empty_axis(),       // 1-bit output: Programmable Empty- This signal is asserted
                                               // when the number of words in the FIFO is less than or equal to
                                               // the programmable empty threshold value. It is de-asserted
                                               // when the number of words in the FIFO exceeds the programmable
                                               // empty threshold value.

      .prog_full_axis(),         // 1-bit output: Programmable Full: This signal is asserted when
                                               // the number of words in the FIFO is greater than or equal to
                                               // the programmable full threshold value. It is de-asserted when
                                               // the number of words in the FIFO is less than the programmable
                                               // full threshold value.

      .rd_data_count_axis(), // RD_DATA_COUNT_WIDTH-bit output: Read Data Count- This bus
                                               // indicates the number of words available for reading in the
                                               // FIFO.

      .s_axis_tready(fifo_axis_ready),           // 1-bit output: TREADY: Indicates that the slave can accept a
                                               // transfer in the current cycle.

      .sbiterr_axis(),             // 1-bit output: Single Bit Error- Indicates that the ECC
                                               // decoder detected and fixed a single-bit error.

      .wr_data_count_axis(), // WR_DATA_COUNT_WIDTH-bit output: Write Data Count: This bus
                                               // indicates the number of words written into the FIFO.

      .injectdbiterr_axis(1'b0), // 1-bit input: Double Bit Error Injection- Injects a double bit
                                               // error if the ECC feature is used.

      .injectsbiterr_axis(1'b0), // 1-bit input: Single Bit Error Injection- Injects a single bit
                                               // error if the ECC feature is used.

      .m_aclk(m_aclk),                         // 1-bit input: Master Interface Clock: All signals on master
                                               // interface are sampled on the rising edge of this clock.

      .m_axis_tready(s_ready),           // 1-bit input: TREADY: Indicates that the slave can accept a
                                               // transfer in the current cycle.

      .s_aclk(clk),                         // 1-bit input: Slave Interface Clock: All signals on slave
                                               // interface are sampled on the rising edge of this clock.

      .s_aresetn(!rst),                   // 1-bit input: Active low asynchronous reset.
      .s_axis_tdata({fifo_axis_last, fifo_axis_data}),             // TDATA_WIDTH-bit input: TDATA: The primary payload that is
                                               // used to provide the data that is passing across the
                                               // interface. The width of the data payload is an integer number
                                               // of bytes.

      .s_axis_tdest(1'b0),             // TDEST_WIDTH-bit input: TDEST: Provides routing information
                                               // for the data stream.

      .s_axis_tid(1'b0),                 // TID_WIDTH-bit input: TID: The data stream identifier that
                                               // indicates different streams of data.

      .s_axis_tkeep(1'b1),             // TDATA_WIDTH/8-bit input: TKEEP: The byte qualifier that
                                               // indicates whether the content of the associated byte of TDATA
                                               // is processed as part of the data stream. Associated bytes
                                               // that have the TKEEP byte qualifier deasserted are null bytes
                                               // and can be removed from the data stream. For a 64-bit DATA,
                                               // bit 0 corresponds to the least significant byte on DATA, and
                                               // bit 7 corresponds to the most significant byte. For example:
                                               // KEEP[0] = 1b, DATA[7:0] is not a NULL byte KEEP[7] = 0b,
                                               // DATA[63:56] is a NULL byte

      .s_axis_tlast(fifo_axis_last),             // 1-bit input: TLAST: Indicates the boundary of a packet.
      .s_axis_tstrb(1'b1),             // TDATA_WIDTH/8-bit input: TSTRB: The byte qualifier that
                                               // indicates whether the content of the associated byte of TDATA
                                               // is processed as a data byte or a position byte. For a 64-bit
                                               // DATA, bit 0 corresponds to the least significant byte on
                                               // DATA, and bit 0 corresponds to the least significant byte on
                                               // DATA, and bit 7 corresponds to the most significant byte. For
                                               // example: STROBE[0] = 1b, DATA[7:0] is valid STROBE[7] = 0b,
                                               // DATA[63:56] is not valid

      .s_axis_tuser(1'b0),             // TUSER_WIDTH-bit input: TUSER: The user-defined sideband
                                               // information that can be transmitted alongside the data
                                               // stream.

      .s_axis_tvalid(fifo_axis_valid)            // 1-bit input: TVALID: Indicates that the master is driving a
                                               // valid transfer. A transfer takes place when both TVALID and
                                               // TREADY are asserted
   );
        end
endgenerate
endmodule