//////////////////////////////////////////////////////////////////////////////////
// Company: Bilkent University
// Engineer: Ridvan Çelik
// 
// Create Date: 03/30/2016 03:52:02 PM
// Module Name: keyboard
// Project Name: Digital Piano
// Target Devices: BASYS3 
// Description: To get data from 4x4 matrix keypad on beti board.
// 
// Revision:
// Additional Comments: JB ports should connect to keypad.
// 
//////////////////////////////////////////////////////////////////////////////////

module keyboard(
        input logic clk,
        input logic [3:0] JBI,
        output logic [3:0] JBO,
        output logic [3:0] hex,
        output logic [7:0] key
     );
    
    logic stop;
    logic [7:0] key;
	logic [20:0] count, nextcount;

	always_ff @(posedge clk)
	   if (~stop) count <= nextcount;

	always_comb
		nextcount = count + 1;
			
	always_comb begin
	   case (count[20:19])
		2'b00:  JBO <= 4'b0001; 	
		2'b01:  JBO <= 4'b0010; 		
		2'b10:  JBO <= 4'b0100; 	
		2'b11:  JBO <= 4'b1000; 		
	   endcase	
	    if((JBI == 4'b1000) | (JBI == 4'b0100) | (JBI == 4'b0010) | (JBI == 4'b0001) )  begin stop = 1; key <= {JBI,JBO}; end 
	    else begin stop = 0; key <= 8'b00000000; end
	   end
	   
    always_comb
       case (key)
        8'b00010001: hex = 4'b0000; 
        8'b00010010: hex = 4'b0001; 
        8'b00010100: hex = 4'b0010; 
        8'b00011000: hex = 4'b0011; 
        8'b00100001: hex = 4'b0100; 
        8'b00100010: hex = 4'b0101; 
        8'b00100100: hex = 4'b0110; 
        8'b00101000: hex = 4'b0111; 
        8'b01000001: hex = 4'b1000; 
        8'b01000010: hex = 4'b1001;
        8'b01000100: hex = 4'b1010; 
        8'b01001000: hex = 4'b1011; 
        8'b10000001: hex = 4'b1100; 
        8'b10000010: hex = 4'b1101; 
        8'b10000100: hex = 4'b1110; 
        8'b10001000: hex = 4'b1111;
        default hex = hex; 	
       endcase          	   
endmodule