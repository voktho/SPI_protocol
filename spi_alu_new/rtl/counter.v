module counter (
    input clk, 
    input reset_n, 
    input clear, 
    input increament, 
    output reg [4:0] count
); 

    always @(posedge clk or negedge reset_n) begin 
        if(!reset_n) 
            count <= 'b0; 
        else 
            count <= clear ? 'b0: count + increament; //clear =1 --> count =0 else count+=1;
    end 
endmodule 
