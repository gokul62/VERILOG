//design 

module jk_ff(
  input clk,
  input reset,
  input j,
  input k,
  outputn reg q
);

  always@(posedge clk or posedge reset )
    begin 

      if (reset)
        q<=0;
      else begin 
        case ({j,k})
          2'b00: q<=q;
          2'b01: q<=1;  // k=1 
          2'b10: q<=1;  // j=1
          2'b11: q<=~q;
        endcase
      end 
    end 
endmodule 

//testbench 

module jk_ff_tb();

  wire q;
  reg clk,reset;
  reg j,k;

  jk_ff dut (.clk(clk),
             .reset(reset),
             .j(j),
             .k(k),
             .q(q)
            );

  initial begin 
    j=0;k=0;
    clk=0;
    forever #5 clk = ~clk;
  end 

  initial begin 

    reset = 1; q = 1;
    #10 ;
    reset = 0;
    j=0;k=0;
    #10 j=0;k=1;
    #10 j=1;k=1;
    #10 j=1;k=0;
    #10 reset =1 ;
    #10 reset = 0;
    #10$finish;

  end 

  initial begin 
    #10$display("time=%t,j=%b,k=%b,clk=%b,reset=%b,q=%q",$time,j,k,clk,reset,q);
  end 

endmodule 
