//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.4 (lin64) Build 2086221 Fri Dec 15 20:54:30 MST 2017
//Date        : Tue Sep 10 12:11:00 2024
//Host        : Muhammad running 64-bit Ubuntu 18.04.6 LTS
//Command     : generate_target HDLC_DPA_wrapper.bd
//Design      : HDLC_DPA_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module HDLC_DPA_wrapper
   (BIST_END,
    BIST_OK,
    BIST_START,
    CALIB_ADC_ADDR,
    DDR3_addr,
    DDR3_ba,
    DDR3_cas_n,
    DDR3_ck_n,
    DDR3_ck_p,
    DDR3_cke,
    DDR3_cs_n,
    DDR3_dm,
    DDR3_dq,
    DDR3_dqs_n,
    DDR3_dqs_p,
    DDR3_odt,
    DDR3_ras_n,
    DDR3_reset_n,
    DDR3_we_n,
    EXT_RST,
    PS_ADC_ADDR,
    RXD_N,
    RXD_P,
    TU_SOT_N_FROM_VFAT3,
    TU_SOT_P_FROM_VFAT3,
    TU_TXD_N_FROM_VFAT3,
    TU_TXD_P_FROM_VFAT3,
    gmii_gtx_clk,
    gmii_rx_clk,
    gmii_rx_dv,
    gmii_rx_er,
    gmii_rxd,
    gmii_tx_clk,
    gmii_tx_en,
    gmii_tx_er,
    gmii_txd,
    iic_main_scl_io,
    iic_main_sda_io,
    mdio_mdc_mdc,
    mdio_mdc_mdio_io,
    phy_reset_out,
    reset,
    rs232_uart_rxd,
    rs232_uart_txd,
    rxclk_n,
    rxclk_p,
    spi_flash_io0_io,
    spi_flash_io1_io,
    spi_flash_ss_io,
    sys_clk_n,
    sys_clk_p,
    vfat3_txd_n,
    vfat3_txd_p);
  input BIST_END;
  input BIST_OK;
  output BIST_START;
  output CALIB_ADC_ADDR;
  output [13:0]DDR3_addr;
  output [2:0]DDR3_ba;
  output DDR3_cas_n;
  output [0:0]DDR3_ck_n;
  output [0:0]DDR3_ck_p;
  output [0:0]DDR3_cke;
  output [0:0]DDR3_cs_n;
  output [7:0]DDR3_dm;
  inout [63:0]DDR3_dq;
  inout [7:0]DDR3_dqs_n;
  inout [7:0]DDR3_dqs_p;
  output [0:0]DDR3_odt;
  output DDR3_ras_n;
  output DDR3_reset_n;
  output DDR3_we_n;
  output EXT_RST;
  output PS_ADC_ADDR;
  input RXD_N;
  input RXD_P;
  input [0:0]TU_SOT_N_FROM_VFAT3;
  input [0:0]TU_SOT_P_FROM_VFAT3;
  input [7:0]TU_TXD_N_FROM_VFAT3;
  input [7:0]TU_TXD_P_FROM_VFAT3;
  output gmii_gtx_clk;
  input gmii_rx_clk;
  input gmii_rx_dv;
  input gmii_rx_er;
  input [7:0]gmii_rxd;
  input gmii_tx_clk;
  output gmii_tx_en;
  output gmii_tx_er;
  output [7:0]gmii_txd;
  inout iic_main_scl_io;
  inout iic_main_sda_io;
  output mdio_mdc_mdc;
  inout mdio_mdc_mdio_io;
  output [0:0]phy_reset_out;
  input reset;
  input rs232_uart_rxd;
  output rs232_uart_txd;
  output rxclk_n;
  output rxclk_p;
  inout spi_flash_io0_io;
  inout spi_flash_io1_io;
  inout [0:0]spi_flash_ss_io;
  input sys_clk_n;
  input sys_clk_p;
  output [0:0]vfat3_txd_n;
  output [0:0]vfat3_txd_p;

  wire BIST_END;
  wire BIST_OK;
  wire BIST_START;
  wire CALIB_ADC_ADDR;
  wire [13:0]DDR3_addr;
  wire [2:0]DDR3_ba;
  wire DDR3_cas_n;
  wire [0:0]DDR3_ck_n;
  wire [0:0]DDR3_ck_p;
  wire [0:0]DDR3_cke;
  wire [0:0]DDR3_cs_n;
  wire [7:0]DDR3_dm;
  wire [63:0]DDR3_dq;
  wire [7:0]DDR3_dqs_n;
  wire [7:0]DDR3_dqs_p;
  wire [0:0]DDR3_odt;
  wire DDR3_ras_n;
  wire DDR3_reset_n;
  wire DDR3_we_n;
  wire EXT_RST;
  wire PS_ADC_ADDR;
  wire RXD_N;
  wire RXD_P;
  wire [0:0]TU_SOT_N_FROM_VFAT3;
  wire [0:0]TU_SOT_P_FROM_VFAT3;
  wire [7:0]TU_TXD_N_FROM_VFAT3;
  wire [7:0]TU_TXD_P_FROM_VFAT3;
  wire gmii_gtx_clk;
  wire gmii_rx_clk;
  wire gmii_rx_dv;
  wire gmii_rx_er;
  wire [7:0]gmii_rxd;
  wire gmii_tx_clk;
  wire gmii_tx_en;
  wire gmii_tx_er;
  wire [7:0]gmii_txd;
  wire iic_main_scl_i;
  wire iic_main_scl_io;
  wire iic_main_scl_o;
  wire iic_main_scl_t;
  wire iic_main_sda_i;
  wire iic_main_sda_io;
  wire iic_main_sda_o;
  wire iic_main_sda_t;
  wire mdio_mdc_mdc;
  wire mdio_mdc_mdio_i;
  wire mdio_mdc_mdio_io;
  wire mdio_mdc_mdio_o;
  wire mdio_mdc_mdio_t;
  wire [0:0]phy_reset_out;
  wire reset;
  wire rs232_uart_rxd;
  wire rs232_uart_txd;
  wire rxclk_n;
  wire rxclk_p;
  wire spi_flash_io0_i;
  wire spi_flash_io0_io;
  wire spi_flash_io0_o;
  wire spi_flash_io0_t;
  wire spi_flash_io1_i;
  wire spi_flash_io1_io;
  wire spi_flash_io1_o;
  wire spi_flash_io1_t;
  wire [0:0]spi_flash_ss_i_0;
  wire [0:0]spi_flash_ss_io_0;
  wire [0:0]spi_flash_ss_o_0;
  wire spi_flash_ss_t;
  wire sys_clk_n;
  wire sys_clk_p;
  wire [0:0]vfat3_txd_n;
  wire [0:0]vfat3_txd_p;

  HDLC_DPA HDLC_DPA_i
       (.BIST_END(BIST_END),
        .BIST_OK(BIST_OK),
        .BIST_START(BIST_START),
        .CALIB_ADC_ADDR(CALIB_ADC_ADDR),
        .DDR3_addr(DDR3_addr),
        .DDR3_ba(DDR3_ba),
        .DDR3_cas_n(DDR3_cas_n),
        .DDR3_ck_n(DDR3_ck_n),
        .DDR3_ck_p(DDR3_ck_p),
        .DDR3_cke(DDR3_cke),
        .DDR3_cs_n(DDR3_cs_n),
        .DDR3_dm(DDR3_dm),
        .DDR3_dq(DDR3_dq),
        .DDR3_dqs_n(DDR3_dqs_n),
        .DDR3_dqs_p(DDR3_dqs_p),
        .DDR3_odt(DDR3_odt),
        .DDR3_ras_n(DDR3_ras_n),
        .DDR3_reset_n(DDR3_reset_n),
        .DDR3_we_n(DDR3_we_n),
        .EXT_RST(EXT_RST),
        .PS_ADC_ADDR(PS_ADC_ADDR),
        .RXD_N(RXD_N),
        .RXD_P(RXD_P),
        .TU_SOT_N_FROM_VFAT3(TU_SOT_N_FROM_VFAT3),
        .TU_SOT_P_FROM_VFAT3(TU_SOT_P_FROM_VFAT3),
        .TU_TXD_N_FROM_VFAT3(TU_TXD_N_FROM_VFAT3),
        .TU_TXD_P_FROM_VFAT3(TU_TXD_P_FROM_VFAT3),
        .gmii_gtx_clk(gmii_gtx_clk),
        .gmii_rx_clk(gmii_rx_clk),
        .gmii_rx_dv(gmii_rx_dv),
        .gmii_rx_er(gmii_rx_er),
        .gmii_rxd(gmii_rxd),
        .gmii_tx_clk(gmii_tx_clk),
        .gmii_tx_en(gmii_tx_en),
        .gmii_tx_er(gmii_tx_er),
        .gmii_txd(gmii_txd),
        .iic_main_scl_i(iic_main_scl_i),
        .iic_main_scl_o(iic_main_scl_o),
        .iic_main_scl_t(iic_main_scl_t),
        .iic_main_sda_i(iic_main_sda_i),
        .iic_main_sda_o(iic_main_sda_o),
        .iic_main_sda_t(iic_main_sda_t),
        .mdio_mdc_mdc(mdio_mdc_mdc),
        .mdio_mdc_mdio_i(mdio_mdc_mdio_i),
        .mdio_mdc_mdio_o(mdio_mdc_mdio_o),
        .mdio_mdc_mdio_t(mdio_mdc_mdio_t),
        .phy_reset_out(phy_reset_out),
        .reset(reset),
        .rs232_uart_rxd(rs232_uart_rxd),
        .rs232_uart_txd(rs232_uart_txd),
        .rxclk_n(rxclk_n),
        .rxclk_p(rxclk_p),
        .spi_flash_io0_i(spi_flash_io0_i),
        .spi_flash_io0_o(spi_flash_io0_o),
        .spi_flash_io0_t(spi_flash_io0_t),
        .spi_flash_io1_i(spi_flash_io1_i),
        .spi_flash_io1_o(spi_flash_io1_o),
        .spi_flash_io1_t(spi_flash_io1_t),
        .spi_flash_ss_i(spi_flash_ss_i_0),
        .spi_flash_ss_o(spi_flash_ss_o_0),
        .spi_flash_ss_t(spi_flash_ss_t),
        .sys_clk_n(sys_clk_n),
        .sys_clk_p(sys_clk_p),
        .vfat3_txd_n(vfat3_txd_n),
        .vfat3_txd_p(vfat3_txd_p));
  IOBUF iic_main_scl_iobuf
       (.I(iic_main_scl_o),
        .IO(iic_main_scl_io),
        .O(iic_main_scl_i),
        .T(iic_main_scl_t));
  IOBUF iic_main_sda_iobuf
       (.I(iic_main_sda_o),
        .IO(iic_main_sda_io),
        .O(iic_main_sda_i),
        .T(iic_main_sda_t));
  IOBUF mdio_mdc_mdio_iobuf
       (.I(mdio_mdc_mdio_o),
        .IO(mdio_mdc_mdio_io),
        .O(mdio_mdc_mdio_i),
        .T(mdio_mdc_mdio_t));
  IOBUF spi_flash_io0_iobuf
       (.I(spi_flash_io0_o),
        .IO(spi_flash_io0_io),
        .O(spi_flash_io0_i),
        .T(spi_flash_io0_t));
  IOBUF spi_flash_io1_iobuf
       (.I(spi_flash_io1_o),
        .IO(spi_flash_io1_io),
        .O(spi_flash_io1_i),
        .T(spi_flash_io1_t));
  IOBUF spi_flash_ss_iobuf_0
       (.I(spi_flash_ss_o_0),
        .IO(spi_flash_ss_io[0]),
        .O(spi_flash_ss_i_0),
        .T(spi_flash_ss_t));
endmodule
