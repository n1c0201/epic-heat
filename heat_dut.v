module heating_dut(
    clock,
    LG,
    LR,
    rst,
    A,
    B,
    status
);


input rst; //an input to reset the machine when value is 1 or reset signal (active high)
input clock; //an input on the rising edge of the clock or clock signal (active high) 
input A; //an input to determine the state of the machine
input B; //an input to determine the state of the machine
input status; //an input to determine the sign of conditionRate according to the ambientRate

output LG; //green colored LED to show when the machine is cooling the room
output LR; //red colored LED to show when the machine is heating the room

reg LG; //procedural assignment on green colored LED to show when the machine is cooling the room
reg LR; //procedural assignment on red colored led to show when the machine is heating the room

real I1; //target temperature
real I2; //ambient temperature
real ambientRate; //rate at which the room cool down or heats up
real conditionRate; // rate at which the machine cools down the room or heats up the room
real threshold; // threshold between the target temperature and the temperature when the machine goes idle

parameter [1:0] S0 = 2'b00;
parameter [1:0] S1 = 2'b01;
parameter [1:0] S2 = 2'b10;

reg [1:0] state, next_state; //pointers to see the current state and the next state

always @(posedge clock)
//Initializing the state 
begin
    if(rst) begin
        state <= S0;
    end
    else 
    begin
        state <= next_state;
    end

end

//S0 = IDLE | S1 = HEATING | S2 = COOLING
//changing states when the value of A or B changes
always @(A or B or state)
begin
    case(state)
        S0:
            if(A == 1'b1) begin
                next_state = S1;
            end
            else if(B == 1'b1) begin
                next_state = S2;
            end
            else begin
                next_state = S0;
            end
        S1:
            if (A == 1'b0) begin
                next_state = S0;
            end
            else if (A == 1'b1) begin
                next_state = S1;
            end
        S2:
            if (B == 1'b0) begin
                next_state = S0;
            end
            else if (B == 1'b1) begin
                next_state = S2;
            end
        default: next_state = S0;
    endcase
    
end
//Cases for each of the states, light up an LED to show status
//LR = Heating | LG = Cooling
always @(state)
begin
    case(state)
    S0:
        begin
            LR <= 1'b0;
            LG <= 1'b0;
        end
    S1:
    begin
            LR <= 1'b1;
            LG <= 1'b0;
        end
    S2:
    begin
            LR <= 1'b0;
            LG <= 1'b1;
        end
    default:
    begin
            LR <= 1'b0;
            LG <= 1'b0;
        end
    endcase
end

endmodule