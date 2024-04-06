module stream_fifo #(
    parameter DP = 1024,
    parameter WD = 8
) (
    input                             clk    ,
    input                             rst    ,
    input        [WD - 1 : 0]         s_data ,
    input                             s_valid,
    input                             s_last ,
    output                            s_ready,

    output       [WD - 1 : 0]         m_data ,
    output                            m_valid,
    output                            m_last ,
    input                             m_ready 
);

localparam DEPTH = DP < 11 ? 16 : DP;

localparam ADDR_WIDTH = $clog2(DEPTH);

reg [WD:0] mem [DEPTH - 1:0];
reg [ADDR_WIDTH - 1:0] cnt;
reg [ADDR_WIDTH - 1:0] raddr;
reg [ADDR_WIDTH - 1:0] waddr;
wire                   ren  ;
wire m_fire;
reg [WD:0] rdata;

reg            m_valid_r;

assign m_fire = (m_valid == 1'b1) && (m_ready == 1'b1);
assign ren = (m_valid == 1'b0) || ((m_valid == 1'b1) && (m_ready == 1'b1)) && (cnt > {ADDR_WIDTH{1'b0}});

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        s_ready <= 1'b0;
    end
    else begin
        if(cnt >= 4'd10)begin
            s_ready <= 1'b0;
        end
        else begin
            s_ready <= 1'b1;
        end
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        waddr <= {ADDR_WIDTH{1'b0}};
    end
    else begin
        if(s_valid == 1'b1)begin
            waddr <= waddr + 1'b1;
        end
    end
end

always @(posedge clk ) begin
    if(s_valid == 1'b1)begin
        mem[waddr] <= {s_last, s_data}; 
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        cnt <= {ADDR_WIDTH{1'b0}};
    end
    else begin
        if((s_valid == 1'b1) && (m_fire == 1'b0))begin
            cnt <= cnt + 1'b1;
        end
        else if((s_valid == 1'b0) && (m_fire == 1'b1))begin
            cnt <= cnt - 1'b1;
        end
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        raddr <= {ADDR_WIDTH{1'b0}};
    end
    else begin
        if(ren == 1'b1)begin
            raddr <= raddr + 1'b1;
        end
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        rdata <= {WD{1'b0}};
    end
    else begin
        if(ren == 1'b1)begin
            rdata <= mem[raddr];
        end
        else begin
            rdata <= {WD{1'b0}};
        end
    end
end

always @(posedge clk ) begin
    if(rst == 1'b1)begin
        m_valid_r <= 1'b0;
    end
    else begin
        if(ren == 1'b1)begin
            m_valid_r <= 1'b1;
        end
        else begin
            if(m_valid_r == 1'b1)begin
                if(m_ready == 1'b1)begin
                    m_valid_r <= 1'b0;
                end
            end
        end
    end
end

assign m_data  = rdata[WD - 2 : 0];
assign m_valid = m_valid_r;
assign m_last  = rdata[WD - 1];

endmodule