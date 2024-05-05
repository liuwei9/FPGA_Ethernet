module eth2ddr_ctrl(
    input          clk         ,
    input          rst         ,

    input   [31:0] base_addr   ,

    input   [7:0]  s_axis_data ,
    input          s_axis_valid,
    input          s_axis_last ,
    input   [15:0] s_axis_len  ,
    input          s_axis_vsync,

    output  [7:0]  m_axis_data ,
    output         m_axis_valid,
    output         m_axis_last ,
    output  [31:0] m_axis_addr ,
    output  [31:0] m_axis_len  
);

reg [31:0] addr;

reg [7:0]  s_axis_data_ff ;
reg        s_axis_valid_ff;
reg        s_axis_last_ff ; 
reg [31:0] s_axis_len_ff  ;  


always @(posedge clk ) begin
    if(rst == 1'b1)begin
        s_axis_data_ff  <=  8'b0;
        s_axis_valid_ff <=  1'b0;
        s_axis_last_ff  <=  1'b0;
        s_axis_len_ff   <= 16'b0;
    end
    else begin
        s_axis_data_ff  <= s_axis_data ;
        s_axis_valid_ff <= s_axis_valid;
        s_axis_last_ff  <= s_axis_last ;
        s_axis_len_ff   <= {16'd0, s_axis_len};
    end
end



always @(posedge clk ) begin
    if(rst == 1'b1)begin
        addr <= 32'd0;
    end
    else begin
        if(s_axis_vsync == 1'b1)begin
            addr <= base_addr;
        end
        else begin
            if((s_axis_valid == 1'b1) && (s_axis_valid_ff == 1'b0))begin
                addr <= addr + s_axis_len;
            end
        end
    end
end

assign m_axis_data  = s_axis_data_ff ;
assign m_axis_valid = s_axis_valid_ff;
assign m_axis_last  = s_axis_last_ff ;
assign m_axis_addr  = addr           ;
assign m_axis_len   = s_axis_len_ff  ;
    
endmodule