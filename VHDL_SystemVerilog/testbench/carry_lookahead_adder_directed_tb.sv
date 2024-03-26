///////////////////////////////////////////////////////////////////////////////
// File Modified from Nandland.com,
// Added Self Checking Capability to the testbench
///////////////////////////////////////////////////////////////////////////////


module carry_lookahead_adder_tb ();
  parameter NUM_ITERATIONS = 10;  // Control the number of iterations to run for
  parameter WIDTH = 3;            // adder word width
  parameter VERBOSITY = 1;        // output messages default true
  parameter ADD_ERRORS = 0;       //  error injection enable default false

  reg [WIDTH-1:0] r_ADD_1 = 0;
  reg [WIDTH-1:0] r_ADD_2 = 0;
  wire [WIDTH:0]  w_RESULT;
  integer checker_result;

  // Used to indicate the current loop number
  integer iteration = 0;

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
          // Error injection block, just to cause a failure in the log/wave
          if ((iteration > 0) && (r_ADD_1[2:0] == 3'b111) && ADD_ERRORS) begin: INJECT_ERROR
            // Inject the value not'ed onto the output of the design
            // Yes, trivial way to trigger an error, but hey
            // TODO: Remove this bug from my code
             checker_result = !checker_result;
          end // if
          if(w_RESULT == checker_result && VERBOSITY)
              $display("[%0t ns] [%m/Checker] Info: Sum is correct: r_add1=%0d, r_add2=%0d, result=%0d", $time, r_ADD_1, r_ADD_2, w_RESULT);
          
          if(!(w_RESULT == checker_result)) begin
              $display("[%0t ns] [%m/Checker] Error: Sum is incorrect. r_add1=%0d, r_add2=%0d, exp_result=%0d, received result=%0d", $time, r_ADD_1, r_ADD_2,checker_result, w_RESULT );
              error_cnt = error_cnt + 1;
          end
      end

  initial
    begin
      for (iteration = 0; iteration < NUM_ITERATIONS; iteration++) begin
      for (int op1 = 0; op1 < 2**WIDTH; op1++) begin
        for (int op2 = 0; op2 < 2**WIDTH; op2++) begin
          @(negedge clk);
          r_ADD_1 = op1;
          r_ADD_2 = op2;
          if (VERBOSITY)
            $display("[%0t ns] [%m/Stimulus] New values r_add1=%0d, r_add2=%0d", $time, r_ADD_1, r_ADD_2);
          end // for
        end // for
      end // for
      @(negedge clk);

      if (error_cnt > 0) begin
          $display("Test: FAILED (%0d errors encountered)", error_cnt);
      end
      else  begin
        $display("Test: PASSED (%0d errors encountered)", error_cnt);
      end
      $finish;
    end // initial

endmodule // carry_lookahead_adder_tb
