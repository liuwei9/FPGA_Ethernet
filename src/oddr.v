module oddr #(
    parameter DEVICE     = "XILINX",
    parameter IDDR_PRIM  = "IODDR" ,
    parameter DATA_WIDTH = 8
) (
    input                     clk,
    input  [DATA_WIDTH - 1:0] d1 ,
    input  [DATA_WIDTH - 1:0] d2 ,

    output [DATA_WIDTH - 1:0] q 
);

genvar i;
generate
    if(DEVICE == "XILINX")begin
        for (i = 0; i < DATA_WIDTH ; i = i + 1) begin
            if(IDDR_PRIM == "IODDR")begin
                ODDR #(
                    .DDR_CLK_EDGE  ("SAME_EDGE"),  // "OPPOSITE_EDGE" or "SAME_EDGE" 
                    .INIT          (1'b0),         // Initial value of Q: 1'b0 or 1'b1
                    .SRTYPE        ("SYNC")        // Set/Reset type: "SYNC" or "ASYNC" 
                ) ODDR_inst (
                    .Q             (q[i]), // 1-bit DDR output
                    .C             (clk),  // 1-bit clock input
                    .CE            (1'b1),         // 1-bit clock enable input
                    .D1            (d1[i]),   // 1-bit data input (positive edge)
                    .D2            (d2[i]),   // 1-bit data input (negative edge)
                    .R             (1'b0),         // 1-bit reset
                    .S             (1'b0)          // 1-bit set
                );
            end
            else if(IDDR_PRIM == "IODDRE1")begin
                ODDRE1 #(
                    .IS_C_INVERTED(1'b0),           // Optional inversion for C
                    .IS_D1_INVERTED(1'b0),          // Unsupported, do not use
                    .IS_D2_INVERTED(1'b0),          // Unsupported, do not use
                    .SIM_DEVICE("ULTRASCALE_PLUS"), // Set the device version for simulation functionality (ULTRASCALE,
                                                    // ULTRASCALE_PLUS, ULTRASCALE_PLUS_ES1, ULTRASCALE_PLUS_ES2)
                    .SRVAL(1'b0)                    // Initializes the ODDRE1 Flip-Flops to the specified value (1'b0, 1'b1)
                ) ODDRE1_inst (
                   .Q(q[i]),   // 1-bit output: Data output to IOB
                   .C(clk),   // 1-bit input: High-speed clock input
                   .D1(d1[i]), // 1-bit input: Parallel data input 1
                   .D2(d2[i]), // 1-bit input: Parallel data input 2
                   .SR(1'b0 )  // 1-bit input: Active-High Async Reset
                );
            end
        end      
    end
    else begin

    end
endgenerate

endmodule