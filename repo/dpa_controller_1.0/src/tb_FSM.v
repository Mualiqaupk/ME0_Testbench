`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.06.2018 19:19:46
// Design Name: 
// Module Name: tb_FSM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_FSM();

parameter PERIOD = 20;
parameter COUNTER_WIDTH = 8;
parameter DELAY_SIZE = 6;

parameter MANUAL=0;
parameter AUTO = 1;
// Input Signals

// Reset Signal
reg       rst_n;
reg       start;
reg       start_p;
reg       cont_align;
// Clock Signals
reg       clk;

// Outputs

//reg         ;
//reg         Error;

wire [8:0]state ;
reg [500:0]ascii;
reg InputActivity;
reg [7:0] Mdata_old;

wire [7:0] M_data;      // Samples from Master ISERDES
wire [7:0] S_data;      // Samples from Slave ISERDES

//reg [7:0] M_data_Out_Mod;      // Samples from Master ISERDES
//reg [7:0] S_data_Out_Mod;      // Samples from Slave ISERDES



//assign Mdata_old = 8'h80;
//reg [DELAY_SIZE-1:0] M_delay_val_In_Mod; // Master Delay Tap 
//reg [DELAY_SIZE-1:0] S_delay_val_In_Mod; // Slave Data Tap

reg mode;
reg [5:0]  M_delay_val_in;
reg [5:0]  S_delay_val_in;

wire [5:0]  M_delay_val;
wire [5:0]  S_delay_val;

wire [5:0]  M_delay_val_In_Mod;
wire [5:0]  S_delay_val_In_Mod;

//wire [4:0]  M_Pre_Tap;
//wire [4:0]  M_Post_Tap;
   
//wire [4:0]  S_Pre_Tap;
//wire [4:0]  S_Post_Tap;

wire [4:0]mtap_pre;
wire [4:0]mtap_post;

wire [4:0]stap_pre;
wire [4:0]stap_post;

reg [COUNTER_WIDTH-1:0] counter = {COUNTER_WIDTH{1'b0}};

always begin 
      
      #12.5 clk = 1'b0;
      #12.5 clk = 1'b1;
      end
     
initial
 begin
 rst_n=0;
 start=0;
 mode = AUTO;
 InputActivity = 1;
 
 #(PERIOD*5)      rst_n =       1;
 #(PERIOD*10)     start =       1;
 #(PERIOD*10)     start =       0;
 #(PERIOD*1000)   start =       1;
 #(PERIOD)        start =       0;
 #(PERIOD)        cont_align =  0;
 #(PERIOD)        cont_align =  1;
 
// #(PERIOD*1000)   mode = MANUAL;
// #(PERIOD*5)   M_delay_val_in = 31;
// #(PERIOD*5)   S_delay_val_in = 50;
 
// #(PERIOD*5)   M_delay_val_in = 33;
// #(PERIOD*5)   S_delay_val_in = 20;
 
// #(PERIOD*5)   M_delay_val_in = 62;
// #(PERIOD*5)   S_delay_val_in = 31;
  
  
 
 end

always @ (posedge clk)    
      if(~rst_n)
      start_p             <= 0;
      else start_p        <= start;

///////////////////////////////////////////// DATA_IN////////////////////////////////////////////////////////////
always @(posedge clk)
     if(~rst_n)
     counter<=0;
     else if (start & ~start_p)
     counter <=0;
     else  
        counter <= counter + 1;
                          
//always@(posedge clk)
//begin
                 
//case(counter[7:0])
//0:begin         M_data<=8'h03; S_data<=8'h00;end
//1:begin         M_data<=8'h03; S_data<=8'h01;end

////////////////////////////////////////////////// INSTANTIATION////////////////////////////////////////////////////////////
DPA_FSM FSM_INST(
        .rst_n(rst_n),
        .clk(clk),
    
        .M_data(M_data),
        .S_data(S_data),
        .start(start),
        .mode(mode),
        .cont_align(cont_align),
        .M_delay_val_in(M_delay_val_in),
        .S_delay_val_in(S_delay_val_in),
        .mtap_pre(mtap_pre),
        .mtap_post(mtap_post),
        .stap_pre(stap_pre),
        .stap_post(stap_post),
        .M_delay_val(M_delay_val),                  // Master Delay Tap OUTs
        .S_delay_val(S_delay_val), 
        .Locked(Locked),
        .Error(Error)
        );

/////////////////////////////////////////////////////////////////////////////////
DPA_TAPS_MODEL  DPA_TAPS_INST(

.rst_n(rst_n),
.clk(clk),

.M_delay_val_In_Mod(M_delay_val), // Master Delay Tap 
.S_delay_val_In_Mod(S_delay_val), // Slave Delay Tap   
    
.M_data_Out_Mod(M_data),
.S_data_Out_Mod(S_data)    
 );


///////////////////////////////////////////////////////////////////////////////////////////////////////////
        always@(*)
        case(state)
        1: ascii = "IDLE ";
        2: ascii = "LOOK_MISMATCH1 ";
        4: ascii = "LOOK_MATCH ";
        8: ascii = "LOOK_MISMATCH2";
        16: ascii = "M_DELAY_CENTRE";
        32: ascii = "FINAL_RES";
        endcase

endmodule
