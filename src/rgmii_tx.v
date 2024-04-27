module rgmii_tx #(
    parameter DEVICE     = "XILINX",
    parameter IDDR_PRIM  = "IODDR" ,
    parameter CLK_90     = "TRUE" 
) (
    input        clk           ,
    input        clk_90        ,

    output       phy_rgmii_clk ,
    output       phy_rgmii_ctl ,
    output [3:0] phy_rgmii_data,

    input  [7:0] mac_gmii_data ,
    output       mac_gmii_clk  ,
    input        mac_gmii_dv    
);
generate
    if(CLK_90 == "TRUE")begin
        assign mac_gmii_clk = clk_90;
    end
    else begin
        assign mac_gmii_clk = clk;
    end
endgenerate

assign phy_rgmii_clk = mac_gmii_clk;

generate
    if(DEVICE == "XILINX")begin
        oddr #(
            .DEVICE     (DEVICE   ),
            .IDDR_PRIM  (IDDR_PRIM),
            .DATA_WIDTH (5        )
        ) oddr_inst (
            .clk        (mac_gmii_clk),
            .d1         ({mac_gmii_data[3:0], mac_gmii_dv}),
            .d2         ({mac_gmii_data[7:4], mac_gmii_dv}),
        
            .q          ({phy_rgmii_data, phy_rgmii_ctl}  ) 
        );
    end
endgenerate
    
endmodule