
module video_driver(
    input           clk,
    input           rst,
    
    output          video_hs,     
    output          video_vs,    
    output          video_de,     
    output  [23:0]  video_rgb,   

    output                         data_in_ready                       ,
    input      [23:0]              data_in                                
    
);

//parameter define

// //1920*1080
 parameter  H_SYNC   =  12'd44;   
 parameter  H_BACK   =  12'd148;  
 parameter  H_DISP   =  12'd1920; 
 parameter  H_FRONT  =  12'd22;  
 parameter  H_TOTAL  =  12'd2200; 

 parameter  V_SYNC   =  12'd5;    
 parameter  V_BACK   =  12'd36;  
 parameter  V_DISP   =  12'd1080; 
 parameter  V_FRONT  =  12'd4;   
 parameter  V_TOTAL  =  12'd1125; 

// //640*480
// parameter  H_SYNC   =  12'd96;   
// parameter  H_BACK   =  12'd48;  
// parameter  H_DISP   =  12'd640; 
// parameter  H_FRONT  =  12'd16;  
// parameter  H_TOTAL  =  12'd800; 

// parameter  V_SYNC   =  12'd2;    
// parameter  V_BACK   =  12'd32;  
// parameter  V_DISP   =  12'd480; 
// parameter  V_FRONT  =  12'd10;   
// parameter  V_TOTAL  =  12'd525; 

// 1280*720*60fps
//parameter  H_SYNC   =  12'd40;   
//parameter  H_BACK   =  12'd220;  
//parameter  H_DISP   =  12'd1280; 
//parameter  H_FRONT  =  12'd110;  
//parameter  H_TOTAL  =  12'd1650; 

//parameter  V_SYNC   =  12'd5;    
//parameter  V_BACK   =  12'd20;  
//parameter  V_DISP   =  12'd720; 
//parameter  V_FRONT  =  12'd5;   
//parameter  V_TOTAL  =  12'd750; 

// //1280*720*30fps
// parameter  H_SYNC   =  12'd40;   
// parameter  H_BACK   =  12'd220;  
// parameter  H_DISP   =  12'd1280; 
// parameter  H_FRONT  =  12'd1760;  
// parameter  H_TOTAL  =  12'd3300; 

// parameter  V_SYNC   =  12'd5;    
// parameter  V_BACK   =  12'd20;  
// parameter  V_DISP   =  12'd720; 
// parameter  V_FRONT  =  12'd5;   
// parameter  V_TOTAL  =  12'd750; 

//reg define
reg  [11:0] cnt_h;
reg  [11:0] cnt_v;

//wire define
wire       video_en;
// wire       data_req;

//*****************************************************
//**                    main code
//*****************************************************

always @(posedge clk)begin
    if(rst == 1'b1)begin
        cnt_h <= 12'd0;
    end
    else begin
        if(cnt_h == H_TOTAL - 1)begin
            cnt_h <= 12'b0;
        end
        else begin
            cnt_h <= cnt_h + 1'b1;
        end
    end
end

always @(posedge clk)begin
    if(rst == 1'b1)begin
        cnt_v <= 12'd0;
    end
    else begin
        if(cnt_h == H_TOTAL - 1)begin
            if(cnt_v == V_TOTAL - 1)begin
                cnt_v <= 12'b0;
            end
            else begin
                cnt_v <= cnt_v + 12'b1;
            end
        end
    end
end

assign data_in_ready = (cnt_h > (H_SYNC + H_BACK - 12'd1)) &&
                       (cnt_h < (H_SYNC + H_BACK + H_DISP)) && 
                       (cnt_v > (V_SYNC + V_BACK - 12'd1)) && 
                       (cnt_v < V_SYNC + V_BACK + V_DISP);
//assign video_rgb = {8'd255, 8'd0, 8'd0};
assign video_rgb = data_in;
assign video_de = data_in_ready;
assign video_vs = cnt_v < V_SYNC ? 1'b0 : 1'b1;
assign video_hs = cnt_h < H_SYNC ? 1'b0 : 1'b1;

endmodule