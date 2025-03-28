//design

module demux_ex(
  input wire d,
  input wire s1,
  input wire s2,
  output reg y0,
  output reg y1,
  output reg y2,
  output reg y3
  
);
  
  assign y0 = sel(2'b00)?din:0;
  assign y1 = sel(2'b01)?din:0;
  assign y2 = sel(2'b10)?din:0;
  assign y3 = sel(2'b00)?din:0;
  
endmodule 

// testbench 

module demux_tb ();
  
  reg d;
  reg s1,s2;
  
  wire y0,y1,y2,y3;
  
  demux_eg dut (.d(d),
                .s1(s1),
                .s2(s2),
                .y0(y0),
                .y1(y1),
                .y2(y2),
               .y3(y3)
                
               );
  
  
  initial begin 
    
    d=0;
    s1=0;s2=0;
    
   #10 d=1;s=00;
   #10 d=1;s=01;
   #10 d=1;s=10;
   #10 d=0;s=11;
    #10 $finish ;
    
  end 
  
  initial begin 
    
    #10$display("time=%t,d=%b,s1=%b,s2=%b,y0=%b,y1=%b,y2=%b,y3=%b",$time,d,s1,s2,y0,y1,y2,y3);
    
  end 
  
endmodule
