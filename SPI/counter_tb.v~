module counter_tb;
  reg clk;
  reg rstn;
  reg clear;
  reg incr;
  wire [3:0] count;
  
  counter dut(.clk(clk),
              .rstn(rstn),
              .clear(clear),
              .incr(incr),
              .count(count)
             );
  
  initial begin
    
    $dumpfile("dump.vcd");
    $dumpvars(1);
    clk=1;
    rstn=0;
    clear=0;
    incr=1;
    
    #10 rstn=1;
    
    repeat(5) begin
      
    #80;
    clear=1;
    #10;
    clear=0;
      
    end
 
  end

  
  always #5 clk=~clk;
    

  initial #300 $finish;
  
  
  
endmodule
