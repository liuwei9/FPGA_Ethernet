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
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list clk_wiz_0_inst/inst/clk_out1]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 128 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {eth2ddr_m_axi_rdata[0]} {eth2ddr_m_axi_rdata[1]} {eth2ddr_m_axi_rdata[2]} {eth2ddr_m_axi_rdata[3]} {eth2ddr_m_axi_rdata[4]} {eth2ddr_m_axi_rdata[5]} {eth2ddr_m_axi_rdata[6]} {eth2ddr_m_axi_rdata[7]} {eth2ddr_m_axi_rdata[8]} {eth2ddr_m_axi_rdata[9]} {eth2ddr_m_axi_rdata[10]} {eth2ddr_m_axi_rdata[11]} {eth2ddr_m_axi_rdata[12]} {eth2ddr_m_axi_rdata[13]} {eth2ddr_m_axi_rdata[14]} {eth2ddr_m_axi_rdata[15]} {eth2ddr_m_axi_rdata[16]} {eth2ddr_m_axi_rdata[17]} {eth2ddr_m_axi_rdata[18]} {eth2ddr_m_axi_rdata[19]} {eth2ddr_m_axi_rdata[20]} {eth2ddr_m_axi_rdata[21]} {eth2ddr_m_axi_rdata[22]} {eth2ddr_m_axi_rdata[23]} {eth2ddr_m_axi_rdata[24]} {eth2ddr_m_axi_rdata[25]} {eth2ddr_m_axi_rdata[26]} {eth2ddr_m_axi_rdata[27]} {eth2ddr_m_axi_rdata[28]} {eth2ddr_m_axi_rdata[29]} {eth2ddr_m_axi_rdata[30]} {eth2ddr_m_axi_rdata[31]} {eth2ddr_m_axi_rdata[32]} {eth2ddr_m_axi_rdata[33]} {eth2ddr_m_axi_rdata[34]} {eth2ddr_m_axi_rdata[35]} {eth2ddr_m_axi_rdata[36]} {eth2ddr_m_axi_rdata[37]} {eth2ddr_m_axi_rdata[38]} {eth2ddr_m_axi_rdata[39]} {eth2ddr_m_axi_rdata[40]} {eth2ddr_m_axi_rdata[41]} {eth2ddr_m_axi_rdata[42]} {eth2ddr_m_axi_rdata[43]} {eth2ddr_m_axi_rdata[44]} {eth2ddr_m_axi_rdata[45]} {eth2ddr_m_axi_rdata[46]} {eth2ddr_m_axi_rdata[47]} {eth2ddr_m_axi_rdata[48]} {eth2ddr_m_axi_rdata[49]} {eth2ddr_m_axi_rdata[50]} {eth2ddr_m_axi_rdata[51]} {eth2ddr_m_axi_rdata[52]} {eth2ddr_m_axi_rdata[53]} {eth2ddr_m_axi_rdata[54]} {eth2ddr_m_axi_rdata[55]} {eth2ddr_m_axi_rdata[56]} {eth2ddr_m_axi_rdata[57]} {eth2ddr_m_axi_rdata[58]} {eth2ddr_m_axi_rdata[59]} {eth2ddr_m_axi_rdata[60]} {eth2ddr_m_axi_rdata[61]} {eth2ddr_m_axi_rdata[62]} {eth2ddr_m_axi_rdata[63]} {eth2ddr_m_axi_rdata[64]} {eth2ddr_m_axi_rdata[65]} {eth2ddr_m_axi_rdata[66]} {eth2ddr_m_axi_rdata[67]} {eth2ddr_m_axi_rdata[68]} {eth2ddr_m_axi_rdata[69]} {eth2ddr_m_axi_rdata[70]} {eth2ddr_m_axi_rdata[71]} {eth2ddr_m_axi_rdata[72]} {eth2ddr_m_axi_rdata[73]} {eth2ddr_m_axi_rdata[74]} {eth2ddr_m_axi_rdata[75]} {eth2ddr_m_axi_rdata[76]} {eth2ddr_m_axi_rdata[77]} {eth2ddr_m_axi_rdata[78]} {eth2ddr_m_axi_rdata[79]} {eth2ddr_m_axi_rdata[80]} {eth2ddr_m_axi_rdata[81]} {eth2ddr_m_axi_rdata[82]} {eth2ddr_m_axi_rdata[83]} {eth2ddr_m_axi_rdata[84]} {eth2ddr_m_axi_rdata[85]} {eth2ddr_m_axi_rdata[86]} {eth2ddr_m_axi_rdata[87]} {eth2ddr_m_axi_rdata[88]} {eth2ddr_m_axi_rdata[89]} {eth2ddr_m_axi_rdata[90]} {eth2ddr_m_axi_rdata[91]} {eth2ddr_m_axi_rdata[92]} {eth2ddr_m_axi_rdata[93]} {eth2ddr_m_axi_rdata[94]} {eth2ddr_m_axi_rdata[95]} {eth2ddr_m_axi_rdata[96]} {eth2ddr_m_axi_rdata[97]} {eth2ddr_m_axi_rdata[98]} {eth2ddr_m_axi_rdata[99]} {eth2ddr_m_axi_rdata[100]} {eth2ddr_m_axi_rdata[101]} {eth2ddr_m_axi_rdata[102]} {eth2ddr_m_axi_rdata[103]} {eth2ddr_m_axi_rdata[104]} {eth2ddr_m_axi_rdata[105]} {eth2ddr_m_axi_rdata[106]} {eth2ddr_m_axi_rdata[107]} {eth2ddr_m_axi_rdata[108]} {eth2ddr_m_axi_rdata[109]} {eth2ddr_m_axi_rdata[110]} {eth2ddr_m_axi_rdata[111]} {eth2ddr_m_axi_rdata[112]} {eth2ddr_m_axi_rdata[113]} {eth2ddr_m_axi_rdata[114]} {eth2ddr_m_axi_rdata[115]} {eth2ddr_m_axi_rdata[116]} {eth2ddr_m_axi_rdata[117]} {eth2ddr_m_axi_rdata[118]} {eth2ddr_m_axi_rdata[119]} {eth2ddr_m_axi_rdata[120]} {eth2ddr_m_axi_rdata[121]} {eth2ddr_m_axi_rdata[122]} {eth2ddr_m_axi_rdata[123]} {eth2ddr_m_axi_rdata[124]} {eth2ddr_m_axi_rdata[125]} {eth2ddr_m_axi_rdata[126]} {eth2ddr_m_axi_rdata[127]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 128 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {eth2ddr_m_axis_data[0]} {eth2ddr_m_axis_data[1]} {eth2ddr_m_axis_data[2]} {eth2ddr_m_axis_data[3]} {eth2ddr_m_axis_data[4]} {eth2ddr_m_axis_data[5]} {eth2ddr_m_axis_data[6]} {eth2ddr_m_axis_data[7]} {eth2ddr_m_axis_data[8]} {eth2ddr_m_axis_data[9]} {eth2ddr_m_axis_data[10]} {eth2ddr_m_axis_data[11]} {eth2ddr_m_axis_data[12]} {eth2ddr_m_axis_data[13]} {eth2ddr_m_axis_data[14]} {eth2ddr_m_axis_data[15]} {eth2ddr_m_axis_data[16]} {eth2ddr_m_axis_data[17]} {eth2ddr_m_axis_data[18]} {eth2ddr_m_axis_data[19]} {eth2ddr_m_axis_data[20]} {eth2ddr_m_axis_data[21]} {eth2ddr_m_axis_data[22]} {eth2ddr_m_axis_data[23]} {eth2ddr_m_axis_data[24]} {eth2ddr_m_axis_data[25]} {eth2ddr_m_axis_data[26]} {eth2ddr_m_axis_data[27]} {eth2ddr_m_axis_data[28]} {eth2ddr_m_axis_data[29]} {eth2ddr_m_axis_data[30]} {eth2ddr_m_axis_data[31]} {eth2ddr_m_axis_data[32]} {eth2ddr_m_axis_data[33]} {eth2ddr_m_axis_data[34]} {eth2ddr_m_axis_data[35]} {eth2ddr_m_axis_data[36]} {eth2ddr_m_axis_data[37]} {eth2ddr_m_axis_data[38]} {eth2ddr_m_axis_data[39]} {eth2ddr_m_axis_data[40]} {eth2ddr_m_axis_data[41]} {eth2ddr_m_axis_data[42]} {eth2ddr_m_axis_data[43]} {eth2ddr_m_axis_data[44]} {eth2ddr_m_axis_data[45]} {eth2ddr_m_axis_data[46]} {eth2ddr_m_axis_data[47]} {eth2ddr_m_axis_data[48]} {eth2ddr_m_axis_data[49]} {eth2ddr_m_axis_data[50]} {eth2ddr_m_axis_data[51]} {eth2ddr_m_axis_data[52]} {eth2ddr_m_axis_data[53]} {eth2ddr_m_axis_data[54]} {eth2ddr_m_axis_data[55]} {eth2ddr_m_axis_data[56]} {eth2ddr_m_axis_data[57]} {eth2ddr_m_axis_data[58]} {eth2ddr_m_axis_data[59]} {eth2ddr_m_axis_data[60]} {eth2ddr_m_axis_data[61]} {eth2ddr_m_axis_data[62]} {eth2ddr_m_axis_data[63]} {eth2ddr_m_axis_data[64]} {eth2ddr_m_axis_data[65]} {eth2ddr_m_axis_data[66]} {eth2ddr_m_axis_data[67]} {eth2ddr_m_axis_data[68]} {eth2ddr_m_axis_data[69]} {eth2ddr_m_axis_data[70]} {eth2ddr_m_axis_data[71]} {eth2ddr_m_axis_data[72]} {eth2ddr_m_axis_data[73]} {eth2ddr_m_axis_data[74]} {eth2ddr_m_axis_data[75]} {eth2ddr_m_axis_data[76]} {eth2ddr_m_axis_data[77]} {eth2ddr_m_axis_data[78]} {eth2ddr_m_axis_data[79]} {eth2ddr_m_axis_data[80]} {eth2ddr_m_axis_data[81]} {eth2ddr_m_axis_data[82]} {eth2ddr_m_axis_data[83]} {eth2ddr_m_axis_data[84]} {eth2ddr_m_axis_data[85]} {eth2ddr_m_axis_data[86]} {eth2ddr_m_axis_data[87]} {eth2ddr_m_axis_data[88]} {eth2ddr_m_axis_data[89]} {eth2ddr_m_axis_data[90]} {eth2ddr_m_axis_data[91]} {eth2ddr_m_axis_data[92]} {eth2ddr_m_axis_data[93]} {eth2ddr_m_axis_data[94]} {eth2ddr_m_axis_data[95]} {eth2ddr_m_axis_data[96]} {eth2ddr_m_axis_data[97]} {eth2ddr_m_axis_data[98]} {eth2ddr_m_axis_data[99]} {eth2ddr_m_axis_data[100]} {eth2ddr_m_axis_data[101]} {eth2ddr_m_axis_data[102]} {eth2ddr_m_axis_data[103]} {eth2ddr_m_axis_data[104]} {eth2ddr_m_axis_data[105]} {eth2ddr_m_axis_data[106]} {eth2ddr_m_axis_data[107]} {eth2ddr_m_axis_data[108]} {eth2ddr_m_axis_data[109]} {eth2ddr_m_axis_data[110]} {eth2ddr_m_axis_data[111]} {eth2ddr_m_axis_data[112]} {eth2ddr_m_axis_data[113]} {eth2ddr_m_axis_data[114]} {eth2ddr_m_axis_data[115]} {eth2ddr_m_axis_data[116]} {eth2ddr_m_axis_data[117]} {eth2ddr_m_axis_data[118]} {eth2ddr_m_axis_data[119]} {eth2ddr_m_axis_data[120]} {eth2ddr_m_axis_data[121]} {eth2ddr_m_axis_data[122]} {eth2ddr_m_axis_data[123]} {eth2ddr_m_axis_data[124]} {eth2ddr_m_axis_data[125]} {eth2ddr_m_axis_data[126]} {eth2ddr_m_axis_data[127]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 8 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {eth2ddr_m_axi_awlen[0]} {eth2ddr_m_axi_awlen[1]} {eth2ddr_m_axi_awlen[2]} {eth2ddr_m_axi_awlen[3]} {eth2ddr_m_axi_awlen[4]} {eth2ddr_m_axi_awlen[5]} {eth2ddr_m_axi_awlen[6]} {eth2ddr_m_axi_awlen[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 8 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {eth2ddr_m_axi_arlen[0]} {eth2ddr_m_axi_arlen[1]} {eth2ddr_m_axi_arlen[2]} {eth2ddr_m_axi_arlen[3]} {eth2ddr_m_axi_arlen[4]} {eth2ddr_m_axi_arlen[5]} {eth2ddr_m_axi_arlen[6]} {eth2ddr_m_axi_arlen[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 16 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {eth2ddr_m_axis_keep[0]} {eth2ddr_m_axis_keep[1]} {eth2ddr_m_axis_keep[2]} {eth2ddr_m_axis_keep[3]} {eth2ddr_m_axis_keep[4]} {eth2ddr_m_axis_keep[5]} {eth2ddr_m_axis_keep[6]} {eth2ddr_m_axis_keep[7]} {eth2ddr_m_axis_keep[8]} {eth2ddr_m_axis_keep[9]} {eth2ddr_m_axis_keep[10]} {eth2ddr_m_axis_keep[11]} {eth2ddr_m_axis_keep[12]} {eth2ddr_m_axis_keep[13]} {eth2ddr_m_axis_keep[14]} {eth2ddr_m_axis_keep[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 32 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {eth2ddr_m_cmd_addr[0]} {eth2ddr_m_cmd_addr[1]} {eth2ddr_m_cmd_addr[2]} {eth2ddr_m_cmd_addr[3]} {eth2ddr_m_cmd_addr[4]} {eth2ddr_m_cmd_addr[5]} {eth2ddr_m_cmd_addr[6]} {eth2ddr_m_cmd_addr[7]} {eth2ddr_m_cmd_addr[8]} {eth2ddr_m_cmd_addr[9]} {eth2ddr_m_cmd_addr[10]} {eth2ddr_m_cmd_addr[11]} {eth2ddr_m_cmd_addr[12]} {eth2ddr_m_cmd_addr[13]} {eth2ddr_m_cmd_addr[14]} {eth2ddr_m_cmd_addr[15]} {eth2ddr_m_cmd_addr[16]} {eth2ddr_m_cmd_addr[17]} {eth2ddr_m_cmd_addr[18]} {eth2ddr_m_cmd_addr[19]} {eth2ddr_m_cmd_addr[20]} {eth2ddr_m_cmd_addr[21]} {eth2ddr_m_cmd_addr[22]} {eth2ddr_m_cmd_addr[23]} {eth2ddr_m_cmd_addr[24]} {eth2ddr_m_cmd_addr[25]} {eth2ddr_m_cmd_addr[26]} {eth2ddr_m_cmd_addr[27]} {eth2ddr_m_cmd_addr[28]} {eth2ddr_m_cmd_addr[29]} {eth2ddr_m_cmd_addr[30]} {eth2ddr_m_cmd_addr[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 32 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {eth2ddr_m_cmd_len[0]} {eth2ddr_m_cmd_len[1]} {eth2ddr_m_cmd_len[2]} {eth2ddr_m_cmd_len[3]} {eth2ddr_m_cmd_len[4]} {eth2ddr_m_cmd_len[5]} {eth2ddr_m_cmd_len[6]} {eth2ddr_m_cmd_len[7]} {eth2ddr_m_cmd_len[8]} {eth2ddr_m_cmd_len[9]} {eth2ddr_m_cmd_len[10]} {eth2ddr_m_cmd_len[11]} {eth2ddr_m_cmd_len[12]} {eth2ddr_m_cmd_len[13]} {eth2ddr_m_cmd_len[14]} {eth2ddr_m_cmd_len[15]} {eth2ddr_m_cmd_len[16]} {eth2ddr_m_cmd_len[17]} {eth2ddr_m_cmd_len[18]} {eth2ddr_m_cmd_len[19]} {eth2ddr_m_cmd_len[20]} {eth2ddr_m_cmd_len[21]} {eth2ddr_m_cmd_len[22]} {eth2ddr_m_cmd_len[23]} {eth2ddr_m_cmd_len[24]} {eth2ddr_m_cmd_len[25]} {eth2ddr_m_cmd_len[26]} {eth2ddr_m_cmd_len[27]} {eth2ddr_m_cmd_len[28]} {eth2ddr_m_cmd_len[29]} {eth2ddr_m_cmd_len[30]} {eth2ddr_m_cmd_len[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 16 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {ctrl_m_axis_len[0]} {ctrl_m_axis_len[1]} {ctrl_m_axis_len[2]} {ctrl_m_axis_len[3]} {ctrl_m_axis_len[4]} {ctrl_m_axis_len[5]} {ctrl_m_axis_len[6]} {ctrl_m_axis_len[7]} {ctrl_m_axis_len[8]} {ctrl_m_axis_len[9]} {ctrl_m_axis_len[10]} {ctrl_m_axis_len[11]} {ctrl_m_axis_len[12]} {ctrl_m_axis_len[13]} {ctrl_m_axis_len[14]} {ctrl_m_axis_len[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 2 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {eth2ddr_m_axi_rresp[0]} {eth2ddr_m_axi_rresp[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 2 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {eth2ddr_m_axi_bresp[0]} {eth2ddr_m_axi_bresp[1]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 8 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {ctrl_m_axis_data[0]} {ctrl_m_axis_data[1]} {ctrl_m_axis_data[2]} {ctrl_m_axis_data[3]} {ctrl_m_axis_data[4]} {ctrl_m_axis_data[5]} {ctrl_m_axis_data[6]} {ctrl_m_axis_data[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 32 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {eth2ddr_m_axi_awaddr[0]} {eth2ddr_m_axi_awaddr[1]} {eth2ddr_m_axi_awaddr[2]} {eth2ddr_m_axi_awaddr[3]} {eth2ddr_m_axi_awaddr[4]} {eth2ddr_m_axi_awaddr[5]} {eth2ddr_m_axi_awaddr[6]} {eth2ddr_m_axi_awaddr[7]} {eth2ddr_m_axi_awaddr[8]} {eth2ddr_m_axi_awaddr[9]} {eth2ddr_m_axi_awaddr[10]} {eth2ddr_m_axi_awaddr[11]} {eth2ddr_m_axi_awaddr[12]} {eth2ddr_m_axi_awaddr[13]} {eth2ddr_m_axi_awaddr[14]} {eth2ddr_m_axi_awaddr[15]} {eth2ddr_m_axi_awaddr[16]} {eth2ddr_m_axi_awaddr[17]} {eth2ddr_m_axi_awaddr[18]} {eth2ddr_m_axi_awaddr[19]} {eth2ddr_m_axi_awaddr[20]} {eth2ddr_m_axi_awaddr[21]} {eth2ddr_m_axi_awaddr[22]} {eth2ddr_m_axi_awaddr[23]} {eth2ddr_m_axi_awaddr[24]} {eth2ddr_m_axi_awaddr[25]} {eth2ddr_m_axi_awaddr[26]} {eth2ddr_m_axi_awaddr[27]} {eth2ddr_m_axi_awaddr[28]} {eth2ddr_m_axi_awaddr[29]} {eth2ddr_m_axi_awaddr[30]} {eth2ddr_m_axi_awaddr[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 128 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {eth2ddr_m_axi_wdata[0]} {eth2ddr_m_axi_wdata[1]} {eth2ddr_m_axi_wdata[2]} {eth2ddr_m_axi_wdata[3]} {eth2ddr_m_axi_wdata[4]} {eth2ddr_m_axi_wdata[5]} {eth2ddr_m_axi_wdata[6]} {eth2ddr_m_axi_wdata[7]} {eth2ddr_m_axi_wdata[8]} {eth2ddr_m_axi_wdata[9]} {eth2ddr_m_axi_wdata[10]} {eth2ddr_m_axi_wdata[11]} {eth2ddr_m_axi_wdata[12]} {eth2ddr_m_axi_wdata[13]} {eth2ddr_m_axi_wdata[14]} {eth2ddr_m_axi_wdata[15]} {eth2ddr_m_axi_wdata[16]} {eth2ddr_m_axi_wdata[17]} {eth2ddr_m_axi_wdata[18]} {eth2ddr_m_axi_wdata[19]} {eth2ddr_m_axi_wdata[20]} {eth2ddr_m_axi_wdata[21]} {eth2ddr_m_axi_wdata[22]} {eth2ddr_m_axi_wdata[23]} {eth2ddr_m_axi_wdata[24]} {eth2ddr_m_axi_wdata[25]} {eth2ddr_m_axi_wdata[26]} {eth2ddr_m_axi_wdata[27]} {eth2ddr_m_axi_wdata[28]} {eth2ddr_m_axi_wdata[29]} {eth2ddr_m_axi_wdata[30]} {eth2ddr_m_axi_wdata[31]} {eth2ddr_m_axi_wdata[32]} {eth2ddr_m_axi_wdata[33]} {eth2ddr_m_axi_wdata[34]} {eth2ddr_m_axi_wdata[35]} {eth2ddr_m_axi_wdata[36]} {eth2ddr_m_axi_wdata[37]} {eth2ddr_m_axi_wdata[38]} {eth2ddr_m_axi_wdata[39]} {eth2ddr_m_axi_wdata[40]} {eth2ddr_m_axi_wdata[41]} {eth2ddr_m_axi_wdata[42]} {eth2ddr_m_axi_wdata[43]} {eth2ddr_m_axi_wdata[44]} {eth2ddr_m_axi_wdata[45]} {eth2ddr_m_axi_wdata[46]} {eth2ddr_m_axi_wdata[47]} {eth2ddr_m_axi_wdata[48]} {eth2ddr_m_axi_wdata[49]} {eth2ddr_m_axi_wdata[50]} {eth2ddr_m_axi_wdata[51]} {eth2ddr_m_axi_wdata[52]} {eth2ddr_m_axi_wdata[53]} {eth2ddr_m_axi_wdata[54]} {eth2ddr_m_axi_wdata[55]} {eth2ddr_m_axi_wdata[56]} {eth2ddr_m_axi_wdata[57]} {eth2ddr_m_axi_wdata[58]} {eth2ddr_m_axi_wdata[59]} {eth2ddr_m_axi_wdata[60]} {eth2ddr_m_axi_wdata[61]} {eth2ddr_m_axi_wdata[62]} {eth2ddr_m_axi_wdata[63]} {eth2ddr_m_axi_wdata[64]} {eth2ddr_m_axi_wdata[65]} {eth2ddr_m_axi_wdata[66]} {eth2ddr_m_axi_wdata[67]} {eth2ddr_m_axi_wdata[68]} {eth2ddr_m_axi_wdata[69]} {eth2ddr_m_axi_wdata[70]} {eth2ddr_m_axi_wdata[71]} {eth2ddr_m_axi_wdata[72]} {eth2ddr_m_axi_wdata[73]} {eth2ddr_m_axi_wdata[74]} {eth2ddr_m_axi_wdata[75]} {eth2ddr_m_axi_wdata[76]} {eth2ddr_m_axi_wdata[77]} {eth2ddr_m_axi_wdata[78]} {eth2ddr_m_axi_wdata[79]} {eth2ddr_m_axi_wdata[80]} {eth2ddr_m_axi_wdata[81]} {eth2ddr_m_axi_wdata[82]} {eth2ddr_m_axi_wdata[83]} {eth2ddr_m_axi_wdata[84]} {eth2ddr_m_axi_wdata[85]} {eth2ddr_m_axi_wdata[86]} {eth2ddr_m_axi_wdata[87]} {eth2ddr_m_axi_wdata[88]} {eth2ddr_m_axi_wdata[89]} {eth2ddr_m_axi_wdata[90]} {eth2ddr_m_axi_wdata[91]} {eth2ddr_m_axi_wdata[92]} {eth2ddr_m_axi_wdata[93]} {eth2ddr_m_axi_wdata[94]} {eth2ddr_m_axi_wdata[95]} {eth2ddr_m_axi_wdata[96]} {eth2ddr_m_axi_wdata[97]} {eth2ddr_m_axi_wdata[98]} {eth2ddr_m_axi_wdata[99]} {eth2ddr_m_axi_wdata[100]} {eth2ddr_m_axi_wdata[101]} {eth2ddr_m_axi_wdata[102]} {eth2ddr_m_axi_wdata[103]} {eth2ddr_m_axi_wdata[104]} {eth2ddr_m_axi_wdata[105]} {eth2ddr_m_axi_wdata[106]} {eth2ddr_m_axi_wdata[107]} {eth2ddr_m_axi_wdata[108]} {eth2ddr_m_axi_wdata[109]} {eth2ddr_m_axi_wdata[110]} {eth2ddr_m_axi_wdata[111]} {eth2ddr_m_axi_wdata[112]} {eth2ddr_m_axi_wdata[113]} {eth2ddr_m_axi_wdata[114]} {eth2ddr_m_axi_wdata[115]} {eth2ddr_m_axi_wdata[116]} {eth2ddr_m_axi_wdata[117]} {eth2ddr_m_axi_wdata[118]} {eth2ddr_m_axi_wdata[119]} {eth2ddr_m_axi_wdata[120]} {eth2ddr_m_axi_wdata[121]} {eth2ddr_m_axi_wdata[122]} {eth2ddr_m_axi_wdata[123]} {eth2ddr_m_axi_wdata[124]} {eth2ddr_m_axi_wdata[125]} {eth2ddr_m_axi_wdata[126]} {eth2ddr_m_axi_wdata[127]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 16 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {eth2ddr_m_axi_wstrb[0]} {eth2ddr_m_axi_wstrb[1]} {eth2ddr_m_axi_wstrb[2]} {eth2ddr_m_axi_wstrb[3]} {eth2ddr_m_axi_wstrb[4]} {eth2ddr_m_axi_wstrb[5]} {eth2ddr_m_axi_wstrb[6]} {eth2ddr_m_axi_wstrb[7]} {eth2ddr_m_axi_wstrb[8]} {eth2ddr_m_axi_wstrb[9]} {eth2ddr_m_axi_wstrb[10]} {eth2ddr_m_axi_wstrb[11]} {eth2ddr_m_axi_wstrb[12]} {eth2ddr_m_axi_wstrb[13]} {eth2ddr_m_axi_wstrb[14]} {eth2ddr_m_axi_wstrb[15]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 1 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list ctrl_m_axis_last]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 1 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list ctrl_m_axis_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 1 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list ctrl_m_axis_vsync]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 1 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list eth2ddr_m_axi_arready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 1 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list eth2ddr_m_axi_arvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 1 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list eth2ddr_m_axi_awready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 1 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list eth2ddr_m_axi_awvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 1 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list eth2ddr_m_axi_bid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 1 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list eth2ddr_m_axi_bready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 1 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list eth2ddr_m_axi_bvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 1 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list eth2ddr_m_axi_rid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 1 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list eth2ddr_m_axi_rlast]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 1 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list eth2ddr_m_axi_rready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe27]
set_property port_width 1 [get_debug_ports u_ila_0/probe27]
connect_debug_port u_ila_0/probe27 [get_nets [list eth2ddr_m_axi_rvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe28]
set_property port_width 1 [get_debug_ports u_ila_0/probe28]
connect_debug_port u_ila_0/probe28 [get_nets [list eth2ddr_m_axi_wlast]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe29]
set_property port_width 1 [get_debug_ports u_ila_0/probe29]
connect_debug_port u_ila_0/probe29 [get_nets [list eth2ddr_m_axi_wready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe30]
set_property port_width 1 [get_debug_ports u_ila_0/probe30]
connect_debug_port u_ila_0/probe30 [get_nets [list eth2ddr_m_axi_wvalid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe31]
set_property port_width 1 [get_debug_ports u_ila_0/probe31]
connect_debug_port u_ila_0/probe31 [get_nets [list eth2ddr_m_axis_last]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe32]
set_property port_width 1 [get_debug_ports u_ila_0/probe32]
connect_debug_port u_ila_0/probe32 [get_nets [list eth2ddr_m_axis_ready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe33]
set_property port_width 1 [get_debug_ports u_ila_0/probe33]
connect_debug_port u_ila_0/probe33 [get_nets [list eth2ddr_m_axis_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe34]
set_property port_width 1 [get_debug_ports u_ila_0/probe34]
connect_debug_port u_ila_0/probe34 [get_nets [list eth2ddr_m_cmd_ready]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe35]
set_property port_width 1 [get_debug_ports u_ila_0/probe35]
connect_debug_port u_ila_0/probe35 [get_nets [list eth2ddr_m_cmd_valid]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets sys_clk]
