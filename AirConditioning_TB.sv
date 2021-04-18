`timescale 1ns/1ns

module AirConditioning_TB;

logic clk;
logic reset;
real I1;
real I2;
real ambientRate;
real conditionRate;


logic heat;
logic cool;








AirConditioning dut(
.clk(clk),
.reset(reset),
.I1(I1),
.I2(I2),
.heat(heat),
.cool(cool)


);

initial 
	begin

		reset <=1; #10

		reset <=0;
		 I1 <= 26.0;
		 I2 <= 18.0;
		ambientRate = 0.1;
		
		if(I1<I2)begin
		ambientRate = -ambientRate;
		end
		conditionRate = 0.5;
		 #10;

	end


always
begin

if(cool == 1) begin
I2 = I2 - conditionRate+ambientRate;
end

else if(heat == 1) begin
I2 = I2 + conditionRate - ambientRate;
end

else  begin
I2  = I2 +ambientRate;
end
#100;




clk <=1; #5;
clk <=0; #5;
end








endmodule


