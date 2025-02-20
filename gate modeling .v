module gate_level(
  input i1,i2,i3,
  output and1,or1,
  output xor1,xnor1,
  output  nand1 );

  initial begin 

    and a1 (and1,i1,i2,i3);
    or o1 (or1,i1,i2,i3);
    nand n1(nand1,i1,i2,i3);
    nor n2(nor1,i1,i2,i3);
    xor x1(xor1,i1,i2,i3);
    xnor x2(xnor1,i1,i2,i3);

  end 

endmodule 

//testbench 

module gate_tb;

  reg i1,i2,i3;
  wire and1,or1,nand1,nor1,xnor1;

  gate_level dut (and1,or1,nand1,nor1,xnor1,i1,i2,i3);

  initial begin 

    i1=0;i2=0;i3=0;
   #10 i1=0;i2=0;i3=1;
    #10i1=0;i2=1;i3=0;
    #10i1=0;i2=1;i3=1;
    #10i1=1;i2=0;i3=0;
    #10i1=1;i2=0;i3=1;
    #10i1=1;i2=1;i3=0;
    #10$finish

 #10   $display("time=%t,i1=%b,i2=%b,i3=%b,and1=%b,or1=%b,nand1=%b,nor=%b,xnor=%b",$time ,i1,i2,i3,and1,or1,nand1,nor1,xnor1);
    

  end 
    

    
  
