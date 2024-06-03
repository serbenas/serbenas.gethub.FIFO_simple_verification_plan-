module monitor_FIFO (intf_FIFO.MONITOR infm);

    logic clk ,reset, Wr_enable,Read_enable,full,empty;
	logic [31:0] data_in ,data_out;
  initial begin
    $monitor("clk = %b, reset = %b,  Wr_enable = %b, Read_enable = %b, data_in = %b , full = %b, 
	                 empty = %b, data_out[7:0] = %d , data_out[15:8] = %d , data_out[23:16] = %d , data_out[31:24] = %d" 
	                     ,infm.clk ,infm.reset,infm.Wr_enable,infm.Read_enable, infm.data_in, infm.full, infm.empty  
						   , infm.data_out[7:0] ,  infm.data_out[15:8] , infm.data_out[23:16] , infm.data_out[31:24] );
  end
endmodule