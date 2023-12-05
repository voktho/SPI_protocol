module top_tb();
reg clk;
reg rstn;
reg ss;
reg sclk;
reg  mosi;
wire miso;

integer i;

reg [7:0] data_in = 'hAB;

top_spi top_dut(
.clk(clk),
.rstn(rstn),
.ss(ss),
.sclk(sclk),
.mosi(mosi),
.miso(miso)
);

always #5 clk=~clk;

initial begin


clk<=0;
rstn<=0;
ss<=1;
mosi<=0;
sclk<=0;

@(posedge clk);
rstn<=1;
@(posedge clk)
drive_mosi(data_in);
  drive_mosi(8'hCD);
#200 $finish;
end

task drive_mosi(input [7:0] data);
    ss<=0;
    repeat(2) @(posedge clk);
    for(i=0;i<8;i=i+1)
    begin
    sclk<=1;
    mosi<=data[i];
    repeat(2) @(posedge clk);
    sclk<=0;
    repeat(2) @(posedge clk);
    end
  repeat(2) @(posedge clk);
endtask



            
endmodule

