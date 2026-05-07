module RegisterFile
(
    input [4:0] ReadRegister1,
    input [4:0] ReadRegister2,
    input [4:0] WriteRegister,
    input [31:0] WriteData,
    input RegWrite,
    input clk,

    output reg [31:0] ReadData1,
    output reg [31:0] ReadData2
);

reg [31:0] register [31:0]; // our internally stored registers

always @ (posedge clk)
begin
    if (RegWrite == 1'b1) // RegWrite is asserted, data writted to register
    begin
        register [WriteRegister] <= WriteData;
    end
end

always @ (*)
begin
    ReadData1 = register[ReadRegister1]; // tje combinational logic that outputs registers
    ReadData2 = register[ReadRegister2];
end
endmodule
