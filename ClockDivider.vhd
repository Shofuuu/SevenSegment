library ieee;
use ieee.std_logic_1164.all;

entity ClockDivider is
  port(
    clk1hz, clk1khz : out std_logic;
    clkin, reset    : in std_logic
  );
end entity;

architecture RTL of ClockDivider is

  count       : integer := 0;
  clk1hz_out  : std_logic := '0';
  clk1khz_out : std_logic := '0';

begin

  process(clkin, reset)
  begin
    if(reset = '1') then
      count <= 0;
      clk1hz_out <= '0';
    elsif(clkin'event & clkin = '1') then
      count <= count + 1;

      -- Formula fout = ((fosc/n)/2)-1
      -- fosc = external crystal
      -- n = new frequency
      if(count = 24999999) then
        clk1hz_out <= not clk1hz_out;
        count <= 0;
      elsif(count = 24999) then
        clk1khz_out <= not clk1khz_out
      end if;

      clk1hz <= clk1hz_out;
      clk1khz <= clk1khz_out;
    end if;
  end process;

end architecture;
