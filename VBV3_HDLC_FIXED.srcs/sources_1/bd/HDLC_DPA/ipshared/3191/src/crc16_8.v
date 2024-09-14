/*
 * Copyright (C) 2012
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
 * 02111-1307, USA.
 *
 * ====================================================
 *     __  __   __  _____  __   __
 *    / / /  | / / / ___/ /  | / / SEZIONE di BARI
 *   / / / | |/ / / /_   / | |/ /
 *  / / / /| / / / __/  / /| / /
 * /_/ /_/ |__/ /_/    /_/ |__/  	 
 *
 * ====================================================
 * Written by Giuseppe De Robertis <Giuseppe.DeRobertis@ba.infn.it>, 2012.
 *
 */
 
/* 
	crc calculator 
	This processor generate a CRC according with the CRC-CCITT standart
		
*/

module crc16_8(

	           reset,
	           clk,
	           d,
	           en,
	           crc_rst,
	           crc,
	           crc_inv,
	           crc_ok
	           );

input reset, clk, en, crc_rst;
input [7:0] d;

output [15:0] crc;
output [15:0] crc_inv;
output crc_ok;
reg [15:0] crc; 
integer i;

localparam CRC_POLY = 'h8408;
localparam CRC_WIDTH = 16;
localparam DATA_WIDTH = 8;
                        
always @(posedge clk) 
	begin
		if(!reset)
			crc = 16'h ffff;
		else if(crc_rst)
			crc = 16'h ffff;         
		else if(en)
			begin 
				for (i=0; i<DATA_WIDTH; i=i+1) begin
					if (d[i]^crc[0])
						crc = (crc >> 1) ^ CRC_POLY;
					else
						crc = (crc >> 1);
				end
			end
	end 
	
assign crc_ok = crc==16'hf0b8;
assign crc_inv = ~ crc;	
endmodule
  
