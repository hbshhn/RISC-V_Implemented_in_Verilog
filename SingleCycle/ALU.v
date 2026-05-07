module ALU
(
	input wire [31:0] A,
	input wire [31:0] B,
	input wire [1:0] ALUop,
	
	output reg Zero,
	output reg [31:0] ALUresult
);
	always @ (*)
	begin
		case (ALUop)
			2'b00: ALUresult = A & B; // AND
			2'b01: ALUresult = A | B; // OR
			2'b10: ALUresult = A + B; // AND
			2'b11: ALUresult = A - B; // SUB
			default: ALUresult = 32'b0;
		endcase
		
		if (ALUresult == 32'b0)
			Zero = 1'b1;
		else if (ALUresult != 32'b0)
			Zero = 1'b0;
	end
endmodule
