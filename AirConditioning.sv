module AirConditioning(
input logic clk,
input logic reset,
input real I1,
input real I2,
output logic heat,
output logic cool,
output logic idle
);

typedef enum logic [1:0] {Idle,A,B} State;
real threshold = 2.0 ;
State currentState, nextState;

always_ff @(posedge clk)
	if (reset) currentState <= Idle;
	else currentState <= nextState;

always_comb

	case(currentState)
		Idle: 	if(I1 >= I2+threshold) nextState = A;
			else if (I1 <= I2 -threshold) nextState = B;
			else nextState = Idle;

		A: if(I1 > I2) nextState = A;
			else nextState = Idle;

		B: if(I1 < I2) nextState = B;
			else nextState = Idle;


		default: nextState = Idle;

	endcase


	assign heat = (currentState == A);
	assign cool = (currentState == B);
	assign idle = (currentState == Idle);

endmodule
