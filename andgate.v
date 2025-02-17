module and_gate (
  input a,
  input b,
  output c 
);

  assign c= a&b;

endmodule 

//testbench 

module and_gate_tb;

  reg a,b;
  wire c;

  and_gate dut (a,b,c);

  initial begin
    #10 a=0;b=1;
    #10 a=1;b=1;
    $finish;
  end 

  always@(*)
    begin
    $display ("a=%b,b=%b,c=%b",a,b,c);
  end

endmodule
