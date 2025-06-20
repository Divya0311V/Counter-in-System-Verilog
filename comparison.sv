//comparison block
class compare;
  virtual counter_sgl vif;
  logic [7:0] out_sgl;  

  function new (virtual counter_sgl vif);
    this.vif = vif;
    out_sgl = 0;
  endfunction

  task compare_task();
    forever @(posedge vif.clk or posedge vif.rst) begin
      if (vif.rst) begin
        #1;
        if (vif.out == 0) begin
          $display("time:%0d--Pass: Reset is On",$time);
        end else begin
          $error("time:%0d--Fail: Reset On Fails",$time);
        end
      end else begin
        #1;
        if (vif.exact) begin
          $display("Exact:%0d",vif.exact);
          if (vif.out ==  out_sgl) begin
            $display("time:%0d--Pass: Holds current value:out-%0d,out_sgl-%0d",$time,vif.out,out_sgl);
          end else begin
            $error("time:%0d--Fail: Doesn't Hold current value:out-%0d,out_sgl-%0d",$time,vif.out,out_sgl);
          end
          out_sgl = vif.out; 
        end 
        else begin
          $display("Exact:%0d",vif.exact);
          #1;
          if (vif.out+1 == out_sgl + 1) begin
            #1;
            $display("time:%0d--Pass: Increment of current value:out-%0d, out_sgl  =%0d",$time,vif.out, out_sgl + 1);
          end 
        
          else begin
            #1;
            $error("time:%0d--Fail: Increment of current value:out-%0d, out_sgl =%0d",$time,vif.out, out_sgl + 1);
          end
          out_sgl = vif.out+1;
        end
        
      end
    end
  endtask
endclass
