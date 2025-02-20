module data_model(
  input a,b,c
  output d,e
);

  reg d;



    assign d = a&b&c;
    assign e = a|b|c;

   
endmodule 

//testbench 

module data_tb;

  wire d,e;
  reg a,b,c;

  data_model dut ( d,e,a,b,c);

  initial begin 

    a=0;b=0;c=0;
    #10a=0;b=1;c=1;
    #10a=0;b=1;c=0;
    #10a=0;b=0;c=1;
    #10a=1;b=0;c=0;
    #10a=1;b=1;c=1;
    #10a=1;b=1;c=0;
#10$finish;

    $display ("time =%t,a=%b,b=%b,c=%b,d=%b,e=%b",$time,a,b,c,d,e);

  end 
endmodule 
    
