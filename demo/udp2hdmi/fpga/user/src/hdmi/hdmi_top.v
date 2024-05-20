
module  hdmi_top(
    input        sys_clk    ,
    output       hdmi_clk   ,
    output       hdmi_rst   ,
    
    output       tmds_clk_p ,    
    output       tmds_clk_n ,
    output [2:0] tmds_data_p,  
    output [2:0] tmds_data_n,


    input       [24 - 1:0]  data_in       ,
    output                  data_in_ready ,
    output                  vsyns         
);

//wire define
wire          pixel_clk;
wire          pixel_clk_5x;
wire          clk_locked;


wire          video_hs;
wire          video_vs;
wire          video_de;
wire  [23:0]  video_rgb;

// wire                         data_req      ;
// wire                         data_out_ready;
// wire     [23:0]              data_out      ;
// wire                         data_out_valid;

//*****************************************************
//**                    main code
//*****************************************************


clk_wiz_1  clk_wiz_1_inst(
    .clk_in1        (sys_clk     ),
    .clk_out1       (pixel_clk   ),        
    .clk_out2       (pixel_clk_5x),     
    
    .locked         (clk_locked  )
);

assign hdmi_clk = pixel_clk;
assign hdmi_rst_n = !clk_locked;
assign vsyns = video_vs;

video_driver u_video_driver(
    .clk            (pixel_clk    ),
    .rst            (!clk_locked  ),

    .video_hs       (video_hs     ),
    .video_vs       (video_vs     ),
    .video_de       (video_de     ),
    .video_rgb      (video_rgb    ),

    .data_in_ready  (data_in_ready),
    .data_in        (data_in      )
    );




dvi_transmitter_top u_rgb2dvi_0(
    .pclk           (pixel_clk   ),
    .pclk_x5        (pixel_clk_5x),
    .reset_n        (clk_locked  ),
                
    .video_din      (video_rgb   ),
    .video_hsync    (video_hs    ), 
    .video_vsync    (video_vs    ),
    .video_de       (video_de    ),
                
    .tmds_clk_p     (tmds_clk_p  ),
    .tmds_clk_n     (tmds_clk_n  ),
    .tmds_data_p    (tmds_data_p ),
    .tmds_data_n    (tmds_data_n ), 
    .tmds_oen       ()                        
    );

endmodule 