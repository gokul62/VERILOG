module behaviour_model(
  input a,b,c
  output d
);

  always@(a or b or c) begin
    assign d = a&b&c;
  end 
  
endmodule 

//testbench 

module behaviour_tb;

  reg a,b,c;
  wire d;

  behaviour_model dut (d,a,b,c);

  initial begin 

    a=0;b=0.c=0;
    #10a=1;b=1;c=0;
  #10 $finish;
    $display("time=%t,d=%b.a=%b,b=%b,c=%b",$time,d,a,b,c);
  end

endmodule 
    
  
