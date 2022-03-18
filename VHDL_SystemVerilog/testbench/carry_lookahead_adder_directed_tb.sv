///////////////////////////////////////////////////////////////////////////////
// File Modified from Nandland.com, 
// Added Self Checking Capability to the testbench
///////////////////////////////////////////////////////////////////////////////

module carry_lookahead_adder_tb ();

  parameter WIDTH = 16;

  reg [WIDTH-1:0] r_ADD_1 = 0;
  reg [WIDTH-1:0] r_ADD_2 = 0;
  wire [WIDTH:0]  w_RESULT;
  integer checker_result;

  reg clk = 0;
  integer error_cnt = 0;
  
  carry_lookahead_adder #(.WIDTH(WIDTH)) carry_lookahead_inst
    (
     .i_add1(r_ADD_1),
     .i_add2(r_ADD_2),
     .o_result(w_RESULT)
     );

  initial begin
      forever begin
          #5;
          clk = 1;
          #5;
          clk = 0;
      end
  end

  always @(posedge clk)
      begin
          checker_result = r_ADD_1 + r_ADD_2;
          if(w_RESULT == checker_result) begin
              $display("[%0t ns] [%m/Checker] Info: Sum is correct: r_add1=%0d, r_add2=%0d, result=%0d", $time, r_ADD_1, r_ADD_2, w_RESULT);
          end
          else
          begin
              $display("[%0t ns] [%m/Checker] Error: Sum is incorrect. r_add1=%0d, r_add2=%0d, exp_result=%0d, received result=%0d", $time, r_ADD_1, r_ADD_2,checker_result, w_RESULT );
              error_cnt = error_cnt + 1;
          end
      end

 integer num_of_operations;

  initial
    begin
      num_of_operations = $urandom_range (20, 500);
      $display ("Running %0d operations", num_of_operations);
      while (num_of_operations > 0) begin
          @(negedge clk);   
          std::randomize(r_ADD_1) with {r_ADD_1 dist { [0:10000] :/ 99, [10000:25000] :/ 1};}; 
          std::randomize(r_ADD_2) with {r_ADD_2 dist { [0:10000] :/ 99, [10000:25000]  :/ 1};};
          //$display("[%0t ns] [%m/Stimulus] New values r_add1=%0d, r_add2=%0d", $time, r_ADD_1, r_ADD_2);
          num_of_operations = num_of_operations - 1;
      end
      @(negedge clk); 
      
      if (error_cnt > 0) begin
          $display("Test: FAILED");
      end
      else  begin
        $display("Test: PASSED");
      end
      $finish;
    end

endmodule // carry_lookahead_adder_tb


