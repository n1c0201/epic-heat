module heating_dut(
    I1,
    I2,
    rst,
    A,
    B
);


input rst;

output A;
output B;

real I1;
real I2;
real ambientRate;
real conditionRate;
real threshold; 

parameter [1:0] S0 = 2'b00;
parameter [1:0] S1 = 2'b01;
parameter [1:0] S2 = 2'b10;

reg [1:0] state, next_state;

always @(posedge clock)
begin
    if(reset) begin
        state <= S0;
    end
    else 
    begin
        state <= next_state;
    end

end

reg [1:0] state, next_state;

always @(posedge clock)
begin
    if(reset) begin
        state <= S0;
    end
    else 
    begin
        state <= next_state;
    end

end
//S0 = IDLE | S1 = HEATING | S2 = COOLING
always @(A or B or state)
begin
    case(state)
        S0:
            if(A || B == 1'b0) begin
                I2 = I2 + ambientRate;
                next_state = S0;
            end
            else if(A == 1'b1) begin
                I2 = I2 + ambientRate;
                next_state = S1;
            end
            else if(B == 1'b1) begin
                I2 = I2 + ambientRate;
                next_state = s2;
            end
        S1:
            if (A == 1'b0) begin
                I2 = I2 + ambientRate;
                I2 = I1 + conditionRate;
                next_state = S0;
            end
            else if (A == 1'b1) begin
                I2 = I2 + ambientRate;
                I2 = I1 + conditionRate;
                if(I1 > I2) begin
                    A = 0
                end
                next_state = S1;
            end
        S2:
            if (B == 1'b0) begin
                I2 = I2 + ambientRate;
                I2 = I1 + conditionRate;
                next_state = S0;
            end
            else if (B == 1'b1) begin
                I2 = I2 + ambientRate;
                I2 = I1 + conditionRate;
                if(I1 < I2) begin
                    B = 0
                end
                next_state = S2;
            end
        default: next_state = S0;
    endcase
    
end

endmodule