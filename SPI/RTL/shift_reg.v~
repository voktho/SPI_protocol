module shift_reg_n #(parameter data_width=8) (input clk,
                                     input rstn,
                  		     input data_in,
                                     input shift_en,
                                     output miso);
  
  
  reg [data_width-1:0] data_out;
  always @(posedge clk,negedge rstn)
    begin
      if(!rstn)
        data_out <= 'b0;
      else
        data_out <= shift_en ? {data_in,data_out[data_width-1:1]}:data_out;
      
      end
      
      assign miso=data_out[0];
endmodule

