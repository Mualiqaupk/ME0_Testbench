
`timescale 1 ns / 1 ps

	module AXI_TX_CONTROLLER_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S00_AXI
		parameter integer C_S00_AXI_DATA_WIDTH	= 32,
		parameter integer C_S00_AXI_ADDR_WIDTH	= 6
	)
	(
		// Users to add ports here
		        //input wire clk_40MHz,  
                output wire [7:0]data_out,
                //output wire done,
                input  wire [7:0]data_in,
                ///////////////////////
                output wire BIST_START,//to vfat3 for start of test
                input  wire BIST_END,//its output of vfat3
                input  wire BIST_OK,//its output of vfat3
                //output wire [31:0]BIST_CYCLES_to_processor,
                //output wire BIST_end_to_processor,
                output wire PS_ADC_ADDR,
                output wire CALIB_ADC_ADDR,
                output wire INV_TX,
                output wire INV_RX,                
                output wire EXT_RST,
		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S00_AXI
		input wire  s00_axi_aclk,
		input wire  s00_axi_aresetn,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_awaddr,
		input wire [2 : 0] s00_axi_awprot,
		input wire  s00_axi_awvalid,
		output wire  s00_axi_awready,
		input wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_wdata,
		input wire [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb,
		input wire  s00_axi_wvalid,
		output wire  s00_axi_wready,
		output wire [1 : 0] s00_axi_bresp,
		output wire  s00_axi_bvalid,
		input wire  s00_axi_bready,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_araddr,
		input wire [2 : 0] s00_axi_arprot,
		input wire  s00_axi_arvalid,
		output wire  s00_axi_arready,
		output wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_rdata,
		output wire [1 : 0] s00_axi_rresp,
		output wire  s00_axi_rvalid,
		input wire  s00_axi_rready
	);
// Instantiation of Axi Bus Interface S00_AXI
	AXI_TX_CONTROLLER_v1_0_S00_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH)
	) AXI_TX_CONTROLLER_v1_0_S00_AXI_inst (
	    //.clk_40MHz(clk_40MHz),
	    .data_out(data_out),
        //.done(done),
        .data_in(data_in),
        ////////////
        .VFAT3_BIST_start(BIST_START),//to vfat3 for start of test
        .VFAT3_BIST_end(BIST_END),//its output of vfat3
        .VFAT3_BIST_ok(BIST_OK),//its output of vfat3
        //.BIST_CYCLES_to_processor(BIST_CYCLES_to_processor),
        //.BIST_end_to_processor(BIST_end_to_processor),
        .PS_ADC_ADDR(PS_ADC_ADDR),
        .CALIB_ADC_ADDR(CALIB_ADC_ADDR),
        .INV_TX(INV_TX),
        .INV_RX(INV_RX),  
        .EXT_RST(EXT_RST),
		.S_AXI_ACLK(s00_axi_aclk),
		.S_AXI_ARESETN(s00_axi_aresetn),
		.S_AXI_AWADDR(s00_axi_awaddr),
		.S_AXI_AWPROT(s00_axi_awprot),
		.S_AXI_AWVALID(s00_axi_awvalid),
		.S_AXI_AWREADY(s00_axi_awready),
		.S_AXI_WDATA(s00_axi_wdata),
		.S_AXI_WSTRB(s00_axi_wstrb),
		.S_AXI_WVALID(s00_axi_wvalid),
		.S_AXI_WREADY(s00_axi_wready),
		.S_AXI_BRESP(s00_axi_bresp),
		.S_AXI_BVALID(s00_axi_bvalid),
		.S_AXI_BREADY(s00_axi_bready),
		.S_AXI_ARADDR(s00_axi_araddr),
		.S_AXI_ARPROT(s00_axi_arprot),
		.S_AXI_ARVALID(s00_axi_arvalid),
		.S_AXI_ARREADY(s00_axi_arready),
		.S_AXI_RDATA(s00_axi_rdata),
		.S_AXI_RRESP(s00_axi_rresp),
		.S_AXI_RVALID(s00_axi_rvalid),
		.S_AXI_RREADY(s00_axi_rready)
	);

	// Add user logic here

	// User logic ends

	endmodule
