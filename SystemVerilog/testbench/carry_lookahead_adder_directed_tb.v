///////////////////////////////////////////////////////////////////////////////
// File Modified from Nandland.com, 
// Added Self Checking Capability to the testbench
///////////////////////////////////////////////////////////////////////////////

module carry_lookahead_adder_tb ();

  parameter WIDTH = 3;

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


  initial
    begin
      @(negedge clk);
      r_ADD_1 = 3'b000;
      r_ADD_2 = 3'b001;
      $display("[%0t ns] [%m/Stimulus] New values r_add1=%0d, r_add2=%0d", $time, r_ADD_1, r_ADD_2);
      @(negedge clk);
      r_ADD_1 = 3'b010;
      r_ADD_2 = 3'b010;
      $display("[%0t ns] [%m/Stimulus] New values r_add1=%0d, r_add2=%0d", $time, r_ADD_1, r_ADD_2);
      @(negedge clk);
      r_ADD_1 = 3'b101;
      r_ADD_2 = 3'b110;
      $display("[%0t ns] [%m/Stimulus] New values r_add1=%0d, r_add2=%0d", $time, r_ADD_1, r_ADD_2);
      @(negedge clk);
      r_ADD_1 = 3'b111;
      r_ADD_2 = 3'b111;
      $display("[%0t ns] [%m/Stimulus] New values r_add1=%0d, r_add2=%0d", $time, r_ADD_1, r_ADD_2);
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


