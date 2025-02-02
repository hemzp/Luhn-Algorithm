// Top Module that defines the I/Os for our SoC board.
module DE1_SoC (HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
    output logic  [6:0]    HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;   
    output logic  [9:0]    LEDR;   
    input  logic  [3:0]    KEY;
    input logic [9:0] SW;

    assign HEX0 = 7'b1111111;   
    assign HEX1 = 7'b1111111;  
    assign HEX2 = 7'b1111111;  
    assign HEX3 = 7'b1111111;  
    assign HEX4 = 7'b1111111;  
    assign HEX5 = 7'b1111111;


    //Main logic.
    logic discountSignal, stolenSignal, expensiveSignal;
    logic U, P, C, M;

    assign U = SW[9];
    assign P = SW[8];
    assign C = SW[7];
    assign M = SW[0];



    assign discountSignal = (~U & ~P) | (U & P & ~C);
    assign LEDR[0] = discountSignal;

    assign expensiveSignal = (U & C) | (~U & ~P & ~C);
    assign stolenSignal = (expensiveSignal & ~ M);
    assign LEDR[1] = stolenSignal;
endmodule 

//Testbench for UPC logic with different name
module DE1_SoC_testbench();
	logic  [6:0]    HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;   
   logic  [9:0]    LEDR;   
   logic  [3:0]    KEY;
   logic [9:0] SW;
	
	DE1_SoC dut (.HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5, .KEY, .LEDR, 
	.SW);
	
	integer i;
	initial begin 
//	
		SW[6:1] = 1'b0;
		for(i = 0; i < 16; i++) begin
			{SW[9:7], SW[0]} = i[3:0]; 
			#10;
		end
	end 
endmodule 
	 



