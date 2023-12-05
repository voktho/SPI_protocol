module comparator(input [3:0]val,
                  input [3:0]comp_with,
                  output comp);
  
  assign comp = (val == comp_with);
  
  
endmodule
