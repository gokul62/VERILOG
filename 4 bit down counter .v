//design 

module counter_d(
  input clk,
  input reset,
  output [3:0] q,
);

  reg [3:0] q;

  always@(posedge clk or posedge reset )
    begin 
      if (reset)
        q <= 4'b1111;
      else 
        q <= q-1;
    end 
endmodule 

//testbench 

module counter_tb();

  wire [3:0] q;
  reg clk;
  reg reset;

  counter_d dut (.clk(clk),
                 .reset(reset),
                 .q(q));

  initial begin 

    clk = 0;
    reset = 1;
    #10 reset = 0;
    #100 $stop;

  end 

  initial begin 
    #10 $display("time=%t,clk=%b,reset=%b,q=%b",$time,clk,reset,q);
  end 

endmodule 

//output

Time =    0 | q = 1111
Time =   10 | q = 1110
Time =   20 | q = 1101
Time =   30 | q = 1100
Time =   40 | q = 1011
Time =   50 | q = 1010
Time =   60 | q = 1001
Time =   70 | q = 1000
Time =   80 | q = 0111
Time =   90 | q = 0110
...

    
