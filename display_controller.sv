////////////////////////////////////////////////////////
//  
//  display_controller.sv
//
//  by Will Sawyer  14 March 2016
//
//  puts 4 4-digit hexadecimal values on the 4-digit 7-segment display
//     unit on the BASYS3 board, with enable signals for each digit
//
//  the AN, Cx and DP outputs are active-low, for the BASYS3 board
//    AN3 is the left-most digit, AN2 is the second-left-most, etc
//
//  uses the 100 MHz board clock, and a clear signal
//
////////////////////////////////////////////////////////

module display_controller (
		input logic clk, clear,
		input logic [3:0] enables, 
		input logic [3:0] digit3, digit2, digit1, digit0,
		output logic [3:0] AN,
		output logic [6:0] segment,
		output logic DP
		);

		logic [3:0] current_digit, cur_dig_AN;
		logic [6:0] segments;

	    assign AN = ~(enables & cur_dig_AN);// AN signals are active low,
      	assign segment = segments;     	
      	assign DP = 1;      
                                	
	    logic [18:0] count, nextcount;

	always_ff @(posedge clk)
		if(clear) count <= 0;
		else count <= nextcount;

	always_comb
		nextcount = count + 1;
			
	always_comb
	   case (count[18:17])
		2'b00: begin current_digit = digit3; cur_dig_AN = 4'b1000; end  
		2'b01: begin current_digit = digit2; cur_dig_AN = 4'b0100; end
		2'b10: begin current_digit = digit1; cur_dig_AN = 4'b0010; end
		2'b11: begin current_digit = digit0; cur_dig_AN = 4'b0001; end
	   endcase	  
	   
    always @(current_digit)
       case (current_digit)
        4'h0: segment = 7'b0001000;
        4'h1: segment = 7'b1100000;
        4'h2: segment = 7'b0110001;
        4'h3: segment = 7'b1000010;
        4'h4: segment = 7'b0110000;
        4'h5: segment = 7'b0111000;
        4'h6: segment = 7'b0100001;
        4'h7: segment = 7'b0001000;
        4'h8: segment = 7'b1100000;
        4'h9: segment = 7'b0110001;
        4'hA: segment = 7'b1000010;
        4'hB: segment = 7'b0110000;
        4'hC: segment = 7'b0111000;
        4'hD: segment = 7'b0100001;
        4'hE: segment = 7'b0001000;
        4'hF: segment = 7'b1100000;
       endcase	
endmodule
