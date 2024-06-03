module top_FIFO();

   parameter  ADDR_WIDTH = 5;
   parameter  DATA_WIDTH = 32;
   parameter  fifo_size  =2**ADDR_WIDTH;
   bit clk;

//clock generation
  initial begin 
    forever #1 clk=~clk;
  end

//interface instance 
  intf_FIFO #( DATA_WIDTH) 
       intf_inst (clk);


//FIFO INSTANCE
  FIFO #( ADDR_WIDTH,DATA_WIDTH, fifo_size)
      FIFO_inst(.clk          (intf_inst.clk),
                .data_in      (intf_inst.data_in),
                .data_out     (intf_inst.data_out),
                .Read_enable  (intf_inst.Read_enable),
                .Wr_enable    (intf_inst.Wr_enable),
                .full         (intf_inst.full),
                .empty        (intf_inst.empty),
                .reset        (intf_inst.reset));
                 

//test_bench instance
  tb_FIFO test_inst(intf_inst.TB);
  monitor_FIFO monitor (intf_inst );

endmodule
