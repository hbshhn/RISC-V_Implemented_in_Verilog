module DataMemory
(
    input clk,
    input [31:0] Address,
    input [31:0] WriteData,
    input MemWrite,
    output reg [31:0] ReadData
);
    reg [7:0] memory [0:4095]; // the internal memory
    // 4 KB of memory

    always @ (posedge clk)
    begin
        if (MemWrite)
        begin
            memory [Address] <= WriteData [7:0];
            memory [Address + 1] <= WriteData [15:8];
            memory [Address + 2] <= WriteData [23:16];
            memory [Address + 3] <= WriteData [31:24]; 
        end
    end

    always @ (*)
    begin
        ReadData = 
            {
                memory[Address + 3],
                memory[Address + 2],
                memory[Address + 1],
                memory[Address]
            };
    end

endmodule
