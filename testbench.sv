`define stimulation_time #500
//include all files
`include "files.sv"
`include "interface.sv"
import sgls::*;
//module declration
module counter_8bit_verfication();
  counter_sgl vif();//counter_sgl --> interface name
  counter_8bit dut (
    .clk(vif.clk),
    .rst(vif.rst),
    .exact(vif.exact),
    .out(vif.out)  
  );
 //initialization 
  initial begin
    vif.clk <= 0;
    vif.rst <= 1;
    vif.exact <= 0;
    `stimulation_time;
    $finish;   
  end
  //run files
  initial begin
    automatic run run_h = new(vif);
    run_h.run_task();
  end
  //waveform
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
  
endmodule
