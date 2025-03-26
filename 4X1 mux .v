module mux_eg (
  input sel,
  input a,
  output y
);

  wire [0:1] sel;
  wire [0:3] a;
  reg y;

  // using case 

  always@(*)
    begin 
      case (sel)

        2'b00 : y = a[0];
        2'b01 : y = a[1];
        2'b10 : y = a[2];
        2'b11 : y = a[3];

        default y = 1'b0;
      endcase 

    end 
endmodule 

//testbench 

module mux_eg_tb();

  reg [0:1]sel;
  reg [0:3]a;
  wire y;

  mux_eg dut (.a(a),
              .sel(sel),
              .y(y)
             );

initial begin 

  a=4'b0000;
  sel=2'b00;

 #10 sel = 00 ; a = 0001;
 #10 sel = 01 ; a = 0001;
 #10sel = 11 ; a = 0001;

 #10 $finish ;

end 

  initial begin 
   #10 $display("a=%b;sel=%b;y=%b",a,sel,y)
  end 

endmodule

  






  
