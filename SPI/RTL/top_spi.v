module top_spi(input clk,
               input rstn,
               input ss,
               input sclk,
               input  mosi,
               output miso);
               

wire transaction;
wire [3:0] comp_with ;
assign comp_with =4'b1000; 
wire bit_incr;
wire shift_en;
wire bit_clear;    
wire [7:0] data_out;
wire sclk_posedge;
wire [3:0] count;
       
shift_reg_n u_shift(.clk(clk),
                  .rstn(rstn),
                  .data_in(mosi),
                  .shift_en(shift_en),
                  .miso(miso));
                  
                  
counter u_count(.clk(clk),
              .rstn(rstn),
              .clear(bit_clear),
              .incr(bit_incr),
              .count(count));
              
comparator u_comparator(.val(count),
                .comp_with(comp_with),
                .comp(bit_count_eql_8)
                );
                
posedge_detector u_pos_edge(.clk(clk),
                      .rstn(rstn),
                      .sclk(sclk),
                      .sclk_posedge(sclk_posedge));
                      
spi_fsm u_spi(.clk(clk),
             .rstn(rstn),
             .ss(ss),
             .bit_count_eql_8(bit_count_eql_8),
             .sclk_posedge(sclk_posedge),
             .bit_clear(bit_clear),
             .shift_en(shift_en),
             .bit_incr(bit_incr),
             .transaction(transcation));
             
             
endmodule

