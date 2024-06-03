
import my_pck ::*;

module tb_FIFO (intf_FIFO intf_inst);


  randomization rndm=new();

    //coveragegroup 
  covergroup cover_tb @intf_inst.clk_b ;
   coverpoint  intf_inst.clk_b.full;
   coverpoint  intf_inst.clk_b.empty;
  endgroup
  
    //initialization for cover group
  cover_tb cov=new();

  initial begin
 
    //checking reset process
  intf_inst.reset=0;
  #1;
  intf_inst.reset=1; 
  #1;
  intf_inst.reset=0; 
  #1;
  
 
   repeat(1000) begin
      
      assert (rndm.randomize());
	  intf_inst.reset  <=   rndm.reset;
      intf_inst.clk_b.Wr_enable <=   rndm.Wr_enable;
      intf_inst.clk_b.Read_enable <= rndm.Read_enable;
      intf_inst.clk_b.data_in <=     rndm.data_in;
     @intf_inst.clk_b;
 
   end
    //additional direct test for unreachable values with randomization due to specific constraints    
    intf_inst.clk_b.data_in[15:14] <= 2'b11 ;
	#2
    intf_inst.clk_b.data_in[15:14] <= 2'b00 ;
    #2
	intf_inst.clk_b.data_in[15:14] <= 2'b01 ;
	#2
    intf_inst.clk_b.data_in[15:14] <= 2'b10 ;
    #2
	intf_inst.reset = 1 ;
	#2	
 $stop;
 end



endmodule
