library ieee;
use ieee.std_logic_1164.all;

entity top_vhdl is
  port(
    led, segment : out std_logic_vector (7 downto 0);
    clk          : in std_logic
  );
end entity;

architecture RTL of top_vhdl is

  component ClockDivider
    port(
      clkout       : out std_logic;
      clkin, reset : in std_logic
    );
  end component;

begin
end architecture;
