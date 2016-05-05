//////////////////////////////////////////////////////////////////////////////////
// Company: Bilkent University
// Engineer: Ridvan Çelik
// 
// Create Date: 03/30/2016 03:52:02 PM
// Module Name: top
// Project Name: Digital Piano
// Target Devices: BASYS3 
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

module top (
            input logic clk, clear, 
            input logic [3:0] sw,
            input logic [3:0] JBI,
            output logic [3:0] JBO,                       
            output logic [3:0] AN,
            output logic [6:0] segment,
            output logic DP,
            output logic [15:8] led, 
            output logic sound        
		);
		
    logic [3:0] enables = {led != 0,3'b000}; 
    logic [3:0] hex;
    logic audio;

    keyboard k(clk,JBI,JBO,hex,led);
    display_controller d(clk, clear,enables,hex,0,0,0,AN,segment,DP);
    Speaker s(clk, hex, audio);        
    
     always_comb
         if(|led )  sound <= audio; 
         else sound <= 0;
endmodule