//reset generation
class rst__generation;
  virtual counter_sgl vif;
  function new (virtual counter_sgl vif);
    this.vif = vif;
  endfunction
  task rstgen_task();
    #1;
    vif.rst = 1'b1;              //reset is high
    repeat(2)@(posedge vif.clk);// Hold reset high for 2 clock cycles
    vif.rst = 1'b0;             //reset is low - active 
  endtask
endclass
