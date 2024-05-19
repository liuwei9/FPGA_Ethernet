create_clock -period 20.000 -name sys_clk [get_ports sys_clk]
set_property IOSTANDARD LVCMOS33 [get_ports sys_clk]

create_clock -period 8.000 -name phy_rxc [get_ports phy_rgmii_rx_clk]
create_clock -period 8.000 -name phy_txc [get_ports phy_rgmii_tx_clk]

set_property IOSTANDARD LVCMOS18 [get_ports phy_rgmii_rst_n]
set_property IOSTANDARD LVCMOS18 [get_ports phy_rgmii_rx_ctl]
set_property IOSTANDARD LVCMOS18 [get_ports phy_rgmii_rx_clk]
set_property IOSTANDARD LVCMOS18 [get_ports phy_rgmii_tx_ctl]
set_property IOSTANDARD LVCMOS18 [get_ports phy_rgmii_tx_clk]
set_property IOSTANDARD LVCMOS18 [get_ports {phy_rgmii_rx_data[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {phy_rgmii_rx_data[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {phy_rgmii_rx_data[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {phy_rgmii_rx_data[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {phy_rgmii_tx_data[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {phy_rgmii_tx_data[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {phy_rgmii_tx_data[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {phy_rgmii_tx_data[0]}]

set_property PACKAGE_PIN G22 [get_ports sys_clk]
set_property PACKAGE_PIN W1 [get_ports phy_rgmii_rst_n]
set_property PACKAGE_PIN AF3 [get_ports phy_rgmii_rx_ctl]
set_property PACKAGE_PIN AB2 [get_ports phy_rgmii_rx_clk]
set_property PACKAGE_PIN Y3 [get_ports phy_rgmii_tx_ctl]
set_property PACKAGE_PIN AC2 [get_ports phy_rgmii_tx_clk]
set_property PACKAGE_PIN AB4 [get_ports {phy_rgmii_tx_data[0]}]
set_property PACKAGE_PIN AA4 [get_ports {phy_rgmii_tx_data[1]}]
set_property PACKAGE_PIN AA3 [get_ports {phy_rgmii_tx_data[2]}]
set_property PACKAGE_PIN AA2 [get_ports {phy_rgmii_tx_data[3]}]
set_property PACKAGE_PIN AE2 [get_ports {phy_rgmii_rx_data[0]}]
set_property PACKAGE_PIN AE1 [get_ports {phy_rgmii_rx_data[1]}]
set_property PACKAGE_PIN AC1 [get_ports {phy_rgmii_rx_data[2]}]
set_property PACKAGE_PIN AB1 [get_ports {phy_rgmii_rx_data[3]}]






create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 4096 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list clk_wiz_0_inst/inst/clk_out1]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 8 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {ctrl_inst/s_axis_data_ff[8][0]} {ctrl_inst/s_axis_data_ff[8][1]} {ctrl_inst/s_axis_data_ff[8][2]} {ctrl_inst/s_axis_data_ff[8][3]} {ctrl_inst/s_axis_data_ff[8][4]} {ctrl_inst/s_axis_data_ff[8][5]} {ctrl_inst/s_axis_data_ff[8][6]} {ctrl_inst/s_axis_data_ff[8][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 8 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {ctrl_inst/s_axis_data_ff[24][0]} {ctrl_inst/s_axis_data_ff[24][1]} {ctrl_inst/s_axis_data_ff[24][2]} {ctrl_inst/s_axis_data_ff[24][3]} {ctrl_inst/s_axis_data_ff[24][4]} {ctrl_inst/s_axis_data_ff[24][5]} {ctrl_inst/s_axis_data_ff[24][6]} {ctrl_inst/s_axis_data_ff[24][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 8 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {ctrl_inst/s_axis_data_ff[22][0]} {ctrl_inst/s_axis_data_ff[22][1]} {ctrl_inst/s_axis_data_ff[22][2]} {ctrl_inst/s_axis_data_ff[22][3]} {ctrl_inst/s_axis_data_ff[22][4]} {ctrl_inst/s_axis_data_ff[22][5]} {ctrl_inst/s_axis_data_ff[22][6]} {ctrl_inst/s_axis_data_ff[22][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 32 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {ctrl_inst/frame_num[0]} {ctrl_inst/frame_num[1]} {ctrl_inst/frame_num[2]} {ctrl_inst/frame_num[3]} {ctrl_inst/frame_num[4]} {ctrl_inst/frame_num[5]} {ctrl_inst/frame_num[6]} {ctrl_inst/frame_num[7]} {ctrl_inst/frame_num[8]} {ctrl_inst/frame_num[9]} {ctrl_inst/frame_num[10]} {ctrl_inst/frame_num[11]} {ctrl_inst/frame_num[12]} {ctrl_inst/frame_num[13]} {ctrl_inst/frame_num[14]} {ctrl_inst/frame_num[15]} {ctrl_inst/frame_num[16]} {ctrl_inst/frame_num[17]} {ctrl_inst/frame_num[18]} {ctrl_inst/frame_num[19]} {ctrl_inst/frame_num[20]} {ctrl_inst/frame_num[21]} {ctrl_inst/frame_num[22]} {ctrl_inst/frame_num[23]} {ctrl_inst/frame_num[24]} {ctrl_inst/frame_num[25]} {ctrl_inst/frame_num[26]} {ctrl_inst/frame_num[27]} {ctrl_inst/frame_num[28]} {ctrl_inst/frame_num[29]} {ctrl_inst/frame_num[30]} {ctrl_inst/frame_num[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 8 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {ctrl_inst/s_axis_data_ff[4][0]} {ctrl_inst/s_axis_data_ff[4][1]} {ctrl_inst/s_axis_data_ff[4][2]} {ctrl_inst/s_axis_data_ff[4][3]} {ctrl_inst/s_axis_data_ff[4][4]} {ctrl_inst/s_axis_data_ff[4][5]} {ctrl_inst/s_axis_data_ff[4][6]} {ctrl_inst/s_axis_data_ff[4][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 27 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {ctrl_inst/s_axis_valid_ff[0]} {ctrl_inst/s_axis_valid_ff[1]} {ctrl_inst/s_axis_valid_ff[2]} {ctrl_inst/s_axis_valid_ff[3]} {ctrl_inst/s_axis_valid_ff[4]} {ctrl_inst/s_axis_valid_ff[5]} {ctrl_inst/s_axis_valid_ff[6]} {ctrl_inst/s_axis_valid_ff[7]} {ctrl_inst/s_axis_valid_ff[8]} {ctrl_inst/s_axis_valid_ff[9]} {ctrl_inst/s_axis_valid_ff[10]} {ctrl_inst/s_axis_valid_ff[11]} {ctrl_inst/s_axis_valid_ff[12]} {ctrl_inst/s_axis_valid_ff[13]} {ctrl_inst/s_axis_valid_ff[14]} {ctrl_inst/s_axis_valid_ff[15]} {ctrl_inst/s_axis_valid_ff[16]} {ctrl_inst/s_axis_valid_ff[17]} {ctrl_inst/s_axis_valid_ff[18]} {ctrl_inst/s_axis_valid_ff[19]} {ctrl_inst/s_axis_valid_ff[20]} {ctrl_inst/s_axis_valid_ff[21]} {ctrl_inst/s_axis_valid_ff[22]} {ctrl_inst/s_axis_valid_ff[23]} {ctrl_inst/s_axis_valid_ff[24]} {ctrl_inst/s_axis_valid_ff[25]} {ctrl_inst/s_axis_valid_ff[26]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 128 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {ctrl_inst/tail[0]} {ctrl_inst/tail[1]} {ctrl_inst/tail[2]} {ctrl_inst/tail[3]} {ctrl_inst/tail[4]} {ctrl_inst/tail[5]} {ctrl_inst/tail[6]} {ctrl_inst/tail[7]} {ctrl_inst/tail[8]} {ctrl_inst/tail[9]} {ctrl_inst/tail[10]} {ctrl_inst/tail[11]} {ctrl_inst/tail[12]} {ctrl_inst/tail[13]} {ctrl_inst/tail[14]} {ctrl_inst/tail[15]} {ctrl_inst/tail[16]} {ctrl_inst/tail[17]} {ctrl_inst/tail[18]} {ctrl_inst/tail[19]} {ctrl_inst/tail[20]} {ctrl_inst/tail[21]} {ctrl_inst/tail[22]} {ctrl_inst/tail[23]} {ctrl_inst/tail[24]} {ctrl_inst/tail[25]} {ctrl_inst/tail[26]} {ctrl_inst/tail[27]} {ctrl_inst/tail[28]} {ctrl_inst/tail[29]} {ctrl_inst/tail[30]} {ctrl_inst/tail[31]} {ctrl_inst/tail[32]} {ctrl_inst/tail[33]} {ctrl_inst/tail[34]} {ctrl_inst/tail[35]} {ctrl_inst/tail[36]} {ctrl_inst/tail[37]} {ctrl_inst/tail[38]} {ctrl_inst/tail[39]} {ctrl_inst/tail[40]} {ctrl_inst/tail[41]} {ctrl_inst/tail[42]} {ctrl_inst/tail[43]} {ctrl_inst/tail[44]} {ctrl_inst/tail[45]} {ctrl_inst/tail[46]} {ctrl_inst/tail[47]} {ctrl_inst/tail[48]} {ctrl_inst/tail[49]} {ctrl_inst/tail[50]} {ctrl_inst/tail[51]} {ctrl_inst/tail[52]} {ctrl_inst/tail[53]} {ctrl_inst/tail[54]} {ctrl_inst/tail[55]} {ctrl_inst/tail[56]} {ctrl_inst/tail[57]} {ctrl_inst/tail[58]} {ctrl_inst/tail[59]} {ctrl_inst/tail[60]} {ctrl_inst/tail[61]} {ctrl_inst/tail[62]} {ctrl_inst/tail[63]} {ctrl_inst/tail[64]} {ctrl_inst/tail[65]} {ctrl_inst/tail[66]} {ctrl_inst/tail[67]} {ctrl_inst/tail[68]} {ctrl_inst/tail[69]} {ctrl_inst/tail[70]} {ctrl_inst/tail[71]} {ctrl_inst/tail[72]} {ctrl_inst/tail[73]} {ctrl_inst/tail[74]} {ctrl_inst/tail[75]} {ctrl_inst/tail[76]} {ctrl_inst/tail[77]} {ctrl_inst/tail[78]} {ctrl_inst/tail[79]} {ctrl_inst/tail[80]} {ctrl_inst/tail[81]} {ctrl_inst/tail[82]} {ctrl_inst/tail[83]} {ctrl_inst/tail[84]} {ctrl_inst/tail[85]} {ctrl_inst/tail[86]} {ctrl_inst/tail[87]} {ctrl_inst/tail[88]} {ctrl_inst/tail[89]} {ctrl_inst/tail[90]} {ctrl_inst/tail[91]} {ctrl_inst/tail[92]} {ctrl_inst/tail[93]} {ctrl_inst/tail[94]} {ctrl_inst/tail[95]} {ctrl_inst/tail[96]} {ctrl_inst/tail[97]} {ctrl_inst/tail[98]} {ctrl_inst/tail[99]} {ctrl_inst/tail[100]} {ctrl_inst/tail[101]} {ctrl_inst/tail[102]} {ctrl_inst/tail[103]} {ctrl_inst/tail[104]} {ctrl_inst/tail[105]} {ctrl_inst/tail[106]} {ctrl_inst/tail[107]} {ctrl_inst/tail[108]} {ctrl_inst/tail[109]} {ctrl_inst/tail[110]} {ctrl_inst/tail[111]} {ctrl_inst/tail[112]} {ctrl_inst/tail[113]} {ctrl_inst/tail[114]} {ctrl_inst/tail[115]} {ctrl_inst/tail[116]} {ctrl_inst/tail[117]} {ctrl_inst/tail[118]} {ctrl_inst/tail[119]} {ctrl_inst/tail[120]} {ctrl_inst/tail[121]} {ctrl_inst/tail[122]} {ctrl_inst/tail[123]} {ctrl_inst/tail[124]} {ctrl_inst/tail[125]} {ctrl_inst/tail[126]} {ctrl_inst/tail[127]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 200 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {ctrl_inst/head[0]} {ctrl_inst/head[1]} {ctrl_inst/head[2]} {ctrl_inst/head[3]} {ctrl_inst/head[4]} {ctrl_inst/head[5]} {ctrl_inst/head[6]} {ctrl_inst/head[7]} {ctrl_inst/head[8]} {ctrl_inst/head[9]} {ctrl_inst/head[10]} {ctrl_inst/head[11]} {ctrl_inst/head[12]} {ctrl_inst/head[13]} {ctrl_inst/head[14]} {ctrl_inst/head[15]} {ctrl_inst/head[16]} {ctrl_inst/head[17]} {ctrl_inst/head[18]} {ctrl_inst/head[19]} {ctrl_inst/head[20]} {ctrl_inst/head[21]} {ctrl_inst/head[22]} {ctrl_inst/head[23]} {ctrl_inst/head[24]} {ctrl_inst/head[25]} {ctrl_inst/head[26]} {ctrl_inst/head[27]} {ctrl_inst/head[28]} {ctrl_inst/head[29]} {ctrl_inst/head[30]} {ctrl_inst/head[31]} {ctrl_inst/head[32]} {ctrl_inst/head[33]} {ctrl_inst/head[34]} {ctrl_inst/head[35]} {ctrl_inst/head[36]} {ctrl_inst/head[37]} {ctrl_inst/head[38]} {ctrl_inst/head[39]} {ctrl_inst/head[40]} {ctrl_inst/head[41]} {ctrl_inst/head[42]} {ctrl_inst/head[43]} {ctrl_inst/head[44]} {ctrl_inst/head[45]} {ctrl_inst/head[46]} {ctrl_inst/head[47]} {ctrl_inst/head[48]} {ctrl_inst/head[49]} {ctrl_inst/head[50]} {ctrl_inst/head[51]} {ctrl_inst/head[52]} {ctrl_inst/head[53]} {ctrl_inst/head[54]} {ctrl_inst/head[55]} {ctrl_inst/head[56]} {ctrl_inst/head[57]} {ctrl_inst/head[58]} {ctrl_inst/head[59]} {ctrl_inst/head[60]} {ctrl_inst/head[61]} {ctrl_inst/head[62]} {ctrl_inst/head[63]} {ctrl_inst/head[64]} {ctrl_inst/head[65]} {ctrl_inst/head[66]} {ctrl_inst/head[67]} {ctrl_inst/head[68]} {ctrl_inst/head[69]} {ctrl_inst/head[70]} {ctrl_inst/head[71]} {ctrl_inst/head[72]} {ctrl_inst/head[73]} {ctrl_inst/head[74]} {ctrl_inst/head[75]} {ctrl_inst/head[76]} {ctrl_inst/head[77]} {ctrl_inst/head[78]} {ctrl_inst/head[79]} {ctrl_inst/head[80]} {ctrl_inst/head[81]} {ctrl_inst/head[82]} {ctrl_inst/head[83]} {ctrl_inst/head[84]} {ctrl_inst/head[85]} {ctrl_inst/head[86]} {ctrl_inst/head[87]} {ctrl_inst/head[88]} {ctrl_inst/head[89]} {ctrl_inst/head[90]} {ctrl_inst/head[91]} {ctrl_inst/head[92]} {ctrl_inst/head[93]} {ctrl_inst/head[94]} {ctrl_inst/head[95]} {ctrl_inst/head[96]} {ctrl_inst/head[97]} {ctrl_inst/head[98]} {ctrl_inst/head[99]} {ctrl_inst/head[100]} {ctrl_inst/head[101]} {ctrl_inst/head[102]} {ctrl_inst/head[103]} {ctrl_inst/head[104]} {ctrl_inst/head[105]} {ctrl_inst/head[106]} {ctrl_inst/head[107]} {ctrl_inst/head[108]} {ctrl_inst/head[109]} {ctrl_inst/head[110]} {ctrl_inst/head[111]} {ctrl_inst/head[112]} {ctrl_inst/head[113]} {ctrl_inst/head[114]} {ctrl_inst/head[115]} {ctrl_inst/head[116]} {ctrl_inst/head[117]} {ctrl_inst/head[118]} {ctrl_inst/head[119]} {ctrl_inst/head[120]} {ctrl_inst/head[121]} {ctrl_inst/head[122]} {ctrl_inst/head[123]} {ctrl_inst/head[124]} {ctrl_inst/head[125]} {ctrl_inst/head[126]} {ctrl_inst/head[127]} {ctrl_inst/head[128]} {ctrl_inst/head[129]} {ctrl_inst/head[130]} {ctrl_inst/head[131]} {ctrl_inst/head[132]} {ctrl_inst/head[133]} {ctrl_inst/head[134]} {ctrl_inst/head[135]} {ctrl_inst/head[136]} {ctrl_inst/head[137]} {ctrl_inst/head[138]} {ctrl_inst/head[139]} {ctrl_inst/head[140]} {ctrl_inst/head[141]} {ctrl_inst/head[142]} {ctrl_inst/head[143]} {ctrl_inst/head[144]} {ctrl_inst/head[145]} {ctrl_inst/head[146]} {ctrl_inst/head[147]} {ctrl_inst/head[148]} {ctrl_inst/head[149]} {ctrl_inst/head[150]} {ctrl_inst/head[151]} {ctrl_inst/head[152]} {ctrl_inst/head[153]} {ctrl_inst/head[154]} {ctrl_inst/head[155]} {ctrl_inst/head[156]} {ctrl_inst/head[157]} {ctrl_inst/head[158]} {ctrl_inst/head[159]} {ctrl_inst/head[160]} {ctrl_inst/head[161]} {ctrl_inst/head[162]} {ctrl_inst/head[163]} {ctrl_inst/head[164]} {ctrl_inst/head[165]} {ctrl_inst/head[166]} {ctrl_inst/head[167]} {ctrl_inst/head[168]} {ctrl_inst/head[169]} {ctrl_inst/head[170]} {ctrl_inst/head[171]} {ctrl_inst/head[172]} {ctrl_inst/head[173]} {ctrl_inst/head[174]} {ctrl_inst/head[175]} {ctrl_inst/head[176]} {ctrl_inst/head[177]} {ctrl_inst/head[178]} {ctrl_inst/head[179]} {ctrl_inst/head[180]} {ctrl_inst/head[181]} {ctrl_inst/head[182]} {ctrl_inst/head[183]} {ctrl_inst/head[184]} {ctrl_inst/head[185]} {ctrl_inst/head[186]} {ctrl_inst/head[187]} {ctrl_inst/head[188]} {ctrl_inst/head[189]} {ctrl_inst/head[190]} {ctrl_inst/head[191]} {ctrl_inst/head[192]} {ctrl_inst/head[193]} {ctrl_inst/head[194]} {ctrl_inst/head[195]} {ctrl_inst/head[196]} {ctrl_inst/head[197]} {ctrl_inst/head[198]} {ctrl_inst/head[199]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 4 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {ctrl_inst/curr_state[0]} {ctrl_inst/curr_state[1]} {ctrl_inst/curr_state[2]} {ctrl_inst/curr_state[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 16 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {ctrl_inst/m_axis_len[0]} {ctrl_inst/m_axis_len[1]} {ctrl_inst/m_axis_len[2]} {ctrl_inst/m_axis_len[3]} {ctrl_inst/m_axis_len[4]} {ctrl_inst/m_axis_len[5]} {ctrl_inst/m_axis_len[6]} {ctrl_inst/m_axis_len[7]} {ctrl_inst/m_axis_len[8]} {ctrl_inst/m_axis_len[9]} {ctrl_inst/m_axis_len[10]} {ctrl_inst/m_axis_len[11]} {ctrl_inst/m_axis_len[12]} {ctrl_inst/m_axis_len[13]} {ctrl_inst/m_axis_len[14]} {ctrl_inst/m_axis_len[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 8 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {ctrl_inst/s_axis_data_ff[19][0]} {ctrl_inst/s_axis_data_ff[19][1]} {ctrl_inst/s_axis_data_ff[19][2]} {ctrl_inst/s_axis_data_ff[19][3]} {ctrl_inst/s_axis_data_ff[19][4]} {ctrl_inst/s_axis_data_ff[19][5]} {ctrl_inst/s_axis_data_ff[19][6]} {ctrl_inst/s_axis_data_ff[19][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 8 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {ctrl_inst/s_axis_data_ff[25][0]} {ctrl_inst/s_axis_data_ff[25][1]} {ctrl_inst/s_axis_data_ff[25][2]} {ctrl_inst/s_axis_data_ff[25][3]} {ctrl_inst/s_axis_data_ff[25][4]} {ctrl_inst/s_axis_data_ff[25][5]} {ctrl_inst/s_axis_data_ff[25][6]} {ctrl_inst/s_axis_data_ff[25][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 8 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {ctrl_inst/s_axis_data_ff[6][0]} {ctrl_inst/s_axis_data_ff[6][1]} {ctrl_inst/s_axis_data_ff[6][2]} {ctrl_inst/s_axis_data_ff[6][3]} {ctrl_inst/s_axis_data_ff[6][4]} {ctrl_inst/s_axis_data_ff[6][5]} {ctrl_inst/s_axis_data_ff[6][6]} {ctrl_inst/s_axis_data_ff[6][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 8 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {ctrl_inst/s_axis_data_ff[23][0]} {ctrl_inst/s_axis_data_ff[23][1]} {ctrl_inst/s_axis_data_ff[23][2]} {ctrl_inst/s_axis_data_ff[23][3]} {ctrl_inst/s_axis_data_ff[23][4]} {ctrl_inst/s_axis_data_ff[23][5]} {ctrl_inst/s_axis_data_ff[23][6]} {ctrl_inst/s_axis_data_ff[23][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 8 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {ctrl_inst/s_axis_data_ff[5][0]} {ctrl_inst/s_axis_data_ff[5][1]} {ctrl_inst/s_axis_data_ff[5][2]} {ctrl_inst/s_axis_data_ff[5][3]} {ctrl_inst/s_axis_data_ff[5][4]} {ctrl_inst/s_axis_data_ff[5][5]} {ctrl_inst/s_axis_data_ff[5][6]} {ctrl_inst/s_axis_data_ff[5][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 8 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {ctrl_inst/s_axis_data_ff[7][0]} {ctrl_inst/s_axis_data_ff[7][1]} {ctrl_inst/s_axis_data_ff[7][2]} {ctrl_inst/s_axis_data_ff[7][3]} {ctrl_inst/s_axis_data_ff[7][4]} {ctrl_inst/s_axis_data_ff[7][5]} {ctrl_inst/s_axis_data_ff[7][6]} {ctrl_inst/s_axis_data_ff[7][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 32 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {ctrl_inst/total_packet[0]} {ctrl_inst/total_packet[1]} {ctrl_inst/total_packet[2]} {ctrl_inst/total_packet[3]} {ctrl_inst/total_packet[4]} {ctrl_inst/total_packet[5]} {ctrl_inst/total_packet[6]} {ctrl_inst/total_packet[7]} {ctrl_inst/total_packet[8]} {ctrl_inst/total_packet[9]} {ctrl_inst/total_packet[10]} {ctrl_inst/total_packet[11]} {ctrl_inst/total_packet[12]} {ctrl_inst/total_packet[13]} {ctrl_inst/total_packet[14]} {ctrl_inst/total_packet[15]} {ctrl_inst/total_packet[16]} {ctrl_inst/total_packet[17]} {ctrl_inst/total_packet[18]} {ctrl_inst/total_packet[19]} {ctrl_inst/total_packet[20]} {ctrl_inst/total_packet[21]} {ctrl_inst/total_packet[22]} {ctrl_inst/total_packet[23]} {ctrl_inst/total_packet[24]} {ctrl_inst/total_packet[25]} {ctrl_inst/total_packet[26]} {ctrl_inst/total_packet[27]} {ctrl_inst/total_packet[28]} {ctrl_inst/total_packet[29]} {ctrl_inst/total_packet[30]} {ctrl_inst/total_packet[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 8 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {ctrl_inst/s_axis_data_ff[18][0]} {ctrl_inst/s_axis_data_ff[18][1]} {ctrl_inst/s_axis_data_ff[18][2]} {ctrl_inst/s_axis_data_ff[18][3]} {ctrl_inst/s_axis_data_ff[18][4]} {ctrl_inst/s_axis_data_ff[18][5]} {ctrl_inst/s_axis_data_ff[18][6]} {ctrl_inst/s_axis_data_ff[18][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 8 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list {ctrl_inst/s_axis_data_ff[3][0]} {ctrl_inst/s_axis_data_ff[3][1]} {ctrl_inst/s_axis_data_ff[3][2]} {ctrl_inst/s_axis_data_ff[3][3]} {ctrl_inst/s_axis_data_ff[3][4]} {ctrl_inst/s_axis_data_ff[3][5]} {ctrl_inst/s_axis_data_ff[3][6]} {ctrl_inst/s_axis_data_ff[3][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 8 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list {ctrl_inst/s_axis_data_ff[21][0]} {ctrl_inst/s_axis_data_ff[21][1]} {ctrl_inst/s_axis_data_ff[21][2]} {ctrl_inst/s_axis_data_ff[21][3]} {ctrl_inst/s_axis_data_ff[21][4]} {ctrl_inst/s_axis_data_ff[21][5]} {ctrl_inst/s_axis_data_ff[21][6]} {ctrl_inst/s_axis_data_ff[21][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 3 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list {ctrl_inst/data_cnt[0]} {ctrl_inst/data_cnt[1]} {ctrl_inst/data_cnt[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 16 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list {ctrl_inst/img_h[0]} {ctrl_inst/img_h[1]} {ctrl_inst/img_h[2]} {ctrl_inst/img_h[3]} {ctrl_inst/img_h[4]} {ctrl_inst/img_h[5]} {ctrl_inst/img_h[6]} {ctrl_inst/img_h[7]} {ctrl_inst/img_h[8]} {ctrl_inst/img_h[9]} {ctrl_inst/img_h[10]} {ctrl_inst/img_h[11]} {ctrl_inst/img_h[12]} {ctrl_inst/img_h[13]} {ctrl_inst/img_h[14]} {ctrl_inst/img_h[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 8 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list {ctrl_inst/s_axis_data_ff[17][0]} {ctrl_inst/s_axis_data_ff[17][1]} {ctrl_inst/s_axis_data_ff[17][2]} {ctrl_inst/s_axis_data_ff[17][3]} {ctrl_inst/s_axis_data_ff[17][4]} {ctrl_inst/s_axis_data_ff[17][5]} {ctrl_inst/s_axis_data_ff[17][6]} {ctrl_inst/s_axis_data_ff[17][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 8 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list {ctrl_inst/s_axis_data_ff[1][0]} {ctrl_inst/s_axis_data_ff[1][1]} {ctrl_inst/s_axis_data_ff[1][2]} {ctrl_inst/s_axis_data_ff[1][3]} {ctrl_inst/s_axis_data_ff[1][4]} {ctrl_inst/s_axis_data_ff[1][5]} {ctrl_inst/s_axis_data_ff[1][6]} {ctrl_inst/s_axis_data_ff[1][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 16 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list {ctrl_inst/algorithm_ctrl[0]} {ctrl_inst/algorithm_ctrl[1]} {ctrl_inst/algorithm_ctrl[2]} {ctrl_inst/algorithm_ctrl[3]} {ctrl_inst/algorithm_ctrl[4]} {ctrl_inst/algorithm_ctrl[5]} {ctrl_inst/algorithm_ctrl[6]} {ctrl_inst/algorithm_ctrl[7]} {ctrl_inst/algorithm_ctrl[8]} {ctrl_inst/algorithm_ctrl[9]} {ctrl_inst/algorithm_ctrl[10]} {ctrl_inst/algorithm_ctrl[11]} {ctrl_inst/algorithm_ctrl[12]} {ctrl_inst/algorithm_ctrl[13]} {ctrl_inst/algorithm_ctrl[14]} {ctrl_inst/algorithm_ctrl[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 8 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list {ctrl_inst/s_axis_data_ff[26][0]} {ctrl_inst/s_axis_data_ff[26][1]} {ctrl_inst/s_axis_data_ff[26][2]} {ctrl_inst/s_axis_data_ff[26][3]} {ctrl_inst/s_axis_data_ff[26][4]} {ctrl_inst/s_axis_data_ff[26][5]} {ctrl_inst/s_axis_data_ff[26][6]} {ctrl_inst/s_axis_data_ff[26][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 8 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list {ctrl_inst/s_axis_data_ff[13][0]} {ctrl_inst/s_axis_data_ff[13][1]} {ctrl_inst/s_axis_data_ff[13][2]} {ctrl_inst/s_axis_data_ff[13][3]} {ctrl_inst/s_axis_data_ff[13][4]} {ctrl_inst/s_axis_data_ff[13][5]} {ctrl_inst/s_axis_data_ff[13][6]} {ctrl_inst/s_axis_data_ff[13][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 8 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list {ctrl_inst/s_axis_data_ff[15][0]} {ctrl_inst/s_axis_data_ff[15][1]} {ctrl_inst/s_axis_data_ff[15][2]} {ctrl_inst/s_axis_data_ff[15][3]} {ctrl_inst/s_axis_data_ff[15][4]} {ctrl_inst/s_axis_data_ff[15][5]} {ctrl_inst/s_axis_data_ff[15][6]} {ctrl_inst/s_axis_data_ff[15][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 48 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list {ctrl_inst/frame_head[0]} {ctrl_inst/frame_head[1]} {ctrl_inst/frame_head[2]} {ctrl_inst/frame_head[3]} {ctrl_inst/frame_head[4]} {ctrl_inst/frame_head[5]} {ctrl_inst/frame_head[6]} {ctrl_inst/frame_head[7]} {ctrl_inst/frame_head[8]} {ctrl_inst/frame_head[9]} {ctrl_inst/frame_head[10]} {ctrl_inst/frame_head[11]} {ctrl_inst/frame_head[12]} {ctrl_inst/frame_head[13]} {ctrl_inst/frame_head[14]} {ctrl_inst/frame_head[15]} {ctrl_inst/frame_head[16]} {ctrl_inst/frame_head[17]} {ctrl_inst/frame_head[18]} {ctrl_inst/frame_head[19]} {ctrl_inst/frame_head[20]} {ctrl_inst/frame_head[21]} {ctrl_inst/frame_head[22]} {ctrl_inst/frame_head[23]} {ctrl_inst/frame_head[24]} {ctrl_inst/frame_head[25]} {ctrl_inst/frame_head[26]} {ctrl_inst/frame_head[27]} {ctrl_inst/frame_head[28]} {ctrl_inst/frame_head[29]} {ctrl_inst/frame_head[30]} {ctrl_inst/frame_head[31]} {ctrl_inst/frame_head[32]} {ctrl_inst/frame_head[33]} {ctrl_inst/frame_head[34]} {ctrl_inst/frame_head[35]} {ctrl_inst/frame_head[36]} {ctrl_inst/frame_head[37]} {ctrl_inst/frame_head[38]} {ctrl_inst/frame_head[39]} {ctrl_inst/frame_head[40]} {ctrl_inst/frame_head[41]} {ctrl_inst/frame_head[42]} {ctrl_inst/frame_head[43]} {ctrl_inst/frame_head[44]} {ctrl_inst/frame_head[45]} {ctrl_inst/frame_head[46]} {ctrl_inst/frame_head[47]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
set_property port_width 16 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list {ctrl_inst/frame_len[0]} {ctrl_inst/frame_len[1]} {ctrl_inst/frame_len[2]} {ctrl_inst/frame_len[3]} {ctrl_inst/frame_len[4]} {ctrl_inst/frame_len[5]} {ctrl_inst/frame_len[6]} {ctrl_inst/frame_len[7]} {ctrl_inst/frame_len[8]} {ctrl_inst/frame_len[9]} {ctrl_inst/frame_len[10]} {ctrl_inst/frame_len[11]} {ctrl_inst/frame_len[12]} {ctrl_inst/frame_len[13]} {ctrl_inst/frame_len[14]} {ctrl_inst/frame_len[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
set_property port_width 32 [get_debug_ports u_ila_0/probe30]
connect_debug_port u_ila_0/probe30 [get_nets [list {ctrl_inst/num[0]} {ctrl_inst/num[1]} {ctrl_inst/num[2]} {ctrl_inst/num[3]} {ctrl_inst/num[4]} {ctrl_inst/num[5]} {ctrl_inst/num[6]} {ctrl_inst/num[7]} {ctrl_inst/num[8]} {ctrl_inst/num[9]} {ctrl_inst/num[10]} {ctrl_inst/num[11]} {ctrl_inst/num[12]} {ctrl_inst/num[13]} {ctrl_inst/num[14]} {ctrl_inst/num[15]} {ctrl_inst/num[16]} {ctrl_inst/num[17]} {ctrl_inst/num[18]} {ctrl_inst/num[19]} {ctrl_inst/num[20]} {ctrl_inst/num[21]} {ctrl_inst/num[22]} {ctrl_inst/num[23]} {ctrl_inst/num[24]} {ctrl_inst/num[25]} {ctrl_inst/num[26]} {ctrl_inst/num[27]} {ctrl_inst/num[28]} {ctrl_inst/num[29]} {ctrl_inst/num[30]} {ctrl_inst/num[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
set_property port_width 8 [get_debug_ports u_ila_0/probe31]
connect_debug_port u_ila_0/probe31 [get_nets [list {ctrl_inst/s_axis_data_ff[12][0]} {ctrl_inst/s_axis_data_ff[12][1]} {ctrl_inst/s_axis_data_ff[12][2]} {ctrl_inst/s_axis_data_ff[12][3]} {ctrl_inst/s_axis_data_ff[12][4]} {ctrl_inst/s_axis_data_ff[12][5]} {ctrl_inst/s_axis_data_ff[12][6]} {ctrl_inst/s_axis_data_ff[12][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe32]
set_property port_width 8 [get_debug_ports u_ila_0/probe32]
connect_debug_port u_ila_0/probe32 [get_nets [list {ctrl_inst/s_axis_data_ff[16][0]} {ctrl_inst/s_axis_data_ff[16][1]} {ctrl_inst/s_axis_data_ff[16][2]} {ctrl_inst/s_axis_data_ff[16][3]} {ctrl_inst/s_axis_data_ff[16][4]} {ctrl_inst/s_axis_data_ff[16][5]} {ctrl_inst/s_axis_data_ff[16][6]} {ctrl_inst/s_axis_data_ff[16][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe33]
set_property port_width 8 [get_debug_ports u_ila_0/probe33]
connect_debug_port u_ila_0/probe33 [get_nets [list {ctrl_inst/s_axis_data_ff[9][0]} {ctrl_inst/s_axis_data_ff[9][1]} {ctrl_inst/s_axis_data_ff[9][2]} {ctrl_inst/s_axis_data_ff[9][3]} {ctrl_inst/s_axis_data_ff[9][4]} {ctrl_inst/s_axis_data_ff[9][5]} {ctrl_inst/s_axis_data_ff[9][6]} {ctrl_inst/s_axis_data_ff[9][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe34]
set_property port_width 27 [get_debug_ports u_ila_0/probe34]
connect_debug_port u_ila_0/probe34 [get_nets [list {ctrl_inst/s_axis_last_ff[0]} {ctrl_inst/s_axis_last_ff[1]} {ctrl_inst/s_axis_last_ff[2]} {ctrl_inst/s_axis_last_ff[3]} {ctrl_inst/s_axis_last_ff[4]} {ctrl_inst/s_axis_last_ff[5]} {ctrl_inst/s_axis_last_ff[6]} {ctrl_inst/s_axis_last_ff[7]} {ctrl_inst/s_axis_last_ff[8]} {ctrl_inst/s_axis_last_ff[9]} {ctrl_inst/s_axis_last_ff[10]} {ctrl_inst/s_axis_last_ff[11]} {ctrl_inst/s_axis_last_ff[12]} {ctrl_inst/s_axis_last_ff[13]} {ctrl_inst/s_axis_last_ff[14]} {ctrl_inst/s_axis_last_ff[15]} {ctrl_inst/s_axis_last_ff[16]} {ctrl_inst/s_axis_last_ff[17]} {ctrl_inst/s_axis_last_ff[18]} {ctrl_inst/s_axis_last_ff[19]} {ctrl_inst/s_axis_last_ff[20]} {ctrl_inst/s_axis_last_ff[21]} {ctrl_inst/s_axis_last_ff[22]} {ctrl_inst/s_axis_last_ff[23]} {ctrl_inst/s_axis_last_ff[24]} {ctrl_inst/s_axis_last_ff[25]} {ctrl_inst/s_axis_last_ff[26]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe35]
set_property port_width 16 [get_debug_ports u_ila_0/probe35]
connect_debug_port u_ila_0/probe35 [get_nets [list {ctrl_inst/img_w[0]} {ctrl_inst/img_w[1]} {ctrl_inst/img_w[2]} {ctrl_inst/img_w[3]} {ctrl_inst/img_w[4]} {ctrl_inst/img_w[5]} {ctrl_inst/img_w[6]} {ctrl_inst/img_w[7]} {ctrl_inst/img_w[8]} {ctrl_inst/img_w[9]} {ctrl_inst/img_w[10]} {ctrl_inst/img_w[11]} {ctrl_inst/img_w[12]} {ctrl_inst/img_w[13]} {ctrl_inst/img_w[14]} {ctrl_inst/img_w[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe36]
set_property port_width 8 [get_debug_ports u_ila_0/probe36]
connect_debug_port u_ila_0/probe36 [get_nets [list {ctrl_inst/s_axis_data[0]} {ctrl_inst/s_axis_data[1]} {ctrl_inst/s_axis_data[2]} {ctrl_inst/s_axis_data[3]} {ctrl_inst/s_axis_data[4]} {ctrl_inst/s_axis_data[5]} {ctrl_inst/s_axis_data[6]} {ctrl_inst/s_axis_data[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe37]
set_property port_width 8 [get_debug_ports u_ila_0/probe37]
connect_debug_port u_ila_0/probe37 [get_nets [list {ctrl_inst/m_axis_data[0]} {ctrl_inst/m_axis_data[1]} {ctrl_inst/m_axis_data[2]} {ctrl_inst/m_axis_data[3]} {ctrl_inst/m_axis_data[4]} {ctrl_inst/m_axis_data[5]} {ctrl_inst/m_axis_data[6]} {ctrl_inst/m_axis_data[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe38]
set_property port_width 8 [get_debug_ports u_ila_0/probe38]
connect_debug_port u_ila_0/probe38 [get_nets [list {ctrl_inst/s_axis_data_ff[0][0]} {ctrl_inst/s_axis_data_ff[0][1]} {ctrl_inst/s_axis_data_ff[0][2]} {ctrl_inst/s_axis_data_ff[0][3]} {ctrl_inst/s_axis_data_ff[0][4]} {ctrl_inst/s_axis_data_ff[0][5]} {ctrl_inst/s_axis_data_ff[0][6]} {ctrl_inst/s_axis_data_ff[0][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe39]
set_property port_width 8 [get_debug_ports u_ila_0/probe39]
connect_debug_port u_ila_0/probe39 [get_nets [list {ctrl_inst/s_axis_data_ff[10][0]} {ctrl_inst/s_axis_data_ff[10][1]} {ctrl_inst/s_axis_data_ff[10][2]} {ctrl_inst/s_axis_data_ff[10][3]} {ctrl_inst/s_axis_data_ff[10][4]} {ctrl_inst/s_axis_data_ff[10][5]} {ctrl_inst/s_axis_data_ff[10][6]} {ctrl_inst/s_axis_data_ff[10][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe40]
set_property port_width 8 [get_debug_ports u_ila_0/probe40]
connect_debug_port u_ila_0/probe40 [get_nets [list {ctrl_inst/s_axis_data_ff[11][0]} {ctrl_inst/s_axis_data_ff[11][1]} {ctrl_inst/s_axis_data_ff[11][2]} {ctrl_inst/s_axis_data_ff[11][3]} {ctrl_inst/s_axis_data_ff[11][4]} {ctrl_inst/s_axis_data_ff[11][5]} {ctrl_inst/s_axis_data_ff[11][6]} {ctrl_inst/s_axis_data_ff[11][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe41]
set_property port_width 8 [get_debug_ports u_ila_0/probe41]
connect_debug_port u_ila_0/probe41 [get_nets [list {ctrl_inst/s_axis_data_ff[14][0]} {ctrl_inst/s_axis_data_ff[14][1]} {ctrl_inst/s_axis_data_ff[14][2]} {ctrl_inst/s_axis_data_ff[14][3]} {ctrl_inst/s_axis_data_ff[14][4]} {ctrl_inst/s_axis_data_ff[14][5]} {ctrl_inst/s_axis_data_ff[14][6]} {ctrl_inst/s_axis_data_ff[14][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe42]
set_property port_width 8 [get_debug_ports u_ila_0/probe42]
connect_debug_port u_ila_0/probe42 [get_nets [list {ctrl_inst/s_axis_data_ff[20][0]} {ctrl_inst/s_axis_data_ff[20][1]} {ctrl_inst/s_axis_data_ff[20][2]} {ctrl_inst/s_axis_data_ff[20][3]} {ctrl_inst/s_axis_data_ff[20][4]} {ctrl_inst/s_axis_data_ff[20][5]} {ctrl_inst/s_axis_data_ff[20][6]} {ctrl_inst/s_axis_data_ff[20][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe43]
set_property port_width 8 [get_debug_ports u_ila_0/probe43]
connect_debug_port u_ila_0/probe43 [get_nets [list {ctrl_inst/s_axis_data_ff[2][0]} {ctrl_inst/s_axis_data_ff[2][1]} {ctrl_inst/s_axis_data_ff[2][2]} {ctrl_inst/s_axis_data_ff[2][3]} {ctrl_inst/s_axis_data_ff[2][4]} {ctrl_inst/s_axis_data_ff[2][5]} {ctrl_inst/s_axis_data_ff[2][6]} {ctrl_inst/s_axis_data_ff[2][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe44]
set_property port_width 9 [get_debug_ports u_ila_0/probe44]
connect_debug_port u_ila_0/probe44 [get_nets [list {eth2ddr_inst/eth2ddr_rbuf_ping/dout[0]} {eth2ddr_inst/eth2ddr_rbuf_ping/dout[1]} {eth2ddr_inst/eth2ddr_rbuf_ping/dout[2]} {eth2ddr_inst/eth2ddr_rbuf_ping/dout[3]} {eth2ddr_inst/eth2ddr_rbuf_ping/dout[4]} {eth2ddr_inst/eth2ddr_rbuf_ping/dout[5]} {eth2ddr_inst/eth2ddr_rbuf_ping/dout[6]} {eth2ddr_inst/eth2ddr_rbuf_ping/dout[7]} {eth2ddr_inst/eth2ddr_rbuf_ping/dout[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe45]
set_property port_width 32 [get_debug_ports u_ila_0/probe45]
connect_debug_port u_ila_0/probe45 [get_nets [list {eth2ddr_inst/eth2ddr_rbuf_ping/m_addr[0]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_addr[1]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_addr[2]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_addr[3]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_addr[4]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_addr[5]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_addr[6]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_addr[7]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_addr[8]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_addr[9]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_addr[10]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_addr[11]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_addr[12]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_addr[13]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_addr[14]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_addr[15]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_addr[16]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_addr[17]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_addr[18]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_addr[19]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_addr[20]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_addr[21]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_addr[22]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_addr[23]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_addr[24]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_addr[25]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_addr[26]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_addr[27]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_addr[28]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_addr[29]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_addr[30]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_addr[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe46]
set_property port_width 128 [get_debug_ports u_ila_0/probe46]
connect_debug_port u_ila_0/probe46 [get_nets [list {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[0]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[1]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[2]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[3]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[4]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[5]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[6]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[7]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[8]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[9]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[10]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[11]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[12]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[13]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[14]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[15]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[16]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[17]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[18]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[19]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[20]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[21]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[22]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[23]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[24]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[25]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[26]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[27]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[28]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[29]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[30]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[31]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[32]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[33]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[34]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[35]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[36]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[37]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[38]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[39]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[40]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[41]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[42]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[43]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[44]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[45]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[46]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[47]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[48]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[49]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[50]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[51]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[52]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[53]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[54]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[55]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[56]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[57]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[58]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[59]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[60]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[61]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[62]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[63]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[64]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[65]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[66]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[67]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[68]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[69]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[70]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[71]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[72]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[73]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[74]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[75]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[76]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[77]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[78]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[79]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[80]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[81]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[82]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[83]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[84]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[85]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[86]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[87]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[88]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[89]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[90]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[91]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[92]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[93]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[94]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[95]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[96]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[97]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[98]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[99]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[100]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[101]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[102]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[103]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[104]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[105]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[106]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[107]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[108]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[109]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[110]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[111]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[112]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[113]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[114]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[115]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[116]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[117]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[118]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[119]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[120]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[121]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[122]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[123]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[124]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[125]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[126]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tdata[127]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe47]
set_property port_width 32 [get_debug_ports u_ila_0/probe47]
connect_debug_port u_ila_0/probe47 [get_nets [list {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_addr[0]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_addr[1]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_addr[2]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_addr[3]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_addr[4]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_addr[5]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_addr[6]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_addr[7]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_addr[8]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_addr[9]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_addr[10]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_addr[11]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_addr[12]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_addr[13]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_addr[14]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_addr[15]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_addr[16]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_addr[17]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_addr[18]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_addr[19]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_addr[20]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_addr[21]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_addr[22]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_addr[23]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_addr[24]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_addr[25]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_addr[26]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_addr[27]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_addr[28]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_addr[29]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_addr[30]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_addr[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe48]
set_property port_width 8 [get_debug_ports u_ila_0/probe48]
connect_debug_port u_ila_0/probe48 [get_nets [list {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_data_ff[0]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_data_ff[1]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_data_ff[2]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_data_ff[3]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_data_ff[4]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_data_ff[5]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_data_ff[6]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_data_ff[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe49]
set_property port_width 8 [get_debug_ports u_ila_0/probe49]
connect_debug_port u_ila_0/probe49 [get_nets [list {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_data[0]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_data[1]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_data[2]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_data[3]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_data[4]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_data[5]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_data[6]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_data[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe50]
set_property port_width 16 [get_debug_ports u_ila_0/probe50]
connect_debug_port u_ila_0/probe50 [get_nets [list {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_keep[0]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_keep[1]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_keep[2]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_keep[3]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_keep[4]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_keep[5]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_keep[6]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_keep[7]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_keep[8]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_keep[9]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_keep[10]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_keep[11]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_keep[12]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_keep[13]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_keep[14]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_keep[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe51]
set_property port_width 32 [get_debug_ports u_ila_0/probe51]
connect_debug_port u_ila_0/probe51 [get_nets [list {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_len[0]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_len[1]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_len[2]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_len[3]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_len[4]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_len[5]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_len[6]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_len[7]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_len[8]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_len[9]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_len[10]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_len[11]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_len[12]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_len[13]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_len[14]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_len[15]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_len[16]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_len[17]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_len[18]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_len[19]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_len[20]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_len[21]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_len[22]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_len[23]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_len[24]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_len[25]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_len[26]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_len[27]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_len[28]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_len[29]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_len[30]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_len[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe52]
set_property port_width 8 [get_debug_ports u_ila_0/probe52]
connect_debug_port u_ila_0/probe52 [get_nets [list {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_tdata[0]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_tdata[1]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_tdata[2]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_tdata[3]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_tdata[4]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_tdata[5]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_tdata[6]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_tdata[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe53]
set_property port_width 8 [get_debug_ports u_ila_0/probe53]
connect_debug_port u_ila_0/probe53 [get_nets [list {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_data[0]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_data[1]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_data[2]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_data[3]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_data[4]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_data[5]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_data[6]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_data[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe54]
set_property port_width 8 [get_debug_ports u_ila_0/probe54]
connect_debug_port u_ila_0/probe54 [get_nets [list {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_data_ff[0]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_data_ff[1]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_data_ff[2]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_data_ff[3]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_data_ff[4]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_data_ff[5]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_data_ff[6]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_data_ff[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe55]
set_property port_width 9 [get_debug_ports u_ila_0/probe55]
connect_debug_port u_ila_0/probe55 [get_nets [list {eth2ddr_inst/eth2ddr_rbuf_pang/din[0]} {eth2ddr_inst/eth2ddr_rbuf_pang/din[1]} {eth2ddr_inst/eth2ddr_rbuf_pang/din[2]} {eth2ddr_inst/eth2ddr_rbuf_pang/din[3]} {eth2ddr_inst/eth2ddr_rbuf_pang/din[4]} {eth2ddr_inst/eth2ddr_rbuf_pang/din[5]} {eth2ddr_inst/eth2ddr_rbuf_pang/din[6]} {eth2ddr_inst/eth2ddr_rbuf_pang/din[7]} {eth2ddr_inst/eth2ddr_rbuf_pang/din[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe56]
set_property port_width 32 [get_debug_ports u_ila_0/probe56]
connect_debug_port u_ila_0/probe56 [get_nets [list {eth2ddr_inst/eth2ddr_rbuf_pang/m_addr[0]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_addr[1]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_addr[2]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_addr[3]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_addr[4]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_addr[5]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_addr[6]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_addr[7]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_addr[8]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_addr[9]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_addr[10]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_addr[11]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_addr[12]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_addr[13]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_addr[14]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_addr[15]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_addr[16]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_addr[17]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_addr[18]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_addr[19]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_addr[20]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_addr[21]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_addr[22]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_addr[23]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_addr[24]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_addr[25]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_addr[26]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_addr[27]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_addr[28]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_addr[29]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_addr[30]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_addr[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe57]
set_property port_width 128 [get_debug_ports u_ila_0/probe57]
connect_debug_port u_ila_0/probe57 [get_nets [list {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[0]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[1]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[2]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[3]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[4]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[5]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[6]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[7]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[8]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[9]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[10]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[11]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[12]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[13]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[14]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[15]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[16]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[17]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[18]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[19]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[20]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[21]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[22]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[23]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[24]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[25]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[26]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[27]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[28]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[29]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[30]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[31]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[32]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[33]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[34]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[35]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[36]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[37]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[38]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[39]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[40]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[41]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[42]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[43]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[44]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[45]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[46]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[47]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[48]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[49]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[50]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[51]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[52]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[53]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[54]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[55]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[56]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[57]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[58]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[59]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[60]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[61]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[62]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[63]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[64]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[65]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[66]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[67]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[68]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[69]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[70]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[71]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[72]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[73]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[74]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[75]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[76]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[77]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[78]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[79]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[80]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[81]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[82]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[83]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[84]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[85]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[86]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[87]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[88]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[89]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[90]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[91]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[92]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[93]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[94]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[95]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[96]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[97]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[98]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[99]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[100]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[101]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[102]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[103]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[104]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[105]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[106]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[107]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[108]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[109]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[110]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[111]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[112]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[113]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[114]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[115]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[116]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[117]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[118]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[119]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[120]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[121]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[122]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[123]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[124]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[125]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[126]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_data[127]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe58]
set_property port_width 32 [get_debug_ports u_ila_0/probe58]
connect_debug_port u_ila_0/probe58 [get_nets [list {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_addr[0]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_addr[1]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_addr[2]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_addr[3]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_addr[4]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_addr[5]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_addr[6]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_addr[7]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_addr[8]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_addr[9]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_addr[10]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_addr[11]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_addr[12]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_addr[13]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_addr[14]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_addr[15]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_addr[16]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_addr[17]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_addr[18]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_addr[19]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_addr[20]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_addr[21]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_addr[22]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_addr[23]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_addr[24]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_addr[25]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_addr[26]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_addr[27]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_addr[28]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_addr[29]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_addr[30]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_addr[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe59]
set_property port_width 128 [get_debug_ports u_ila_0/probe59]
connect_debug_port u_ila_0/probe59 [get_nets [list {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[0]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[1]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[2]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[3]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[4]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[5]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[6]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[7]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[8]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[9]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[10]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[11]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[12]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[13]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[14]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[15]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[16]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[17]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[18]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[19]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[20]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[21]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[22]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[23]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[24]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[25]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[26]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[27]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[28]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[29]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[30]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[31]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[32]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[33]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[34]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[35]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[36]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[37]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[38]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[39]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[40]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[41]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[42]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[43]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[44]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[45]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[46]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[47]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[48]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[49]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[50]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[51]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[52]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[53]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[54]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[55]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[56]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[57]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[58]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[59]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[60]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[61]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[62]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[63]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[64]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[65]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[66]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[67]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[68]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[69]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[70]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[71]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[72]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[73]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[74]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[75]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[76]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[77]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[78]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[79]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[80]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[81]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[82]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[83]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[84]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[85]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[86]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[87]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[88]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[89]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[90]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[91]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[92]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[93]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[94]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[95]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[96]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[97]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[98]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[99]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[100]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[101]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[102]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[103]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[104]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[105]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[106]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[107]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[108]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[109]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[110]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[111]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[112]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[113]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[114]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[115]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[116]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[117]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[118]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[119]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[120]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[121]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[122]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[123]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[124]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[125]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[126]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tdata[127]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe60]
set_property port_width 32 [get_debug_ports u_ila_0/probe60]
connect_debug_port u_ila_0/probe60 [get_nets [list {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_len[0]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_len[1]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_len[2]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_len[3]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_len[4]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_len[5]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_len[6]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_len[7]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_len[8]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_len[9]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_len[10]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_len[11]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_len[12]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_len[13]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_len[14]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_len[15]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_len[16]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_len[17]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_len[18]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_len[19]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_len[20]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_len[21]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_len[22]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_len[23]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_len[24]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_len[25]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_len[26]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_len[27]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_len[28]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_len[29]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_len[30]} {eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_len[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe61]
set_property port_width 9 [get_debug_ports u_ila_0/probe61]
connect_debug_port u_ila_0/probe61 [get_nets [list {eth2ddr_inst/eth2ddr_rbuf_pang/dout[0]} {eth2ddr_inst/eth2ddr_rbuf_pang/dout[1]} {eth2ddr_inst/eth2ddr_rbuf_pang/dout[2]} {eth2ddr_inst/eth2ddr_rbuf_pang/dout[3]} {eth2ddr_inst/eth2ddr_rbuf_pang/dout[4]} {eth2ddr_inst/eth2ddr_rbuf_pang/dout[5]} {eth2ddr_inst/eth2ddr_rbuf_pang/dout[6]} {eth2ddr_inst/eth2ddr_rbuf_pang/dout[7]} {eth2ddr_inst/eth2ddr_rbuf_pang/dout[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe62]
set_property port_width 4 [get_debug_ports u_ila_0/probe62]
connect_debug_port u_ila_0/probe62 [get_nets [list {eth2ddr_inst/eth2ddr_rbuf_pang/curr_state[0]} {eth2ddr_inst/eth2ddr_rbuf_pang/curr_state[1]} {eth2ddr_inst/eth2ddr_rbuf_pang/curr_state[2]} {eth2ddr_inst/eth2ddr_rbuf_pang/curr_state[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe63]
set_property port_width 32 [get_debug_ports u_ila_0/probe63]
connect_debug_port u_ila_0/probe63 [get_nets [list {eth2ddr_inst/eth2ddr_rbuf_pang/m_len[0]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_len[1]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_len[2]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_len[3]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_len[4]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_len[5]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_len[6]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_len[7]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_len[8]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_len[9]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_len[10]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_len[11]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_len[12]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_len[13]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_len[14]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_len[15]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_len[16]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_len[17]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_len[18]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_len[19]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_len[20]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_len[21]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_len[22]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_len[23]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_len[24]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_len[25]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_len[26]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_len[27]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_len[28]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_len[29]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_len[30]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_len[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe64]
set_property port_width 32 [get_debug_ports u_ila_0/probe64]
connect_debug_port u_ila_0/probe64 [get_nets [list {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_len[0]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_len[1]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_len[2]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_len[3]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_len[4]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_len[5]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_len[6]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_len[7]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_len[8]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_len[9]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_len[10]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_len[11]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_len[12]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_len[13]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_len[14]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_len[15]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_len[16]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_len[17]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_len[18]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_len[19]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_len[20]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_len[21]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_len[22]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_len[23]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_len[24]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_len[25]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_len[26]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_len[27]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_len[28]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_len[29]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_len[30]} {eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_len[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe65]
set_property port_width 4 [get_debug_ports u_ila_0/probe65]
connect_debug_port u_ila_0/probe65 [get_nets [list {eth2ddr_inst/eth2ddr_rbuf_ping/curr_state[0]} {eth2ddr_inst/eth2ddr_rbuf_ping/curr_state[1]} {eth2ddr_inst/eth2ddr_rbuf_ping/curr_state[2]} {eth2ddr_inst/eth2ddr_rbuf_ping/curr_state[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe66]
set_property port_width 16 [get_debug_ports u_ila_0/probe66]
connect_debug_port u_ila_0/probe66 [get_nets [list {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len[0]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len[1]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len[2]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len[3]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len[4]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len[5]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len[6]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len[7]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len[8]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len[9]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len[10]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len[11]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len[12]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len[13]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len[14]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe67]
set_property port_width 32 [get_debug_ports u_ila_0/probe67]
connect_debug_port u_ila_0/probe67 [get_nets [list {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_len[0]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_len[1]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_len[2]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_len[3]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_len[4]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_len[5]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_len[6]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_len[7]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_len[8]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_len[9]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_len[10]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_len[11]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_len[12]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_len[13]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_len[14]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_len[15]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_len[16]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_len[17]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_len[18]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_len[19]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_len[20]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_len[21]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_len[22]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_len[23]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_len[24]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_len[25]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_len[26]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_len[27]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_len[28]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_len[29]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_len[30]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_len[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe68]
set_property port_width 16 [get_debug_ports u_ila_0/probe68]
connect_debug_port u_ila_0/probe68 [get_nets [list {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tkeep[0]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tkeep[1]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tkeep[2]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tkeep[3]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tkeep[4]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tkeep[5]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tkeep[6]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tkeep[7]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tkeep[8]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tkeep[9]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tkeep[10]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tkeep[11]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tkeep[12]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tkeep[13]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tkeep[14]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tkeep[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe69]
set_property port_width 16 [get_debug_ports u_ila_0/probe69]
connect_debug_port u_ila_0/probe69 [get_nets [list {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_keep[0]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_keep[1]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_keep[2]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_keep[3]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_keep[4]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_keep[5]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_keep[6]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_keep[7]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_keep[8]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_keep[9]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_keep[10]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_keep[11]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_keep[12]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_keep[13]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_keep[14]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_keep[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe70]
set_property port_width 32 [get_debug_ports u_ila_0/probe70]
connect_debug_port u_ila_0/probe70 [get_nets [list {eth2ddr_inst/eth2ddr_rbuf_ping/m_len[0]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_len[1]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_len[2]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_len[3]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_len[4]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_len[5]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_len[6]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_len[7]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_len[8]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_len[9]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_len[10]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_len[11]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_len[12]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_len[13]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_len[14]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_len[15]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_len[16]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_len[17]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_len[18]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_len[19]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_len[20]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_len[21]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_len[22]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_len[23]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_len[24]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_len[25]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_len[26]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_len[27]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_len[28]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_len[29]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_len[30]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_len[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe71]
set_property port_width 32 [get_debug_ports u_ila_0/probe71]
connect_debug_port u_ila_0/probe71 [get_nets [list {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len_ff[0]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len_ff[1]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len_ff[2]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len_ff[3]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len_ff[4]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len_ff[5]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len_ff[6]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len_ff[7]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len_ff[8]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len_ff[9]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len_ff[10]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len_ff[11]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len_ff[12]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len_ff[13]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len_ff[14]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len_ff[15]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len_ff[16]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len_ff[17]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len_ff[18]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len_ff[19]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len_ff[20]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len_ff[21]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len_ff[22]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len_ff[23]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len_ff[24]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len_ff[25]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len_ff[26]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len_ff[27]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len_ff[28]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len_ff[29]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len_ff[30]} {eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_len_ff[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe72]
set_property port_width 9 [get_debug_ports u_ila_0/probe72]
connect_debug_port u_ila_0/probe72 [get_nets [list {eth2ddr_inst/eth2ddr_rbuf_ping/din[0]} {eth2ddr_inst/eth2ddr_rbuf_ping/din[1]} {eth2ddr_inst/eth2ddr_rbuf_ping/din[2]} {eth2ddr_inst/eth2ddr_rbuf_ping/din[3]} {eth2ddr_inst/eth2ddr_rbuf_ping/din[4]} {eth2ddr_inst/eth2ddr_rbuf_ping/din[5]} {eth2ddr_inst/eth2ddr_rbuf_ping/din[6]} {eth2ddr_inst/eth2ddr_rbuf_ping/din[7]} {eth2ddr_inst/eth2ddr_rbuf_ping/din[8]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe73]
set_property port_width 32 [get_debug_ports u_ila_0/probe73]
connect_debug_port u_ila_0/probe73 [get_nets [list {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_addr[0]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_addr[1]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_addr[2]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_addr[3]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_addr[4]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_addr[5]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_addr[6]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_addr[7]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_addr[8]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_addr[9]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_addr[10]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_addr[11]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_addr[12]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_addr[13]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_addr[14]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_addr[15]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_addr[16]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_addr[17]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_addr[18]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_addr[19]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_addr[20]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_addr[21]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_addr[22]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_addr[23]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_addr[24]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_addr[25]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_addr[26]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_addr[27]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_addr[28]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_addr[29]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_addr[30]} {eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_addr[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe74]
set_property port_width 32 [get_debug_ports u_ila_0/probe74]
connect_debug_port u_ila_0/probe74 [get_nets [list {eth2ddr_inst/eth2ddr_ctrl_inst/p_2_in[0]} {eth2ddr_inst/eth2ddr_ctrl_inst/p_2_in[1]} {eth2ddr_inst/eth2ddr_ctrl_inst/p_2_in[2]} {eth2ddr_inst/eth2ddr_ctrl_inst/p_2_in[3]} {eth2ddr_inst/eth2ddr_ctrl_inst/p_2_in[4]} {eth2ddr_inst/eth2ddr_ctrl_inst/p_2_in[5]} {eth2ddr_inst/eth2ddr_ctrl_inst/p_2_in[6]} {eth2ddr_inst/eth2ddr_ctrl_inst/p_2_in[7]} {eth2ddr_inst/eth2ddr_ctrl_inst/p_2_in[8]} {eth2ddr_inst/eth2ddr_ctrl_inst/p_2_in[9]} {eth2ddr_inst/eth2ddr_ctrl_inst/p_2_in[10]} {eth2ddr_inst/eth2ddr_ctrl_inst/p_2_in[11]} {eth2ddr_inst/eth2ddr_ctrl_inst/p_2_in[12]} {eth2ddr_inst/eth2ddr_ctrl_inst/p_2_in[13]} {eth2ddr_inst/eth2ddr_ctrl_inst/p_2_in[14]} {eth2ddr_inst/eth2ddr_ctrl_inst/p_2_in[15]} {eth2ddr_inst/eth2ddr_ctrl_inst/p_2_in[16]} {eth2ddr_inst/eth2ddr_ctrl_inst/p_2_in[17]} {eth2ddr_inst/eth2ddr_ctrl_inst/p_2_in[18]} {eth2ddr_inst/eth2ddr_ctrl_inst/p_2_in[19]} {eth2ddr_inst/eth2ddr_ctrl_inst/p_2_in[20]} {eth2ddr_inst/eth2ddr_ctrl_inst/p_2_in[21]} {eth2ddr_inst/eth2ddr_ctrl_inst/p_2_in[22]} {eth2ddr_inst/eth2ddr_ctrl_inst/p_2_in[23]} {eth2ddr_inst/eth2ddr_ctrl_inst/p_2_in[24]} {eth2ddr_inst/eth2ddr_ctrl_inst/p_2_in[25]} {eth2ddr_inst/eth2ddr_ctrl_inst/p_2_in[26]} {eth2ddr_inst/eth2ddr_ctrl_inst/p_2_in[27]} {eth2ddr_inst/eth2ddr_ctrl_inst/p_2_in[28]} {eth2ddr_inst/eth2ddr_ctrl_inst/p_2_in[29]} {eth2ddr_inst/eth2ddr_ctrl_inst/p_2_in[30]} {eth2ddr_inst/eth2ddr_ctrl_inst/p_2_in[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe75]
set_property port_width 16 [get_debug_ports u_ila_0/probe75]
connect_debug_port u_ila_0/probe75 [get_nets [list {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tkeep[0]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tkeep[1]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tkeep[2]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tkeep[3]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tkeep[4]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tkeep[5]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tkeep[6]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tkeep[7]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tkeep[8]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tkeep[9]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tkeep[10]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tkeep[11]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tkeep[12]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tkeep[13]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tkeep[14]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tkeep[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe76]
set_property port_width 32 [get_debug_ports u_ila_0/probe76]
connect_debug_port u_ila_0/probe76 [get_nets [list {eth2ddr_inst/eth2ddr_ctrl_inst/addr[0]} {eth2ddr_inst/eth2ddr_ctrl_inst/addr[1]} {eth2ddr_inst/eth2ddr_ctrl_inst/addr[2]} {eth2ddr_inst/eth2ddr_ctrl_inst/addr[3]} {eth2ddr_inst/eth2ddr_ctrl_inst/addr[4]} {eth2ddr_inst/eth2ddr_ctrl_inst/addr[5]} {eth2ddr_inst/eth2ddr_ctrl_inst/addr[6]} {eth2ddr_inst/eth2ddr_ctrl_inst/addr[7]} {eth2ddr_inst/eth2ddr_ctrl_inst/addr[8]} {eth2ddr_inst/eth2ddr_ctrl_inst/addr[9]} {eth2ddr_inst/eth2ddr_ctrl_inst/addr[10]} {eth2ddr_inst/eth2ddr_ctrl_inst/addr[11]} {eth2ddr_inst/eth2ddr_ctrl_inst/addr[12]} {eth2ddr_inst/eth2ddr_ctrl_inst/addr[13]} {eth2ddr_inst/eth2ddr_ctrl_inst/addr[14]} {eth2ddr_inst/eth2ddr_ctrl_inst/addr[15]} {eth2ddr_inst/eth2ddr_ctrl_inst/addr[16]} {eth2ddr_inst/eth2ddr_ctrl_inst/addr[17]} {eth2ddr_inst/eth2ddr_ctrl_inst/addr[18]} {eth2ddr_inst/eth2ddr_ctrl_inst/addr[19]} {eth2ddr_inst/eth2ddr_ctrl_inst/addr[20]} {eth2ddr_inst/eth2ddr_ctrl_inst/addr[21]} {eth2ddr_inst/eth2ddr_ctrl_inst/addr[22]} {eth2ddr_inst/eth2ddr_ctrl_inst/addr[23]} {eth2ddr_inst/eth2ddr_ctrl_inst/addr[24]} {eth2ddr_inst/eth2ddr_ctrl_inst/addr[25]} {eth2ddr_inst/eth2ddr_ctrl_inst/addr[26]} {eth2ddr_inst/eth2ddr_ctrl_inst/addr[27]} {eth2ddr_inst/eth2ddr_ctrl_inst/addr[28]} {eth2ddr_inst/eth2ddr_ctrl_inst/addr[29]} {eth2ddr_inst/eth2ddr_ctrl_inst/addr[30]} {eth2ddr_inst/eth2ddr_ctrl_inst/addr[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe77]
set_property port_width 32 [get_debug_ports u_ila_0/probe77]
connect_debug_port u_ila_0/probe77 [get_nets [list {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_addr[0]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_addr[1]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_addr[2]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_addr[3]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_addr[4]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_addr[5]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_addr[6]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_addr[7]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_addr[8]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_addr[9]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_addr[10]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_addr[11]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_addr[12]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_addr[13]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_addr[14]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_addr[15]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_addr[16]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_addr[17]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_addr[18]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_addr[19]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_addr[20]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_addr[21]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_addr[22]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_addr[23]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_addr[24]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_addr[25]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_addr[26]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_addr[27]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_addr[28]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_addr[29]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_addr[30]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_addr[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe78]
set_property port_width 8 [get_debug_ports u_ila_0/probe78]
connect_debug_port u_ila_0/probe78 [get_nets [list {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_data_ff[0]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_data_ff[1]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_data_ff[2]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_data_ff[3]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_data_ff[4]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_data_ff[5]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_data_ff[6]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_data_ff[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe79]
set_property port_width 32 [get_debug_ports u_ila_0/probe79]
connect_debug_port u_ila_0/probe79 [get_nets [list {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_len[0]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_len[1]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_len[2]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_len[3]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_len[4]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_len[5]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_len[6]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_len[7]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_len[8]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_len[9]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_len[10]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_len[11]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_len[12]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_len[13]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_len[14]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_len[15]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_len[16]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_len[17]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_len[18]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_len[19]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_len[20]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_len[21]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_len[22]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_len[23]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_len[24]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_len[25]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_len[26]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_len[27]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_len[28]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_len[29]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_len[30]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_len[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe80]
set_property port_width 8 [get_debug_ports u_ila_0/probe80]
connect_debug_port u_ila_0/probe80 [get_nets [list {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_tdata[0]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_tdata[1]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_tdata[2]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_tdata[3]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_tdata[4]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_tdata[5]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_tdata[6]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_tdata[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe81]
set_property port_width 128 [get_debug_ports u_ila_0/probe81]
connect_debug_port u_ila_0/probe81 [get_nets [list {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[0]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[1]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[2]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[3]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[4]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[5]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[6]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[7]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[8]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[9]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[10]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[11]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[12]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[13]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[14]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[15]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[16]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[17]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[18]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[19]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[20]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[21]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[22]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[23]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[24]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[25]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[26]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[27]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[28]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[29]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[30]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[31]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[32]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[33]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[34]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[35]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[36]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[37]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[38]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[39]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[40]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[41]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[42]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[43]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[44]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[45]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[46]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[47]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[48]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[49]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[50]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[51]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[52]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[53]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[54]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[55]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[56]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[57]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[58]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[59]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[60]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[61]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[62]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[63]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[64]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[65]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[66]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[67]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[68]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[69]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[70]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[71]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[72]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[73]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[74]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[75]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[76]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[77]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[78]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[79]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[80]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[81]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[82]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[83]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[84]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[85]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[86]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[87]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[88]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[89]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[90]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[91]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[92]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[93]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[94]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[95]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[96]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[97]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[98]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[99]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[100]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[101]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[102]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[103]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[104]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[105]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[106]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[107]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[108]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[109]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[110]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[111]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[112]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[113]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[114]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[115]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[116]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[117]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[118]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[119]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[120]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[121]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[122]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[123]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[124]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[125]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[126]} {eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_data[127]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe82]
set_property port_width 32 [get_debug_ports u_ila_0/probe82]
connect_debug_port u_ila_0/probe82 [get_nets [list {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_addr[0]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_addr[1]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_addr[2]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_addr[3]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_addr[4]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_addr[5]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_addr[6]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_addr[7]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_addr[8]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_addr[9]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_addr[10]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_addr[11]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_addr[12]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_addr[13]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_addr[14]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_addr[15]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_addr[16]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_addr[17]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_addr[18]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_addr[19]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_addr[20]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_addr[21]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_addr[22]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_addr[23]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_addr[24]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_addr[25]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_addr[26]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_addr[27]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_addr[28]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_addr[29]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_addr[30]} {eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_addr[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe83]
set_property port_width 32 [get_debug_ports u_ila_0/probe83]
connect_debug_port u_ila_0/probe83 [get_nets [list {eth2ddr_m_axi_awaddr[0]} {eth2ddr_m_axi_awaddr[1]} {eth2ddr_m_axi_awaddr[2]} {eth2ddr_m_axi_awaddr[3]} {eth2ddr_m_axi_awaddr[4]} {eth2ddr_m_axi_awaddr[5]} {eth2ddr_m_axi_awaddr[6]} {eth2ddr_m_axi_awaddr[7]} {eth2ddr_m_axi_awaddr[8]} {eth2ddr_m_axi_awaddr[9]} {eth2ddr_m_axi_awaddr[10]} {eth2ddr_m_axi_awaddr[11]} {eth2ddr_m_axi_awaddr[12]} {eth2ddr_m_axi_awaddr[13]} {eth2ddr_m_axi_awaddr[14]} {eth2ddr_m_axi_awaddr[15]} {eth2ddr_m_axi_awaddr[16]} {eth2ddr_m_axi_awaddr[17]} {eth2ddr_m_axi_awaddr[18]} {eth2ddr_m_axi_awaddr[19]} {eth2ddr_m_axi_awaddr[20]} {eth2ddr_m_axi_awaddr[21]} {eth2ddr_m_axi_awaddr[22]} {eth2ddr_m_axi_awaddr[23]} {eth2ddr_m_axi_awaddr[24]} {eth2ddr_m_axi_awaddr[25]} {eth2ddr_m_axi_awaddr[26]} {eth2ddr_m_axi_awaddr[27]} {eth2ddr_m_axi_awaddr[28]} {eth2ddr_m_axi_awaddr[29]} {eth2ddr_m_axi_awaddr[30]} {eth2ddr_m_axi_awaddr[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe84]
set_property port_width 8 [get_debug_ports u_ila_0/probe84]
connect_debug_port u_ila_0/probe84 [get_nets [list {eth2ddr_m_axi_awlen[0]} {eth2ddr_m_axi_awlen[1]} {eth2ddr_m_axi_awlen[2]} {eth2ddr_m_axi_awlen[3]} {eth2ddr_m_axi_awlen[4]} {eth2ddr_m_axi_awlen[5]} {eth2ddr_m_axi_awlen[6]} {eth2ddr_m_axi_awlen[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe85]
set_property port_width 3 [get_debug_ports u_ila_0/probe85]
connect_debug_port u_ila_0/probe85 [get_nets [list {eth2ddr_m_axi_awsize[0]} {eth2ddr_m_axi_awsize[1]} {eth2ddr_m_axi_awsize[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe86]
set_property port_width 16 [get_debug_ports u_ila_0/probe86]
connect_debug_port u_ila_0/probe86 [get_nets [list {eth2ddr_m_axi_wstrb[0]} {eth2ddr_m_axi_wstrb[1]} {eth2ddr_m_axi_wstrb[2]} {eth2ddr_m_axi_wstrb[3]} {eth2ddr_m_axi_wstrb[4]} {eth2ddr_m_axi_wstrb[5]} {eth2ddr_m_axi_wstrb[6]} {eth2ddr_m_axi_wstrb[7]} {eth2ddr_m_axi_wstrb[8]} {eth2ddr_m_axi_wstrb[9]} {eth2ddr_m_axi_wstrb[10]} {eth2ddr_m_axi_wstrb[11]} {eth2ddr_m_axi_wstrb[12]} {eth2ddr_m_axi_wstrb[13]} {eth2ddr_m_axi_wstrb[14]} {eth2ddr_m_axi_wstrb[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe87]
set_property port_width 2 [get_debug_ports u_ila_0/probe87]
connect_debug_port u_ila_0/probe87 [get_nets [list {eth2ddr_m_axi_awburst[0]} {eth2ddr_m_axi_awburst[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe88]
set_property port_width 2 [get_debug_ports u_ila_0/probe88]
connect_debug_port u_ila_0/probe88 [get_nets [list {eth2ddr_m_axi_bresp[0]} {eth2ddr_m_axi_bresp[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe89]
set_property port_width 128 [get_debug_ports u_ila_0/probe89]
connect_debug_port u_ila_0/probe89 [get_nets [list {eth2ddr_m_axi_wdata[0]} {eth2ddr_m_axi_wdata[1]} {eth2ddr_m_axi_wdata[2]} {eth2ddr_m_axi_wdata[3]} {eth2ddr_m_axi_wdata[4]} {eth2ddr_m_axi_wdata[5]} {eth2ddr_m_axi_wdata[6]} {eth2ddr_m_axi_wdata[7]} {eth2ddr_m_axi_wdata[8]} {eth2ddr_m_axi_wdata[9]} {eth2ddr_m_axi_wdata[10]} {eth2ddr_m_axi_wdata[11]} {eth2ddr_m_axi_wdata[12]} {eth2ddr_m_axi_wdata[13]} {eth2ddr_m_axi_wdata[14]} {eth2ddr_m_axi_wdata[15]} {eth2ddr_m_axi_wdata[16]} {eth2ddr_m_axi_wdata[17]} {eth2ddr_m_axi_wdata[18]} {eth2ddr_m_axi_wdata[19]} {eth2ddr_m_axi_wdata[20]} {eth2ddr_m_axi_wdata[21]} {eth2ddr_m_axi_wdata[22]} {eth2ddr_m_axi_wdata[23]} {eth2ddr_m_axi_wdata[24]} {eth2ddr_m_axi_wdata[25]} {eth2ddr_m_axi_wdata[26]} {eth2ddr_m_axi_wdata[27]} {eth2ddr_m_axi_wdata[28]} {eth2ddr_m_axi_wdata[29]} {eth2ddr_m_axi_wdata[30]} {eth2ddr_m_axi_wdata[31]} {eth2ddr_m_axi_wdata[32]} {eth2ddr_m_axi_wdata[33]} {eth2ddr_m_axi_wdata[34]} {eth2ddr_m_axi_wdata[35]} {eth2ddr_m_axi_wdata[36]} {eth2ddr_m_axi_wdata[37]} {eth2ddr_m_axi_wdata[38]} {eth2ddr_m_axi_wdata[39]} {eth2ddr_m_axi_wdata[40]} {eth2ddr_m_axi_wdata[41]} {eth2ddr_m_axi_wdata[42]} {eth2ddr_m_axi_wdata[43]} {eth2ddr_m_axi_wdata[44]} {eth2ddr_m_axi_wdata[45]} {eth2ddr_m_axi_wdata[46]} {eth2ddr_m_axi_wdata[47]} {eth2ddr_m_axi_wdata[48]} {eth2ddr_m_axi_wdata[49]} {eth2ddr_m_axi_wdata[50]} {eth2ddr_m_axi_wdata[51]} {eth2ddr_m_axi_wdata[52]} {eth2ddr_m_axi_wdata[53]} {eth2ddr_m_axi_wdata[54]} {eth2ddr_m_axi_wdata[55]} {eth2ddr_m_axi_wdata[56]} {eth2ddr_m_axi_wdata[57]} {eth2ddr_m_axi_wdata[58]} {eth2ddr_m_axi_wdata[59]} {eth2ddr_m_axi_wdata[60]} {eth2ddr_m_axi_wdata[61]} {eth2ddr_m_axi_wdata[62]} {eth2ddr_m_axi_wdata[63]} {eth2ddr_m_axi_wdata[64]} {eth2ddr_m_axi_wdata[65]} {eth2ddr_m_axi_wdata[66]} {eth2ddr_m_axi_wdata[67]} {eth2ddr_m_axi_wdata[68]} {eth2ddr_m_axi_wdata[69]} {eth2ddr_m_axi_wdata[70]} {eth2ddr_m_axi_wdata[71]} {eth2ddr_m_axi_wdata[72]} {eth2ddr_m_axi_wdata[73]} {eth2ddr_m_axi_wdata[74]} {eth2ddr_m_axi_wdata[75]} {eth2ddr_m_axi_wdata[76]} {eth2ddr_m_axi_wdata[77]} {eth2ddr_m_axi_wdata[78]} {eth2ddr_m_axi_wdata[79]} {eth2ddr_m_axi_wdata[80]} {eth2ddr_m_axi_wdata[81]} {eth2ddr_m_axi_wdata[82]} {eth2ddr_m_axi_wdata[83]} {eth2ddr_m_axi_wdata[84]} {eth2ddr_m_axi_wdata[85]} {eth2ddr_m_axi_wdata[86]} {eth2ddr_m_axi_wdata[87]} {eth2ddr_m_axi_wdata[88]} {eth2ddr_m_axi_wdata[89]} {eth2ddr_m_axi_wdata[90]} {eth2ddr_m_axi_wdata[91]} {eth2ddr_m_axi_wdata[92]} {eth2ddr_m_axi_wdata[93]} {eth2ddr_m_axi_wdata[94]} {eth2ddr_m_axi_wdata[95]} {eth2ddr_m_axi_wdata[96]} {eth2ddr_m_axi_wdata[97]} {eth2ddr_m_axi_wdata[98]} {eth2ddr_m_axi_wdata[99]} {eth2ddr_m_axi_wdata[100]} {eth2ddr_m_axi_wdata[101]} {eth2ddr_m_axi_wdata[102]} {eth2ddr_m_axi_wdata[103]} {eth2ddr_m_axi_wdata[104]} {eth2ddr_m_axi_wdata[105]} {eth2ddr_m_axi_wdata[106]} {eth2ddr_m_axi_wdata[107]} {eth2ddr_m_axi_wdata[108]} {eth2ddr_m_axi_wdata[109]} {eth2ddr_m_axi_wdata[110]} {eth2ddr_m_axi_wdata[111]} {eth2ddr_m_axi_wdata[112]} {eth2ddr_m_axi_wdata[113]} {eth2ddr_m_axi_wdata[114]} {eth2ddr_m_axi_wdata[115]} {eth2ddr_m_axi_wdata[116]} {eth2ddr_m_axi_wdata[117]} {eth2ddr_m_axi_wdata[118]} {eth2ddr_m_axi_wdata[119]} {eth2ddr_m_axi_wdata[120]} {eth2ddr_m_axi_wdata[121]} {eth2ddr_m_axi_wdata[122]} {eth2ddr_m_axi_wdata[123]} {eth2ddr_m_axi_wdata[124]} {eth2ddr_m_axi_wdata[125]} {eth2ddr_m_axi_wdata[126]} {eth2ddr_m_axi_wdata[127]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe90]
set_property port_width 16 [get_debug_ports u_ila_0/probe90]
connect_debug_port u_ila_0/probe90 [get_nets [list {eth2ddr_m_axis_keep[0]} {eth2ddr_m_axis_keep[1]} {eth2ddr_m_axis_keep[2]} {eth2ddr_m_axis_keep[3]} {eth2ddr_m_axis_keep[4]} {eth2ddr_m_axis_keep[5]} {eth2ddr_m_axis_keep[6]} {eth2ddr_m_axis_keep[7]} {eth2ddr_m_axis_keep[8]} {eth2ddr_m_axis_keep[9]} {eth2ddr_m_axis_keep[10]} {eth2ddr_m_axis_keep[11]} {eth2ddr_m_axis_keep[12]} {eth2ddr_m_axis_keep[13]} {eth2ddr_m_axis_keep[14]} {eth2ddr_m_axis_keep[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe91]
set_property port_width 32 [get_debug_ports u_ila_0/probe91]
connect_debug_port u_ila_0/probe91 [get_nets [list {eth2ddr_m_cmd_addr[0]} {eth2ddr_m_cmd_addr[1]} {eth2ddr_m_cmd_addr[2]} {eth2ddr_m_cmd_addr[3]} {eth2ddr_m_cmd_addr[4]} {eth2ddr_m_cmd_addr[5]} {eth2ddr_m_cmd_addr[6]} {eth2ddr_m_cmd_addr[7]} {eth2ddr_m_cmd_addr[8]} {eth2ddr_m_cmd_addr[9]} {eth2ddr_m_cmd_addr[10]} {eth2ddr_m_cmd_addr[11]} {eth2ddr_m_cmd_addr[12]} {eth2ddr_m_cmd_addr[13]} {eth2ddr_m_cmd_addr[14]} {eth2ddr_m_cmd_addr[15]} {eth2ddr_m_cmd_addr[16]} {eth2ddr_m_cmd_addr[17]} {eth2ddr_m_cmd_addr[18]} {eth2ddr_m_cmd_addr[19]} {eth2ddr_m_cmd_addr[20]} {eth2ddr_m_cmd_addr[21]} {eth2ddr_m_cmd_addr[22]} {eth2ddr_m_cmd_addr[23]} {eth2ddr_m_cmd_addr[24]} {eth2ddr_m_cmd_addr[25]} {eth2ddr_m_cmd_addr[26]} {eth2ddr_m_cmd_addr[27]} {eth2ddr_m_cmd_addr[28]} {eth2ddr_m_cmd_addr[29]} {eth2ddr_m_cmd_addr[30]} {eth2ddr_m_cmd_addr[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe92]
set_property port_width 32 [get_debug_ports u_ila_0/probe92]
connect_debug_port u_ila_0/probe92 [get_nets [list {eth2ddr_m_cmd_len[0]} {eth2ddr_m_cmd_len[1]} {eth2ddr_m_cmd_len[2]} {eth2ddr_m_cmd_len[3]} {eth2ddr_m_cmd_len[4]} {eth2ddr_m_cmd_len[5]} {eth2ddr_m_cmd_len[6]} {eth2ddr_m_cmd_len[7]} {eth2ddr_m_cmd_len[8]} {eth2ddr_m_cmd_len[9]} {eth2ddr_m_cmd_len[10]} {eth2ddr_m_cmd_len[11]} {eth2ddr_m_cmd_len[12]} {eth2ddr_m_cmd_len[13]} {eth2ddr_m_cmd_len[14]} {eth2ddr_m_cmd_len[15]} {eth2ddr_m_cmd_len[16]} {eth2ddr_m_cmd_len[17]} {eth2ddr_m_cmd_len[18]} {eth2ddr_m_cmd_len[19]} {eth2ddr_m_cmd_len[20]} {eth2ddr_m_cmd_len[21]} {eth2ddr_m_cmd_len[22]} {eth2ddr_m_cmd_len[23]} {eth2ddr_m_cmd_len[24]} {eth2ddr_m_cmd_len[25]} {eth2ddr_m_cmd_len[26]} {eth2ddr_m_cmd_len[27]} {eth2ddr_m_cmd_len[28]} {eth2ddr_m_cmd_len[29]} {eth2ddr_m_cmd_len[30]} {eth2ddr_m_cmd_len[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe93]
set_property port_width 3 [get_debug_ports u_ila_0/probe93]
connect_debug_port u_ila_0/probe93 [get_nets [list {eth2ddr_m_axi_awprot[0]} {eth2ddr_m_axi_awprot[1]} {eth2ddr_m_axi_awprot[2]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe94]
set_property port_width 4 [get_debug_ports u_ila_0/probe94]
connect_debug_port u_ila_0/probe94 [get_nets [list {eth2ddr_m_axi_awcache[0]} {eth2ddr_m_axi_awcache[1]} {eth2ddr_m_axi_awcache[2]} {eth2ddr_m_axi_awcache[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe95]
set_property port_width 128 [get_debug_ports u_ila_0/probe95]
connect_debug_port u_ila_0/probe95 [get_nets [list {eth2ddr_m_axis_data[0]} {eth2ddr_m_axis_data[1]} {eth2ddr_m_axis_data[2]} {eth2ddr_m_axis_data[3]} {eth2ddr_m_axis_data[4]} {eth2ddr_m_axis_data[5]} {eth2ddr_m_axis_data[6]} {eth2ddr_m_axis_data[7]} {eth2ddr_m_axis_data[8]} {eth2ddr_m_axis_data[9]} {eth2ddr_m_axis_data[10]} {eth2ddr_m_axis_data[11]} {eth2ddr_m_axis_data[12]} {eth2ddr_m_axis_data[13]} {eth2ddr_m_axis_data[14]} {eth2ddr_m_axis_data[15]} {eth2ddr_m_axis_data[16]} {eth2ddr_m_axis_data[17]} {eth2ddr_m_axis_data[18]} {eth2ddr_m_axis_data[19]} {eth2ddr_m_axis_data[20]} {eth2ddr_m_axis_data[21]} {eth2ddr_m_axis_data[22]} {eth2ddr_m_axis_data[23]} {eth2ddr_m_axis_data[24]} {eth2ddr_m_axis_data[25]} {eth2ddr_m_axis_data[26]} {eth2ddr_m_axis_data[27]} {eth2ddr_m_axis_data[28]} {eth2ddr_m_axis_data[29]} {eth2ddr_m_axis_data[30]} {eth2ddr_m_axis_data[31]} {eth2ddr_m_axis_data[32]} {eth2ddr_m_axis_data[33]} {eth2ddr_m_axis_data[34]} {eth2ddr_m_axis_data[35]} {eth2ddr_m_axis_data[36]} {eth2ddr_m_axis_data[37]} {eth2ddr_m_axis_data[38]} {eth2ddr_m_axis_data[39]} {eth2ddr_m_axis_data[40]} {eth2ddr_m_axis_data[41]} {eth2ddr_m_axis_data[42]} {eth2ddr_m_axis_data[43]} {eth2ddr_m_axis_data[44]} {eth2ddr_m_axis_data[45]} {eth2ddr_m_axis_data[46]} {eth2ddr_m_axis_data[47]} {eth2ddr_m_axis_data[48]} {eth2ddr_m_axis_data[49]} {eth2ddr_m_axis_data[50]} {eth2ddr_m_axis_data[51]} {eth2ddr_m_axis_data[52]} {eth2ddr_m_axis_data[53]} {eth2ddr_m_axis_data[54]} {eth2ddr_m_axis_data[55]} {eth2ddr_m_axis_data[56]} {eth2ddr_m_axis_data[57]} {eth2ddr_m_axis_data[58]} {eth2ddr_m_axis_data[59]} {eth2ddr_m_axis_data[60]} {eth2ddr_m_axis_data[61]} {eth2ddr_m_axis_data[62]} {eth2ddr_m_axis_data[63]} {eth2ddr_m_axis_data[64]} {eth2ddr_m_axis_data[65]} {eth2ddr_m_axis_data[66]} {eth2ddr_m_axis_data[67]} {eth2ddr_m_axis_data[68]} {eth2ddr_m_axis_data[69]} {eth2ddr_m_axis_data[70]} {eth2ddr_m_axis_data[71]} {eth2ddr_m_axis_data[72]} {eth2ddr_m_axis_data[73]} {eth2ddr_m_axis_data[74]} {eth2ddr_m_axis_data[75]} {eth2ddr_m_axis_data[76]} {eth2ddr_m_axis_data[77]} {eth2ddr_m_axis_data[78]} {eth2ddr_m_axis_data[79]} {eth2ddr_m_axis_data[80]} {eth2ddr_m_axis_data[81]} {eth2ddr_m_axis_data[82]} {eth2ddr_m_axis_data[83]} {eth2ddr_m_axis_data[84]} {eth2ddr_m_axis_data[85]} {eth2ddr_m_axis_data[86]} {eth2ddr_m_axis_data[87]} {eth2ddr_m_axis_data[88]} {eth2ddr_m_axis_data[89]} {eth2ddr_m_axis_data[90]} {eth2ddr_m_axis_data[91]} {eth2ddr_m_axis_data[92]} {eth2ddr_m_axis_data[93]} {eth2ddr_m_axis_data[94]} {eth2ddr_m_axis_data[95]} {eth2ddr_m_axis_data[96]} {eth2ddr_m_axis_data[97]} {eth2ddr_m_axis_data[98]} {eth2ddr_m_axis_data[99]} {eth2ddr_m_axis_data[100]} {eth2ddr_m_axis_data[101]} {eth2ddr_m_axis_data[102]} {eth2ddr_m_axis_data[103]} {eth2ddr_m_axis_data[104]} {eth2ddr_m_axis_data[105]} {eth2ddr_m_axis_data[106]} {eth2ddr_m_axis_data[107]} {eth2ddr_m_axis_data[108]} {eth2ddr_m_axis_data[109]} {eth2ddr_m_axis_data[110]} {eth2ddr_m_axis_data[111]} {eth2ddr_m_axis_data[112]} {eth2ddr_m_axis_data[113]} {eth2ddr_m_axis_data[114]} {eth2ddr_m_axis_data[115]} {eth2ddr_m_axis_data[116]} {eth2ddr_m_axis_data[117]} {eth2ddr_m_axis_data[118]} {eth2ddr_m_axis_data[119]} {eth2ddr_m_axis_data[120]} {eth2ddr_m_axis_data[121]} {eth2ddr_m_axis_data[122]} {eth2ddr_m_axis_data[123]} {eth2ddr_m_axis_data[124]} {eth2ddr_m_axis_data[125]} {eth2ddr_m_axis_data[126]} {eth2ddr_m_axis_data[127]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe96]
set_property port_width 1 [get_debug_ports u_ila_0/probe96]
connect_debug_port u_ila_0/probe96 [get_nets [list ctrl_inst/abnormal]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe97]
set_property port_width 1 [get_debug_ports u_ila_0/probe97]
connect_debug_port u_ila_0/probe97 [get_nets [list eth2ddr_inst/eth2ddr_rbuf_pang/empty]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe98]
set_property port_width 1 [get_debug_ports u_ila_0/probe98]
connect_debug_port u_ila_0/probe98 [get_nets [list eth2ddr_inst/eth2ddr_rbuf_ping/empty]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe99]
set_property port_width 1 [get_debug_ports u_ila_0/probe99]
connect_debug_port u_ila_0/probe99 [get_nets [list eth2ddr_m_axi_awid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe100]
set_property port_width 1 [get_debug_ports u_ila_0/probe100]
connect_debug_port u_ila_0/probe100 [get_nets [list eth2ddr_m_axi_awlock]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe101]
set_property port_width 1 [get_debug_ports u_ila_0/probe101]
connect_debug_port u_ila_0/probe101 [get_nets [list eth2ddr_m_axi_awready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe102]
set_property port_width 1 [get_debug_ports u_ila_0/probe102]
connect_debug_port u_ila_0/probe102 [get_nets [list eth2ddr_m_axi_awvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe103]
set_property port_width 1 [get_debug_ports u_ila_0/probe103]
connect_debug_port u_ila_0/probe103 [get_nets [list eth2ddr_m_axi_bid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe104]
set_property port_width 1 [get_debug_ports u_ila_0/probe104]
connect_debug_port u_ila_0/probe104 [get_nets [list eth2ddr_m_axi_bready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe105]
set_property port_width 1 [get_debug_ports u_ila_0/probe105]
connect_debug_port u_ila_0/probe105 [get_nets [list eth2ddr_m_axi_bvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe106]
set_property port_width 1 [get_debug_ports u_ila_0/probe106]
connect_debug_port u_ila_0/probe106 [get_nets [list eth2ddr_m_axi_wlast]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe107]
set_property port_width 1 [get_debug_ports u_ila_0/probe107]
connect_debug_port u_ila_0/probe107 [get_nets [list eth2ddr_m_axi_wready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe108]
set_property port_width 1 [get_debug_ports u_ila_0/probe108]
connect_debug_port u_ila_0/probe108 [get_nets [list eth2ddr_m_axi_wvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe109]
set_property port_width 1 [get_debug_ports u_ila_0/probe109]
connect_debug_port u_ila_0/probe109 [get_nets [list eth2ddr_m_axis_last]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe110]
set_property port_width 1 [get_debug_ports u_ila_0/probe110]
connect_debug_port u_ila_0/probe110 [get_nets [list eth2ddr_m_axis_ready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe111]
set_property port_width 1 [get_debug_ports u_ila_0/probe111]
connect_debug_port u_ila_0/probe111 [get_nets [list eth2ddr_m_axis_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe112]
set_property port_width 1 [get_debug_ports u_ila_0/probe112]
connect_debug_port u_ila_0/probe112 [get_nets [list eth2ddr_m_cmd_ready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe113]
set_property port_width 1 [get_debug_ports u_ila_0/probe113]
connect_debug_port u_ila_0/probe113 [get_nets [list eth2ddr_m_cmd_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe114]
set_property port_width 1 [get_debug_ports u_ila_0/probe114]
connect_debug_port u_ila_0/probe114 [get_nets [list eth2ddr_inst/eth2ddr_rbuf_ping/full]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe115]
set_property port_width 1 [get_debug_ports u_ila_0/probe115]
connect_debug_port u_ila_0/probe115 [get_nets [list eth2ddr_inst/eth2ddr_rbuf_pang/full]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe116]
set_property port_width 1 [get_debug_ports u_ila_0/probe116]
connect_debug_port u_ila_0/probe116 [get_nets [list ctrl_inst/head_check]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe117]
set_property port_width 1 [get_debug_ports u_ila_0/probe117]
connect_debug_port u_ila_0/probe117 [get_nets [list ctrl_inst/head_ctrl]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe118]
set_property port_width 1 [get_debug_ports u_ila_0/probe118]
connect_debug_port u_ila_0/probe118 [get_nets [list eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_last]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe119]
set_property port_width 1 [get_debug_ports u_ila_0/probe119]
connect_debug_port u_ila_0/probe119 [get_nets [list eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_last]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe120]
set_property port_width 1 [get_debug_ports u_ila_0/probe120]
connect_debug_port u_ila_0/probe120 [get_nets [list ctrl_inst/m_axis_last]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe121]
set_property port_width 1 [get_debug_ports u_ila_0/probe121]
connect_debug_port u_ila_0/probe121 [get_nets [list eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_last]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe122]
set_property port_width 1 [get_debug_ports u_ila_0/probe122]
connect_debug_port u_ila_0/probe122 [get_nets [list eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tlast]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe123]
set_property port_width 1 [get_debug_ports u_ila_0/probe123]
connect_debug_port u_ila_0/probe123 [get_nets [list eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tlast]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe124]
set_property port_width 1 [get_debug_ports u_ila_0/probe124]
connect_debug_port u_ila_0/probe124 [get_nets [list eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe125]
set_property port_width 1 [get_debug_ports u_ila_0/probe125]
connect_debug_port u_ila_0/probe125 [get_nets [list eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe126]
set_property port_width 1 [get_debug_ports u_ila_0/probe126]
connect_debug_port u_ila_0/probe126 [get_nets [list eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_tvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe127]
set_property port_width 1 [get_debug_ports u_ila_0/probe127]
connect_debug_port u_ila_0/probe127 [get_nets [list eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_tvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe128]
set_property port_width 1 [get_debug_ports u_ila_0/probe128]
connect_debug_port u_ila_0/probe128 [get_nets [list eth2ddr_inst/eth2ddr_rbuf_pang/m_axis_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe129]
set_property port_width 1 [get_debug_ports u_ila_0/probe129]
connect_debug_port u_ila_0/probe129 [get_nets [list eth2ddr_inst/eth2ddr_ctrl_inst/m_axis_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe130]
set_property port_width 1 [get_debug_ports u_ila_0/probe130]
connect_debug_port u_ila_0/probe130 [get_nets [list eth2ddr_inst/eth2ddr_rbuf_ping/m_axis_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe131]
set_property port_width 1 [get_debug_ports u_ila_0/probe131]
connect_debug_port u_ila_0/probe131 [get_nets [list ctrl_inst/m_axis_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe132]
set_property port_width 1 [get_debug_ports u_ila_0/probe132]
connect_debug_port u_ila_0/probe132 [get_nets [list ctrl_inst/m_axis_vsync]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe133]
set_property port_width 1 [get_debug_ports u_ila_0/probe133]
connect_debug_port u_ila_0/probe133 [get_nets [list eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_ready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe134]
set_property port_width 1 [get_debug_ports u_ila_0/probe134]
connect_debug_port u_ila_0/probe134 [get_nets [list eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_ready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe135]
set_property port_width 1 [get_debug_ports u_ila_0/probe135]
connect_debug_port u_ila_0/probe135 [get_nets [list eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe136]
set_property port_width 1 [get_debug_ports u_ila_0/probe136]
connect_debug_port u_ila_0/probe136 [get_nets [list eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe137]
set_property port_width 1 [get_debug_ports u_ila_0/probe137]
connect_debug_port u_ila_0/probe137 [get_nets [list eth2ddr_inst/eth2ddr_rbuf_pang/m_cmd_valid_r]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe138]
set_property port_width 1 [get_debug_ports u_ila_0/probe138]
connect_debug_port u_ila_0/probe138 [get_nets [list eth2ddr_inst/eth2ddr_rbuf_ping/m_cmd_valid_r]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe139]
set_property port_width 1 [get_debug_ports u_ila_0/probe139]
connect_debug_port u_ila_0/probe139 [get_nets [list eth2ddr_inst/r_ping]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe140]
set_property port_width 1 [get_debug_ports u_ila_0/probe140]
connect_debug_port u_ila_0/probe140 [get_nets [list eth2ddr_inst/eth2ddr_rbuf_pang/rd_en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe141]
set_property port_width 1 [get_debug_ports u_ila_0/probe141]
connect_debug_port u_ila_0/probe141 [get_nets [list eth2ddr_inst/eth2ddr_rbuf_ping/rd_en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe142]
set_property port_width 1 [get_debug_ports u_ila_0/probe142]
connect_debug_port u_ila_0/probe142 [get_nets [list ctrl_inst/s_axis_last]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe143]
set_property port_width 1 [get_debug_ports u_ila_0/probe143]
connect_debug_port u_ila_0/probe143 [get_nets [list eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_last]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe144]
set_property port_width 1 [get_debug_ports u_ila_0/probe144]
connect_debug_port u_ila_0/probe144 [get_nets [list eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_last_ff]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe145]
set_property port_width 1 [get_debug_ports u_ila_0/probe145]
connect_debug_port u_ila_0/probe145 [get_nets [list eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_last_ff]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe146]
set_property port_width 1 [get_debug_ports u_ila_0/probe146]
connect_debug_port u_ila_0/probe146 [get_nets [list eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_last_ff]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe147]
set_property port_width 1 [get_debug_ports u_ila_0/probe147]
connect_debug_port u_ila_0/probe147 [get_nets [list eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_tkeep]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe148]
set_property port_width 1 [get_debug_ports u_ila_0/probe148]
connect_debug_port u_ila_0/probe148 [get_nets [list eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_tkeep]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe149]
set_property port_width 1 [get_debug_ports u_ila_0/probe149]
connect_debug_port u_ila_0/probe149 [get_nets [list eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_tlast]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe150]
set_property port_width 1 [get_debug_ports u_ila_0/probe150]
connect_debug_port u_ila_0/probe150 [get_nets [list eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_tlast]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe151]
set_property port_width 1 [get_debug_ports u_ila_0/probe151]
connect_debug_port u_ila_0/probe151 [get_nets [list eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_tready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe152]
set_property port_width 1 [get_debug_ports u_ila_0/probe152]
connect_debug_port u_ila_0/probe152 [get_nets [list eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_tready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe153]
set_property port_width 1 [get_debug_ports u_ila_0/probe153]
connect_debug_port u_ila_0/probe153 [get_nets [list eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_tvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe154]
set_property port_width 1 [get_debug_ports u_ila_0/probe154]
connect_debug_port u_ila_0/probe154 [get_nets [list eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_tvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe155]
set_property port_width 1 [get_debug_ports u_ila_0/probe155]
connect_debug_port u_ila_0/probe155 [get_nets [list ctrl_inst/s_axis_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe156]
set_property port_width 1 [get_debug_ports u_ila_0/probe156]
connect_debug_port u_ila_0/probe156 [get_nets [list eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe157]
set_property port_width 1 [get_debug_ports u_ila_0/probe157]
connect_debug_port u_ila_0/probe157 [get_nets [list eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_valid_ff]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe158]
set_property port_width 1 [get_debug_ports u_ila_0/probe158]
connect_debug_port u_ila_0/probe158 [get_nets [list eth2ddr_inst/eth2ddr_rbuf_pang/s_axis_valid_ff]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe159]
set_property port_width 1 [get_debug_ports u_ila_0/probe159]
connect_debug_port u_ila_0/probe159 [get_nets [list eth2ddr_inst/eth2ddr_rbuf_ping/s_axis_valid_ff]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe160]
set_property port_width 1 [get_debug_ports u_ila_0/probe160]
connect_debug_port u_ila_0/probe160 [get_nets [list eth2ddr_inst/eth2ddr_ctrl_inst/s_axis_vsync]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe161]
set_property port_width 1 [get_debug_ports u_ila_0/probe161]
connect_debug_port u_ila_0/probe161 [get_nets [list ctrl_inst/tail_check]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe162]
set_property port_width 1 [get_debug_ports u_ila_0/probe162]
connect_debug_port u_ila_0/probe162 [get_nets [list eth2ddr_inst/w_ping]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe163]
set_property port_width 1 [get_debug_ports u_ila_0/probe163]
connect_debug_port u_ila_0/probe163 [get_nets [list eth2ddr_inst/eth2ddr_rbuf_pang/wr_en]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe164]
set_property port_width 1 [get_debug_ports u_ila_0/probe164]
connect_debug_port u_ila_0/probe164 [get_nets [list eth2ddr_inst/eth2ddr_rbuf_ping/wr_en]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets sys_clk]
