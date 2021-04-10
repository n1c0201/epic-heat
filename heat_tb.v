`include "heat_dut.v"

module heat_tb();

reg rst;

output A;
output B;

real I1; //target temperature
real I2; //ambient temperature
real ambientRate; //rate at which the room cool down or heats up
real conditionRate; // rate at which the machine cools down the room or heats up the room
real threshold; 

initial begin
    rst = 1;
    A = 0;
    B = 0;
    I1 = 18.0;
    I2 = 26.0;
    ambientRate = 0.1;
    conditionRate = -0.5;
    threshold = 2.0;
end

always
    #500
    if(I1 >= I2 + threshold) begin
        B = 1;
        A = 0;
    end
    else if(I1 <= I2 + threshold) begin
        A = 1;
        B = 0;
    end

heating_dut dut(
    I1,
    I2,
    rst,
    A,
    B
);

endmodule