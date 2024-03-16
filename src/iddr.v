module iddr #(
    parameter DEVICE     = "XILINX",
    parameter IDDR_PRIM  = "IODDR" ,
    parameter DATA_WIDTH = 8
) (
    input                     clk,
    input  [DATA_WIDTH - 1:0] d  ,

    output [DATA_WIDTH - 1:0] q1 ,
    output [DATA_WIDTH - 1:0] q2 
);

genvar i;
generate
    if(DEVICE == "XILINX")begin
        for (i = 0; i < DATA_WIDTH ; i = i + 1) begin
            if(IDDR_PRIM == "IODDR")begin
                IDDR #(
                .DDR_CLK_EDGE("SAME_EDGE_PIPELINED"),
                .INIT_Q1(1'b0), // Initial value of Q1: 1'b0 or 1'b1
                .INIT_Q2(1'b0), // Initial value of Q2: 1'b0 or 1'b1
                .SRTYPE("ASYNC")
                )
                iddr_inst (
                    .Q1(q1[i]),
                    .Q2(q2[i]),
                    .C(clk),
                    .CE(1'b1),
                    .D(d[i]),
                    .R(1'b0),
                    .S(1'b0)
                );           
            end
            else if(IDDR_PRIM == "IODDRE1")begin
                
            end
        end      
    end
    else begin

    end
endgenerate
    
endmodule