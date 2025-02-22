module half_addr(
  input a,b;
  output s,c;
);

  wire a,b;
  reg s,c;

  assign s = a^b;
  assign c = a&b;

endmodule

// testbench

module tb();

  reg a,b;
  wire s,c;

  half_addr dut (
    .s(s),
    .c(c),
    .a(a),
    .b(b)
  );

  initial begin 

       a=0;b=0;
    #10 a=0;b=1;
    #10 $finish;

  end 
endmodule 

  
        
