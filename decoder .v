//design 

module decoder_d(
  input [2:0]in,
  output [7:0]out
);

  always@(*)
    begin
    case (in)
      3'b000:out = 8'h0000_0001;
      3'b001:out = 8'h0000_0010;
      3'b010:out = 8'h0000_0100;
      3'b011:out = 8'h0000_1000;
      3'b100:out = 8'h0001_0000;
      3'b101:out = 8'h0010_0000;
      3'b110:out = 8'h0100_0000;
      3'b111:out = 8'h1000_0000;
      default:out = 8'h0000_0000;
    endcase
  end 

  //testbench

  module testbench;
    reg [2:0] in;
    wire [7:0] out;
    
    decoder_3_to_8 uut (
        .in(in),
        .out(out)
    );
    
    initial begin
        $monitor("Time=%0t | Input=%b | Output=%b", $time, in, out);
        
        in = 3'b000; #10;
        in = 3'b001; #10;
        in = 3'b010; #10;
        in = 3'b011; #10;
        in = 3'b100; #10;
        in = 3'b101; #10;
        in = 3'b110; #10;
        in = 3'b111; #10;
        
        $finish;
    end
endmodule

        
