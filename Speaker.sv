//////////////////////////////////////////////////////////////////////////////////
// Company: Bilkent University
// Engineer: Rıdvan Çelik
// 
// Create Date: 03/30/2016 03:52:02 PM
// Module Name: Speaker
// Project Name: Digital Piano
// Target Devices: BASYS3 
// Description: According to 4 bits values it displays single 
//              steady electirical signal. 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: 
// 
//////////////////////////////////////////////////////////////////////////////////

module Speaker(
    input logic clk,
    input logic [3:0] hex,
    output logic audio
    );
    
	logic [17:0] count;
    logic [17:0] value;

	always_ff @(posedge clk)
		if(count > 1)  count--; 
		else begin count <= value; audio <= ~audio; end
        
    always_comb
      case (hex)
        // These values are wave lengths of notes with respect to time (10 nano sec)
        // value = 100,000,000 / (frequency of notes / 2)
        4'h0: value = 227273;   //A3
        4'h1: value = 202478;   //B3
        4'h2: value = 191113;   //C4
        4'h3: value = 170262;   //D4
        4'h4: value = 151685;   //E4
        4'h5: value = 143172;   //F4
        4'h6: value = 127553;   //G4
        4'h7: value = 113636;   //A4
        4'h8: value = 101238;   //B4
        4'h9: value = 95557;    //C5
        4'hA: value = 85131;    //D5
        4'hB: value = 75843;    //E5
        4'hC: value = 71587;    //F5
        4'hD: value = 63776;    //G5
        4'hE: value = 56818;    //A5
        4'hF: value = 50619;    //B5
      endcase
endmodule
