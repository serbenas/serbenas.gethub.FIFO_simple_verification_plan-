package my_pck;

class randomization  #(DATA_WIDTH = 32);
  rand  bit  Wr_enable,Read_enable;
  rand  bit  [DATA_WIDTH -1:0] data_in;
  rand  bit  reset;

  constraint n1 { data_in[7:0] inside {[100:230]}; }
  constraint n2 { data_in[15:8] inside {[200:255]}; }
  constraint n3 { data_in [23:16] dist{ [0:100]:=30,[100:200]:=60,[200:255]:=10};}
  constraint n4 { Wr_enable dist {0:=10, 1:=90}; 
                  reset dist {0:=90, 1:=10};
                  Wr_enable==!Read_enable;
                }
  constraint n5 {
    if (data_in[7:0] > 150)
     data_in[31:24] inside {[0:50]};
    else
      data_in[31:24] inside {[0:255]};
  }


 endclass
endpackage 