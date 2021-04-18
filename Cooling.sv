`timescale 1ns/1ns

module Cooling_TB;

logic clk;
logic reset;
real I1;
real I2;
real ambientRate;
real conditionRate;
real threshold; 


logic heat;
logic cool;
logic idle;







AirConditioning dut(
.clk(clk),
.reset(reset),
.I1(I1),
.I2(I2),
.heat(heat),
.cool(cool),
.idle(idle)

);

initial 
	begin

		reset <=1; #10

		reset <=0;
		 I1 <= 20.0;
		 I2 <= 15.0;
		
		ambientRate = 0.1;
		conditionRate = 0.5;
		threshold = 2.0; #10;

	end


always
begin

	if(heat ==1) begin
	I2 = I2 + conditionRate -ambientRate;
	end

	else if(cool ==1) begin
	I2 = I2 - conditionRate + ambientRate;
	end

	else begin

	I2 = I2 - ambientRate;

	

	end





#100;


clk <=1; #5;
clk <=0; #5;


end

//else begin
//I2  = I2 -ambientRate;
//end



//else begin
//I2 =I2 +ambientRate
//end








endmodule


