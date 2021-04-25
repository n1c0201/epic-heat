`include "airconditioning_dut.v"

module cool_tb();

reg rst;
reg clock;
reg A;
reg B;
reg status;

wire LR;
wire LG;



real I1; //target temperature
real I2; //ambient temperature
real ambientRate; //rate at which the room cool down or heats up
real conditionRate; // rate at which the machine cools down the room or heats up the room
real threshold; // threshold between the target temperature and the temperature when the machine goes idle

//initialising all values at the start of the simulation
initial begin
    rst = 1;
    A = 0;
    B = 0;
    clock = 0;
    I1 = 18.0;
    I2 = 26.0;
    ambientRate = 0.1;
    conditionRate = 0.5;
    //changing status according to the ambient temperature
    if (ambientRate > 0) begin
        conditionRate = -conditionRate;
        status = 1;
    end
    else begin
        status = 0;
    end
    threshold = 2.0;
    #20
    rst = 0;

    
end
//Changing the values of A or B according to the status and the current temperature
always
    #100
    if(status == 1'b0) begin
        if (I1 >= I2 + threshold) begin
            A = 1;
            B = 0;
        end
        else if (I1 <= I2) begin
            A = 0;
            B = 0;
        end
    end
    else begin
        if (I1 + threshold <= I2) begin
            A = 0;
            B = 1;
        end

        else if (I1 >= I2) begin
            A = 0;
            B = 0;
        end
    end
//Calculations during each of the states
always
    #100
    if(A == 1'b1) begin
        I2 = I2 + conditionRate + ambientRate;
    end
    else if(B == 1'b1) begin
        I2 = I2 + conditionRate + ambientRate;
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
    B,
    status
);

endmodule