//design 

module t_ff (
  input t,
  input clk,
  input reset,
  output reg q
);

  always@ (posedge clk or posedge reset )
    begin 

      if (reset)
        q<=0;
      else 
        q<=~q;
    end 

endmodule

//tetbench 

module t_ff_tb();

  wire q;
  reg clk,reset ;
  reg t;

  t_ff dut (.clk(clk),
            .reset(reset),
            .t(t),
            .q(q)
           );

  initial begin 
    clk=0;
    forever #10 clk = ~clk;
  end 

  initial begin 

    reset = 1;
    #10;
    reset = 0 ; t=1;
    #10 
    t=0;
    #10;
    t=1;
    #10;
    reset = 1;
    #10 
    reset = 0;
    #10 ;
    t=0;

   #10 $finish;

  end 

  initial begin 
    #10 $display("time=%t,t=%b,clk=%b,reset=%b,q=%b",$time,clk,reset,q);
  end 

endmodule 
      
