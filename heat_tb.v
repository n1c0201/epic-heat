`include "heat_dut.v"

module heat_tb();

reg rst;
reg clock;
reg A;
reg B;

wire LR;
wire LG;



real I1; //target temperature
real I2; //ambient temperature
real ambientRate; //rate at which the room cool down or heats up
real conditionRate; // rate at which the machine cools down the room or heats up the room
real threshold; 

initial begin
    rst = 1;
    A = 0;
    B = 0;
    clock = 0;
    I1 = 18.0;
    I2 = 26.0;
    ambientRate = 0.1;
    conditionRate = 0.5;
    threshold = 2.0;
    #20
    rst = 0;
    #100
    I2 = I2 - 1.5;
    #200
    if (I1 + threshold> I2) begin
        A = 1;
        B = 0;
    end
    else if (I1 + threshold < I2) begin
        A = 0;
        B = 1;
    end
    else begin
        A = 0;
        B = 0;
    end
    
end
always
    #100
    if (I1 + threshold > I2) begin
        A = 1;
        B = 0;
    end
    else if (I1 + threshold < I2) begin
        A = 0;
        B = 1;
    end
    else begin
        A = 0;
        B = 0;
    end
always
    #100
    if(A == 1'b1) begin
        I2 = I2 + conditionRate - ambientRate;
    end
    else if(B == 1'b1) begin
        I2 = I2 - conditionRate + ambientRate;
    end
    else begin
        I2 = I2 + ambientRate;
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