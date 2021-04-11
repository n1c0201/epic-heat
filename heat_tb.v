`include "heat_dut.v"

module heat_tb();

reg rst;
reg clock;
reg A;
reg B;

wire LR;
wire LG;



//real I1; //target temperature
//real I2; //ambient temperature
//real ambientRate; //rate at which the room cool down or heats up
//real conditionRate; // rate at which the machine cools down the room or heats up the room
//real threshold; 

initial begin
    rst = 1;
    A = 0;
    B = 0;
    clock = 0;
    //I1 = 18.0;
    //I2 = 26.0;
    //ambientRate = 0.1;
    //conditionRate = -0.5;
    //threshold = 2.0;
    #20
    rst = 0;
    #200
    A = 1;
end

always
    #10
    clock = ~clock;

heating_dut dut(
    clock,
    LG,
    LR,
    rst,
    A,
    B
);

endmodule