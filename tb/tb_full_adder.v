`timescale 1ns / 1ps


module tb_full_adder;       // testbench para o módulo full_adder
    
    // declaração dos sinais de entrada e saida do DUT (device under test)
    reg A, B, Cin;         // entradas do full_adder
    wire Sum, Cout;        // saídas do full_adder
    
    // instanciação do módulo full_adder
    full_adder uut(
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );
    
    // gerador de estimulos (gera as combinações de entrada)
    initial begin
        // inicializa as entradas
        A = 0; B = 0; Cin = 0;
        
        // aplicar combinações de entradas com diferentes tempos[
        #10 A = 0; B = 0; Cin = 1;
        #10 A = 0; B = 1; Cin = 0;
        #10 A = 0; B = 1; Cin = 1;
        #10 A = 1; B = 0; Cin = 0;
        #10 A = 1; B = 0; Cin = 1;
        #10 A = 1; B = 1; Cin = 0;
        #10 A = 1; B = 1; Cin = 1;
        #10; // espera mais 10 unidades de tempo (10ns - ver definição no inicio do código) para terminar
        $finish;        // finaliza a simulação
     end
     
     // monitoramento das saídas
     initial begin
        $monitor("A=%b, B=%b, Cin=%b -> Sum=%b, Cout=%b", A, B, Cin, Sum, Cout);
     end 
endmodule 
