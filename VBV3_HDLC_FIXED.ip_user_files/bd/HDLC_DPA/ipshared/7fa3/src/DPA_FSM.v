`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: CERN
// Engineer: Mohsin Hayat
// 
// Create Date: 17.09.2018 18:36:11
// Design Name: DPA Implementation
// Module Name: DPA_FSM
// Project Name: FSM in DPA
// Target Devices: Kintex 7
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module DPA_FSM(
    input rst_n,
    input clk,
    
    input wire [7:0] M_data,
    input wire [7:0] S_data,
    input wire start,
    input wire mode,
    input wire cont_align,
    
    input wire [5:0]  M_delay_val_in,             //////// Master Delay Taps Inputs from the Processor
    input wire [5:0]  S_delay_val_in,             //////// Slave Delay Taps  Inputs from the Processor
    
    //output [7:0] Data_Out,
    output reg busy,
    output wire [4:0]mtap_pre,
    output wire [4:0]mtap_post,
    
    output wire [4:0]stap_pre,
    output wire [4:0]stap_post,
    
    output reg [5:0]  M_delay_val,                  // Master Delay Tap OUTs
    output reg [5:0]  S_delay_val,                  // Slave Delay Tap  OUTs     
    
    output reg Locked,
    output reg Error,
    output reg [8:0] state,
    output reg [4:0] bitTimerCounter
     //end
    );
 
 //reg [4:0]  M_delay_val; // Master Delay Tap 
 //reg [4:0]  S_delay_val; // Slave Delay Tap    
    
 ////////////////////////////////////////////////////// FSM States Declaration///////////////////////////////////////////////////////////////////////////////////////////////////////
  parameter IDLE=0, LOOK_MISMATCH1=1, LOOK_MATCH=2, LOOK_MISMATCH2=3, M_DELAY_CENTRE=4, FINAL_RES=5, CONT_NEAR_EDGE=6, CONT_FAR_EDGE=7, CONT_S_DELAY_CENTRE=8;
 ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 parameter MANUAL=0;
 parameter AUTO = 1;
 
 
 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// reg [5:0]state;
 
 reg [7:0] Mdata_old;
 
 wire InputActivity;
 wire InputEdgeNear;
 
 //reg [5:0]  M_delay_val; // Master Delay Tap 
 //reg [5:0]  S_delay_val; // Slave Delay Tap   
      
 reg [5:0]M_delay_Near_val;
 reg [5:0]M_delay_Far_val;
 
 reg [5:0]S_delay_Near_val;
 reg [5:0]S_delay_Far_val;
 
 reg count_en; 
 reg count_rst;
 reg start_p;
 reg Edge; 
 //assign Data_Out = M_data;
 
 assign InputActivity = !(M_data== 8'hff || M_data== 8'h00 || M_data== Mdata_old);// Input Activity checks on exitance of VFAT3 
 assign InputEdgeNear = M_data!= (~S_data); // Mismatch   
 
 
 // Parameters  
 parameter   TIMER_CYCLES = 10;
 parameter   TIMER_COUNTER_SIZE = TIMER_CYCLES;
 parameter   DELAY_HYST = 11;                                       // Slave_Hystersis
 
                      // 10-bit Decrement Counter used for delaying the Tap Values
 
 //parameter PIPELINE_DELAY = 5;    
 //reg [PIPELINE_DELAY-1:0] bitReplicatedDly;    
 //reg [PIPELINE_DELAY-1:0] bitLostDly;    
 
 always @ (posedge clk)    
     if(~rst_n)
         begin
             state                = IDLE;             
             //bitTimerCounter      = 0;                   // Counter = 0
             count_en             = 0;
             count_rst            = 1;
             Error                = 0;
             Locked               = 0;
             busy                 = 0;
             Edge                 = 0;                   
         end
         else  
             begin
                  busy =1;
                   
                 //Mdata_old  <= M_data;
                 //Error      <= 0;
                 //Locked    <= 0;                 
                
          
 ///////////////////////////////// FSM starts here/////////////////////////////////////////                            
         case(state)
         
         IDLE: begin              // First State decide whether Match and Mismatch Occur
         busy = 0;
         if (mode == MANUAL)begin
         M_delay_val = M_delay_val_in;                                                                  
         S_delay_val = S_delay_val_in;
         end 
         
         else if (start & ~start_p) 
                begin
                    if(InputActivity)
                    begin
                    Error       =0;
                    Locked     =0;
                    
                    count_en    =1;   
                    count_rst   =0;
                    M_delay_val =0;                                                                  
                    S_delay_val = M_delay_val + DELAY_HYST;                                                                   
                    state       = LOOK_MISMATCH1;                                                      
                    end            ////// IF INPUTACT     
                    else 
                    begin
                    Error = 1;
                    state = IDLE;   //if MATCH occurs goto next MATCH STATE
                    end     ///// ELSE INPUTACT
                   
           end   //// IF START 
      
      else       ///// else START
      begin
      state     = IDLE;
      count_en  = 0;
      count_rst = 1;
      end              
                
      end 
   ///////////////////////////////////////////////// 2nd State LOOK for MISMATCH1 //////////////////////////////////////         
            LOOK_MISMATCH1:
        begin    // 1st MisMatch State
             
             if(bitTimerCounter==(TIMER_CYCLES-1))
             begin
                    if(InputEdgeNear)
                        begin          //// MISMATCH
                            M_delay_val = M_delay_val + 3;
                            S_delay_val = M_delay_val + DELAY_HYST;
                            state = LOOK_MATCH;
                        end
    
                   else if(M_delay_val <= 35)
                        begin
                            M_delay_val = M_delay_val + 1'b1;
                            S_delay_val = M_delay_val + DELAY_HYST;
                            state = LOOK_MISMATCH1;
                        end
                    
                   else
                       begin           // NO MATCH FOUND
                            Error = 1;
                            state = IDLE;
                       end 
             end//end bit timer counter          
        end//end look mismatch 
                                
                                
     ///////////////////////////////////////////////// 3rd State LOOK for MATCH //////////////////////////////////////                           
              LOOK_MATCH: begin     // Match State
                  if(bitTimerCounter==(TIMER_CYCLES-1))begin
                     if(InputEdgeNear)begin       //// MISMATCH      
                           if (M_delay_val <=60)begin
                            M_delay_val = M_delay_val + 1'b1;                                                                  
                            S_delay_val = M_delay_val + DELAY_HYST;    
                            end     
                                  else begin
                                  Error = 1;
                                  state = IDLE;
                                  end
                                     end   //// end If(InputedgeNear)
                                       
                      else begin              ///// MATCH FOUND    /////// START of DATA EYE 
                      M_delay_Near_val = M_delay_val - 3 ;        
                      state = LOOK_MISMATCH2;   
                      end
                                                        end   /////   Counter end
                     end   // State end          
      
      ///////////////////////////////////////////////// 4th State LOOK for MISMATCH2 //////////////////////////////////////                          
                                 
            LOOK_MISMATCH2: begin             // MATCH          MIDDLE PORTION of DATA EYE
                     if(bitTimerCounter==(TIMER_CYCLES-1))begin
                         if(~InputEdgeNear) begin   ///// MATCH              
                              if (M_delay_val <=60)begin
                              M_delay_val = M_delay_val + 1'b1;                                                                  
                              S_delay_val = M_delay_val + DELAY_HYST;    
                              end     
                                        else begin
                                        Error = 1;
                                        state = IDLE;
                                        end
                                         end  
                      else begin                           /////  END of DATA EYE 
                      M_delay_Far_val = M_delay_val;
                      state = M_DELAY_CENTRE;   
                      end
                             end
                      end          
   
    ///////////////////////////////////////////////// 5th State Compute M_Delay Centre //////////////////////////////////////                          
                                                       
             M_DELAY_CENTRE: begin             // Compute M_Delay_Centre
                if(bitTimerCounter==(TIMER_CYCLES-1))begin
                M_delay_val =  M_delay_Near_val + ((M_delay_Far_val - M_delay_Near_val)>> 1) ; 
                S_delay_val =  M_delay_val + DELAY_HYST; 
                state = FINAL_RES;
                end 
                
                end
    ///////////////////////////////////////////////// 6th State FINAL RESULTS //////////////////////////////////////////////////                          
                                                 
            FINAL_RES:              // MATCH
            if(bitTimerCounter==(TIMER_CYCLES-1))begin            
                if(~InputEdgeNear) begin ///// AGAIN CONFIRM the MATCH
                Locked = 1;
                Error   = 0;
                //state   = IDLE;
                //end 
                 if (cont_align)
                 state   =  CONT_NEAR_EDGE;
                 else
                 state = IDLE;
                                         
                end /// If end InputEdge Near
                
                else begin
                Error = 1;
                state = IDLE;
                end                               
              
            end//   if end BitCounter
   /////////////////////////////////////////////////////// 7th State CONT NEAR EDGE //////////////////////////////////////////////////////
            CONT_NEAR_EDGE: begin
            if (start & ~start_p)
             begin
                Edge = 1;
            end    
           
           else if(bitTimerCounter==(TIMER_CYCLES-1))
                begin
                    if (Edge)
                    begin
                        Edge =0;
                        if(InputActivity)
                        begin
                            Error       =0;
                            Locked      =0;
                            M_delay_val =0;                                                                  
                            S_delay_val = M_delay_val + DELAY_HYST;                                                                   
                            state       = LOOK_MISMATCH1;                                                      
                        end            ////// END IF INPUT ACTIVITY
                              
                        else 
                        begin
                            Error = 1;
                            state = IDLE;   //if MATCH occurs goto next MATCH STATE
                        end     ///// ELSE INPUTACT
                    end   /////EDGE
                                
                    else if(InputActivity)
                    begin  
                        if(~InputEdgeNear)     ///// CHECK THE MATCH 
                    begin     
                        if (S_delay_val > DELAY_HYST) 
                        S_delay_val = S_delay_val - 1;
                        else 
                        begin
                            Error = 1;
                            state = IDLE;   //
                        end     ///// ELSE S_Delay if
                    end
                      
                    else 
                    begin    ///// CHECK THE MISMATCH 
                        S_delay_Near_val = S_delay_val;// - DELAY_HYST;
                        S_delay_val = S_delay_val + 3;
                        state = CONT_FAR_EDGE;
                    end
                  end                 ///// END InputActivity
                 
                 end              //// END BITCOUNTER
            end        ///// END STATE
            
  ///////////////////////////////////////////////////////// 8th State CONT FAR EDGE ///////////////////////////////////////////////////////          
            CONT_FAR_EDGE: begin
            if (start & ~start_p)
                         begin
                            Edge = 1;
                        end    
                       
                       else if(bitTimerCounter==(TIMER_CYCLES-1))
                            begin
                                if (Edge)
                                begin
                                  Edge =0;
                                  if(InputActivity)
                                  begin
                                    Error       =0;
                                    Locked      =0;
                                    M_delay_val =0;                                                                  
                                    S_delay_val = M_delay_val + DELAY_HYST;                                                                   
                                    state       = LOOK_MISMATCH1;                                                      
                                  end            ////// END IF INPUT ACTIVITY
                                          
                                else 
                                begin
                                  Error = 1;
                                  state = IDLE;   //if MATCH occurs goto next MATCH STATE
                                  end     ///// ELSE INPUTACT
                                end   /////EDGE
                                            
                                else if(InputActivity)
                                begin  
                                    if(~InputEdgeNear)     ///// CHECK THE MATCH 
                                begin     
                                    if (S_delay_val < 62) 
                                    S_delay_val = S_delay_val + 1;
                                    else 
                                    begin
                                        Error = 1;
                                        state = IDLE;   //
                                    end     ///// ELSE S_Delay if
                                end
                                  
                                else 
                                begin    ///// CHECK THE MISMATCH 
                                    S_delay_Far_val = S_delay_val ;//- DELAY_HYST;
                                    S_delay_val = S_delay_val + 3;
                                    state = CONT_S_DELAY_CENTRE;
                                end
                              end                 ///// END InputActivity
                             
                             end              //// END BITCOUNTER
                        end        ///// END STATE
            
  //////////////////////////////////////////////////////// 9th State CONT_S_DELAY_CENTRE //////////////////////////////////////////////////          
            CONT_S_DELAY_CENTRE: begin
              if (start & ~start_p)
              begin
                Edge = 1;
              end    
                                   
              else if(bitTimerCounter==(TIMER_CYCLES-1))
              begin
               if (Edge)
               begin
                Edge =0;
                if(InputActivity)
                begin
                    Error       =0;
                    Locked      =0;
                    M_delay_val =0;                                                                  
                    S_delay_val = M_delay_val + DELAY_HYST;                                                                   
                    state       = LOOK_MISMATCH1;                                                      
                end            ////// END IF INPUT ACTIVITY
                                                      
                else 
                begin
                    Error = 1;
                    state = IDLE;   //if MATCH occurs goto next MATCH STATE
                end     ///// ELSE INPUTACT
               end   /////EDGE
                                                        
              else if(InputActivity)   ///////////// LATER ON CHECK THIS INPUT ACT ???????????????
                begin           
                    S_delay_val =  S_delay_Near_val + ((S_delay_Far_val - S_delay_Near_val)>> 1) ; 
                    M_delay_val =  S_delay_val - DELAY_HYST; 
                    state = CONT_NEAR_EDGE;   
              end                ///// end INPUTAct
                    end         ////// End Counter
            end            /////// End State
   ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////           
   endcase
  end   

///////////////////////////////////////////////////////////////////////////
always @ (posedge clk)    
     if(~rst_n)
             Mdata_old            <= 0;
             else Mdata_old       <= M_data;
 //////////////////////////////////////////////////////////////////////    
 always @ (posedge clk)    
      if(~rst_n)
              start_p             <= 0;
              else start_p        <= start;
  ////////////////////////////////////////////////////////////////       
always @ (posedge clk)       
                if(~rst_n)
                    bitTimerCounter <= 0;
                  //  else if (count_rst)
                  //      bitTimerCounter <= 0;
                            else //if (count_en) 
                            begin
                            if (bitTimerCounter == TIMER_CYCLES)
                            bitTimerCounter <= 0;
                                else 
                                bitTimerCounter <= bitTimerCounter + 1;
                            end
//////////////////////////////////////////////////////////////////////////////
//assign mtap_pre  = (M_delay_val < 6'd32)? M_delay_val[4:0] : 5'd31; 
assign mtap_post = (M_delay_val < 6'd32)? 5'd0 : (M_delay_val - 5'd31);

//assign stap_pre = (S_delay_val < 6'd32)? (S_delay_val [4:0]) : 5'd31; 
assign stap_post = (S_delay_val < 6'd32)? 5'd0 : (S_delay_val -5'd31) ;

assign mtap_pre = M_delay_val;
assign stap_pre = S_delay_val;

///////////////////////////////////////////////////////////////////////////
//DPA_TAPS_MODEL  DPA_TAPS_INST(

//.rst_n(rst_n),
//.clk(clk),

//.M_delay_val_In_Mod(M_delay_val), // Master Delay Tap 
//.S_delay_val_In_Mod(S_delay_val), // Slave Delay Tap   
    
//.M_data_Out_Mod(M_data),
//.S_data_Out_Mod(S_data)    
// );

endmodule
