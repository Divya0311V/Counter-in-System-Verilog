//run files
class run;
  virtual counter_sgl vif;

  function new (virtual counter_sgl vif);
    this.vif = vif;
  endfunction

  task run_task();

    clk_generation clk_generation_h = new(vif);  
    rst__generation rstgen_task_h = new(vif);
    simulation_c simulation_h = new(vif);
    compare compare_h = new(vif);
    

    fork 
      clk_generation_h.clkgen_task();  
      rstgen_task_h.rstgen_task();
      simulation_h.simulation_task();
      compare_h.compare_task();
    join

    #500;
    $finish;
  endtask
endclass
