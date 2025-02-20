module blocking;

  reg [31:0] data;
  real real_v ;
  int value ;

  initial begin 

    real_v = 3.44;
    value = 100;
    data = 8'h A;

    $display ("real_v = %b,value =%b,data =%h",real_v,value,data);

  end 
endmodule 

//exaple 2

module blocking;
  reg [3:0] data = 4'h5;
  reg [3:0] y = 4'h3;
    
  initial begin // first initial block
    y = data;
    $display("1st block: data = %0h and y = %0h", data, y);
  end
  
  initial begin // second initial block
    data = y;
    $display("2nd block: data = %0h and y = %0h", data, y);
  end  
endmodule


//output 

1st block: data = 5 and y = 5
2nd block: data = 5 and y = 5
