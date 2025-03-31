//design 

module d_ff (
  input clk,
  input reset,
  input d,
  output reg q
);

  always@(posedge clk or posedge reset )
    begin 

      if(reset)
        q<=0;
      else 
        q<=d

        end 
        endmodule 

 //testbench 

        module d_ff_tb();

          reg clk,reset;
          reg d;
          wire q;

          d_ff dut (.clk(clk),
                    .reset(reset),
                    .d(d),
                    .q(q)
                   );

          initial begin 
            clk = 0;
            forever #5clk=~clk;
          end 

          initial begin 
            reset =1 ; d = 0;
            #10;
            reset = 0;
            d=1;
            #10 d=0;
            #10 d=1;
            #10 reset = 1; d=0;
            #10
            $finish;

          end 

          initial begin 
            $display("time = %t,clk=%b,reset=%b,d=%b,q=%b",$time,clk,reset,d,q);
          end 

        endmodule 
            
              
