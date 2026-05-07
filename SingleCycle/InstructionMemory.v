module InstructionMemory
(
    input [31:0] ReadAddress,
    output reg [31:0] Instruction
);

    reg [7:0] memory [0:2048]; // the internal memory
    // 16 kb, 2048 rows each with 8 bit bytes
    
    always @ (*)
    begin
        Instruction = 
        {
            memory[ReadAddress+3], 
            memory[ReadAddress+2], 
            memory[ReadAddress+1], 
            memory[ReadAddress]
        }; // concatenates 4 bytes together for an instruction
    end
endmodule
