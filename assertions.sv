module assertions(
input  logic clk ,
input  logic Wr_enable ,
input  logic full ,
input  logic [4:0] write_ptr , read_ptr ,
input  logic reset ,
input  logic empty ,
logic [31:0] data_out , data_in

);

//fifo_af.DUT intfa
assertion1: assert property(@(posedge clk) disable iff (reset) (Wr_enable && !full) |=> (write_ptr == ($past(write_ptr) + 1'd1))); 
assertion1c: cover property(@(posedge clk) disable iff (reset) (Wr_enable && !full) |=> (write_ptr == ($past(write_ptr) + 1'd1))); 
//if (data_in[7:0]>150)  data_in[31:24] inside {[0:50]}

//Bonus
// assertion for Randomization 
// For FIFO , if (data_in[7:0]>150)  data_in[31:24] inside {[0:50]

assertion2: assert property(@(posedge clk)  disable iff (reset) ((data_in[7:0] > 8'd150)) |-> ((data_in[31:24] >= 8'd0)  && (data_in[31:24] <= 8'd230))); 
assertion2c: cover property(@(posedge clk)  disable iff (reset) ((data_in[7:0] > 8'd150)) |-> ((data_in[31:24] >= 8'd0)  && (data_in[31:24] <= 8'd230))); 

endmodule

