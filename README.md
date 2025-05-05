# Verilog_Testbench_Essentials
Creating testbenches in Verilog is an essential practice to verify the functionality of your modules and ensure your design behaves as expected.

## 1. Description
A testbench is a special Verilog module that is not synthesized but used solely for simulation. It instantiates the Device Under Test (DUT) and provides inputs while observing the outputs to validate the design.

## 2. Repository Structure

- assets/ - Images

- src/ - Verilog source code

- tb/ - Testbench code

## 3. Basic Structure of a Testbench
A typical Verilog testbench includes the following components:

- Test signal declaration: Signals used to connect the DUT to the testbench.

- DUT instantiation: The actual module being tested.

- Stimulus generation: Provides input signals to the DUT.

- Output monitoring: Observes the behavior of the DUT’s outputs.

- Timing control: In Verilog, simulation uses timing commands such as `#delay`.

## 4. Simple Example: Full Adder Testbench

### Full Adder Module
Available in the `src` directory.

<pre>
  module full_adder (
    input A,        // Input bit A
    input B,        // Input bit B
    input Cin,      // Carry-in input
    output Sum,     // Sum output
    output Cout     // Carry-out output
);
    // Assign the sum and carry-out using binary addition
    assign {Cout, Sum} = A + B + Cin;
endmodule
</pre>

### Full Adder Testbench
Available in the `tb` directory.

<pre>
  module tb_full_adder;  // Testbench for the full_adder module

    // Declare inputs as registers (reg) and outputs as wires (wire)
    reg A, B, Cin;       // Inputs to the full adder: A, B, and Carry-in (Cin)
    wire Sum, Cout;      // Outputs from the full adder: Sum and Carry-out (Cout)

    // Instantiate the Device Under Test (DUT)
    // 'uut' stands for "Unit Under Test"
    // This connects the testbench signals (A, B, Cin) to the full_adder inputs,
    // and connects the outputs (Sum, Cout) to wires declared above.
    full_adder uut (
        .A(A),       // Connect testbench A to full_adder input A
        .B(B),       // Connect testbench B to full_adder input B
        .Cin(Cin),   // Connect testbench Cin to full_adder input Cin
        .Sum(Sum),   // Connect full_adder output Sum to testbench wire Sum
        .Cout(Cout)  // Connect full_adder output Cout to testbench wire Cout
    );

    // Initial block to generate input stimuli
    initial begin
        // Initialize all inputs to zero
        A = 0; B = 0; Cin = 0;

        // Apply various combinations of A, B, and Cin
        #10 A = 0; B = 0; Cin = 1;
        #10 A = 0; B = 1; Cin = 0;
        #10 A = 0; B = 1; Cin = 1;
        #10 A = 1; B = 0; Cin = 0;
        #10 A = 1; B = 0; Cin = 1;
        #10 A = 1; B = 1; Cin = 0;
        #10 A = 1; B = 1; Cin = 1;
        #10;  // Wait a little before ending the simulation

        $finish;  // End the simulation
    end

    // Initial block to monitor the simulation results
    initial begin
        // This prints input and output values to the console whenever they change
        $monitor("A=%b, B=%b, Cin=%b -> Sum=%b, Cout=%b", A, B, Cin, Sum, Cout);
    end

endmodule
</pre>

## 5. Testbench Explanation
Figure 1 shows a simplified diagram.

![Simplified Diagram](https://github.com/mcleber/Verilog_Testbench_Essentials/blob/main/assets/Simplified_Diagram.jpg)

### Signal Declaration
In a testbench, inputs to the DUT are declared as `reg` because they are driven by procedural blocks, while outputs are declared as `wire`.

<pre>
  reg A, B, Cin;
  wire Sum, Cout;
</pre>

### DUT Instantiation
The DUT is instantiated and connected to the declared signals. The instance name is typically `uut` (Unit Under Test).

<pre>
  full_adder uut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout)
);
</pre>

### Stimulus Generator
This block drives the input values over simulation time using `#delay` for timing control.

<pre>
  initial begin
    A = 0; B = 0; Cin = 0;
    #10 A = 0; B = 0; Cin = 1;
    #10 A = 0; B = 1; Cin = 0;
    #10 A = 0; B = 1; Cin = 1;
    #10 A = 1; B = 0; Cin = 0;
    #10 A = 1; B = 0; Cin = 1;
    #10 A = 1; B = 1; Cin = 0;
    #10 A = 1; B = 1; Cin = 1;
    #10;
    $finish;
end
</pre>

### Output Monitoring
The `$monitor` command logs all input and output changes during simulation, providing a detailed trace.

<pre>
  initial begin
    $monitor("A=%b, B=%b, Cin=%b -> Sum=%b, Cout=%b", A, B, Cin, Sum, Cout);
end
</pre>

## 6. Running the Simulation
With the testbench ready, use simulation tools such as ModelSim, XCELIUM, or Vivado Simulator. Compile and run the simulation to observe the outputs. The results should match the expected truth table of a full adder. Figure 2 shows the simulation waveform from Vivado.

![Vivado Simulation](https://github.com/mcleber/Verilog_Testbench_Essentials/blob/main/assets/Vivado_Simulation.jpg)

## 7. Improving the Testbench
Here are some ways to enhance your testbench:

- Automatic verification: Use assertions to compare DUT outputs with expected values.

- Randomized testing: Apply random stimuli using $random to check for unexpected behavior.

- Edge case testing: Specifically test boundary values and transitions for robustness.

## 8. Conclusion
Creating testbenches in Verilog is a fundamental step in digital hardware development. It ensures your designs are functionally correct before moving to synthesis and implementation. With the example above, you can build and simulate any Verilog module using a structured stimulus and monitoring approach.

## 9. Technologies Used
- HDL: Verilog

- Development Tool: AMD Xilinx Vivado
