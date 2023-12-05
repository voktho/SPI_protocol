module counter(input clk,
              input rstn,
              input clear,
              input incr,
              output reg [3:0] count);
  
  
  
  
  
  always @(posedge clk,negedge rstn)
    begin
      if(!rstn)
        count<='b0;
      else if(clear)
        count<='b0;
      else
        count<= incr? count+1'b1 :count;
    end
  
  
endmodule

