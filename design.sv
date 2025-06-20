module counter_8bit(
  input clk,
  input rst,
  input exact,
  output reg [7:0] out
);

  always @(posedge clk or posedge rst)
  begin
    if(rst) begin
      out <= 0;
    end
    else
    begin
      if(exact)
            out <= out;     //hold current value
      else
            out <= out + 1; //increment the value
    end
  end

endmodule
