-------------------------------------------------------------------------------
-- File Downloaded from Nandland.com
-- Added Self Checking Capability to the testbench
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

entity carry_lookahead_adder_tb is
end carry_lookahead_adder_tb;

architecture behave of carry_lookahead_adder_tb is

  constant NUM_ITERATIONS : integer := 10;
  constant c_WIDTH : integer := 3;
  constant CLK_PERIOD : time := 10 ns;

  signal clk : std_logic := '0';
  signal r_ADD_1  : std_logic_vector(c_WIDTH-1 downto 0) := (others => '0');
  signal r_ADD_2  : std_logic_vector(c_WIDTH-1 downto 0) := (others => '0');
  signal w_RESULT : std_logic_vector(c_WIDTH downto 0) := (others => '0');
  signal add_1 : integer := 0;
  signal add_2 : integer := 0;
  signal result : integer := 0;
  signal op1 : integer := 0;
  signal op2 : integer := 0;
  signal iteration : integer := 0;
  signal error_cnt : integer := 0;

  component carry_lookahead_adder is
    generic (
      WIDTH : natural
      );
    port (
      i_add1   : in  std_logic_vector(WIDTH-1 downto 0);
      i_add2   : in  std_logic_vector(WIDTH-1 downto 0);
      --
      o_result : out std_logic_vector(WIDTH downto 0)
      );
  end component carry_lookahead_adder;

begin

  -- Instantiate the Unit Under Test (UUT)
  UUT: carry_lookahead_adder
    generic map (
      WIDTH     => c_WIDTH
      )
    port map (
      i_add1   => r_ADD_1,
      i_add2   => r_ADD_2,
      o_result => w_RESULT
      );

  clk <= not(clk) after CLK_PERIOD;
  add_1 <= to_integer(unsigned(r_ADD_1));
  add_2 <= to_integer(unsigned(r_ADD_2));
  result <= to_integer(unsigned(w_RESULT));

  -- Testbench
  tb: process(clk)
    variable checker_result : integer :=0;
  begin
    if rising_edge(clk) then

      if (iteration < NUM_ITERATIONS) then --for iteration in 0 to NUM_ITERATIONS loop

        if (op1 < 2**c_WIDTH) then --for op1 in 0 to 2**c_WIDTH loop
          if (op2 < 2**c_WIDTH) then --for op2 in 0 to 2**c_WIDTH loop
            r_ADD_1 <= std_logic_vector(to_unsigned(op1, r_ADD_1'length));
            r_ADD_2 <= std_logic_vector(to_unsigned(op2, r_ADD_2'length));
            report "[" & time'image(now) & "] [carry_lookahead_adder_tb/Stimulus] New values: r_add1=" & integer'image(add_1) & ", r_add2=" & integer'image(add_2);
            checker_result := add_1 + add_2;

            -- Error injection block, just to cause a failure in the log/wave
            if ((iteration > 0) and (iteration mod (NUM_ITERATIONS/2) = 0)) then
              -- Inject a bad value onto the output of the design
              -- Yes, trivial way to trigger an error, but hey
              -- TODO: Remove this bug from my code
              -- checker_result := -666;
            end if;

            if (result = checker_result) then
              report "[" & time'image(now) & "] [carry_lookahead_adder_tb/Checker] Info: Sum is correct: r_add1=" & integer'image(add_1) & ", r_add2=" & integer'image(add_2) & ", result=" & integer'image(result);
            else
              report "[" & time'image(now) & "] [carry_lookahead_adder_tb/Checker] Error: Sum is incorrect: r_add1=" & integer'image(add_1) & ", r_add2=" & integer'image(add_2) & ", exp_result=" & integer'image(checker_result) & ", result=" & integer'image(result);
              error_cnt <= error_cnt + 1;
            end if;
            op2 <= op2 + 1;
          end if;
          if (op2 = 2**c_WIDTH) then
            op1 <= op1 + 1;
            op2 <= 0;
          end if;
        end if;

        if (op1 = 2**c_WIDTH) then
          iteration <= iteration + 1;
          op1 <= 0;
        end if;
      end if;

    end if;
  end process tb;

  -- Check for Pass/Fail
  check: process
  begin
    wait until iteration = NUM_ITERATIONS;
    if (error_cnt > 0) then
      report "Test: FAILED (" & integer'image(error_cnt) & " errors encountered)" severity failure;
    else
      report "Test: PASSED (" & integer'image(error_cnt) & " errors encountered)" severity failure;
    end if;
  end process check;

end behave;
