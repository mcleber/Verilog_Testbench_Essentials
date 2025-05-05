`timescale 1ns / 1ps

// Somador de 1-bit (full adder)

module full_adder(
    input A,        // entrada A
    input B,        // entrada B
    input Cin,      // entrada de carry-in
    
    output Sum,     // resultado da soma
    output Cout     // resultado do carry-out
);

// Atribui o valor da soma e do carry-out usando adição binária
assign {Cout, Sum} = A + B + Cin;

endmodule
