//clock generation
class clk_generation;
  virtual counter_sgl vif;
  function new(virtual counter_sgl vif);
    this.vif = vif;
  endfunction
 
  task clkgen_task();
    $display("Clock Generation Started");
    forever begin
      #5 vif.clk = ~vif.clk;
    end
    $display("Clock Generation End");
  endtask
endclass
