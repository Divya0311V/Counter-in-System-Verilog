//simulus block
class simulation_c;
  virtual counter_sgl vif;
  function new (virtual counter_sgl vif);
    this.vif = vif;
  endfunction
  task simulation_task();
    //vif.exact = 1;
    //#5;
    repeat(50) @(posedge vif.clk or posedge vif.rst)begin
      vif.exact = $urandom_range(0,1);
    end
    #500;
    $finish;
  endtask
endclass
  
