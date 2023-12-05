module tb_posedge;

reg clk;
reg rstn;
reg sclk;
wire sclk_posedge;

posedge_detector dut(.clk(clk),
                     .rstn(rstn),
                     .sclk(sclk),
                     .sclk_posedge(sclk_posedge)
                     );
                     
initial begin
    clk<=0;
    rstn<=0;
    sclk<=0;
    
    @(posedge clk);
    rstn<=1;
    repeat(5) begin
    repeat(2)
    @(posedge clk);
    sclk<=1;
    repeat(2)
    @(posedge clk);
    sclk<=0;
    end
    $finish;
    end
always #5 clk=~clk;

endmodule

