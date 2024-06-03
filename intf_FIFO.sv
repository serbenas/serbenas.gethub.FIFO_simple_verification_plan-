interface intf_FIFO #(parameter  DATA_WIDTH = 32) (input clk);
 
  
  logic reset;
  logic  [DATA_WIDTH-1:0] data_in ;
  logic  [DATA_WIDTH-1:0] data_out ;
  logic Wr_enable;
  logic Read_enable;
  logic full,empty;
  

// Clocking block for synchronous operations
  clocking clk_b @(posedge clk) ;
     output data_in;
     output Wr_enable;
     output Read_enable;
     input data_out,full,empty;
  endclocking
  
   modport TB (clocking clk_b ,output reset );
   modport MONITOR (input clk ,reset, Wr_enable,Read_enable,data_in,full,empty,data_out);
endinterface 