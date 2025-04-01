//design 

module counter_d(
  input clk,
  input reset,
  output reg [2:0] q
);

  always@(posedge clk or posedge reset)
    begin 
      if (reset)
        q <= 3'b000;
      else 
        q <= q+1;
    end 

endmodule 

//testbench 

module counter_tb();

  wire [2:0] q;
  reg clk;
  reg reset;

  counter_d(.clk(clk),
            .reset(reset),
            .q(q)
           );

  initial begin 
    clk = 0;
    #10 reset = 1;
    #10 reset = 0;
    #100 $finish;
  end 

  initial begin 
    #10 $display("time=%t,clk=%b,reset=%b,q=%b",$time,clk,reset,q);
  end 

endmodule 
            
