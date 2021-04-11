module heating_dut(
    clock,
    LG,
    LR,
    rst,
    A,
    B
);


input rst;
input clock;
input A;
input B;

output LG;
output LR;

reg LG;
reg LR;

//real I1;
//real I2;
//real ambientRate;
//real conditionRate;
//real threshold; 

parameter [1:0] S0 = 2'b00;
parameter [1:0] S1 = 2'b01;
parameter [1:0] S2 = 2'b10;

reg [1:0] state, next_state;

always @(posedge clock)
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