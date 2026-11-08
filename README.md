# FPGA_Ethernet

纯 Verilog 实现的千兆以太网协议栈，支持 UDP 与 ICMP，内置 RGMII 转 GMII 模块，已在 Xilinx 7 系列与 UltraScale 系列上验证。

## 项目简介

这是一个面向 FPGA 的轻量级千兆以太网协议栈实现，核心逻辑全部以 Verilog RTL 编写，不依赖厂商以太网 MAC IP 核。

- **接口**：对外支持 **RGMII**，片内提供 **RGMII 转 GMII** 转换模块，协议栈内部工作在 GMII 接口上。
- **速率**：**千兆**（1000 Mbps）。
- **协议**：已实现 **UDP** 与 **ICMP**（ping）。
- **验证平台**：已在 **Xilinx 7 系列** 与 **UltraScale 系列** 上测试通过；KU5P 上完成 ICMP ping 验证。
- **仿真**：`sim/` 下提供千兆 **UDP 回环**测试平台。

## 功能特性

- **纯 RTL 实现**：MAC 层与协议层不依赖 Tri-Mode Ethernet MAC 等厂商 IP 核。
- **RGMII / GMII 双接口**：对外走 RGMII，内部经 RGMII→GMII 转换后由协议栈处理，便于复用与移植。
- **千兆速率**：面向 1000BASE-T 场景设计。
- **ICMP**：支持 Echo（ping），已在 KU5P 上验证通过。
- **UDP**：具备 UDP 收发通路，并附带面向图像传输的自定义 UDP 数据包协议文档。
- **仿真支持**：提供千兆 UDP 回环测试平台，可在上板前验证收发通路。
- **跨系列验证**：7 系列与 UltraScale 系列均已测试。

## 目录结构

```text
FPGA_Ethernet/
├── doc/
│   ├── img/
│   ├── 架构.md                         # 整体架构说明
│   └── 图像处理--自定义UDP数据包协议.md   # 图像传输 UDP 协议定义
├── sim/
│   └── tb_udp_top.v                   # 千兆 UDP 回环仿真测试平台
├── src/                               # RTL 源码（以太网 MAC / UDP / ICMP / RGMII 转 GMII）
├── LICENSE                            # MIT 许可证
└── .gitmodules
```