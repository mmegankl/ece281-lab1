--+----------------------------------------------------------------------------
--| 
--| COPYRIGHT 2017 United States Air Force Academy All rights reserved.
--| 
--| United States Air Force Academy     __  _______ ___    _________ 
--| Dept of Electrical &               / / / / ___//   |  / ____/   |
--| Computer Engineering              / / / /\__ \/ /| | / /_  / /| |
--| 2354 Fairchild Drive Ste 2F6     / /_/ /___/ / ___ |/ __/ / ___ |
--| USAF Academy, CO 80840           \____//____/_/  |_/_/   /_/  |_|
--| 
--| ---------------------------------------------------------------------------
--|
--| FILENAME      : thirtyOneDayMonth.vhd
--| AUTHOR(S)     : Capt Dan Johnson, Megan Leong
--| CREATED       : 12/12/2019 Last Modified 02/10/2024
--| DESCRIPTION   :  This file implements the thirtyOneDaMonth lab.  Using a 4
--| switch input, the circuit will light up whenever the 4 switches represent a
--| month with 31 days
--|
--|
--+----------------------------------------------------------------------------
--|
--| REQUIRED FILES : 
--|
--|    Libraries : ieee
--|    Packages  : std_logic_1164, numeric_std, unisim
--|    Files     : LIST ANY DEPENDENCIES
--|
--+----------------------------------------------------------------------------
--|
--| NAMING CONVENSIONS :
--|
--|    xb_<port name>           = off-chip bidirectional port ( _pads file )
--|    xi_<port name>           = off-chip input port         ( _pads file )
--|    xo_<port name>           = off-chip output port        ( _pads file )
--|    b_<port name>            = on-chip bidirectional port
--|    i_<port name>            = on-chip input port
--|    o_<port name>            = on-chip output port
--|    c_<signal name>          = combinatorial signal
--|    f_<signal name>          = synchronous signal
--|    ff_<signal name>         = pipeline stage (ff_, fff_, etc.)
--|    <signal name>_n          = active low signal
--|    w_<signal name>          = top level wiring signal
--|    g_<generic name>         = generic
--|    k_<constant name>        = constant
--|    v_<variable name>        = variable
--|    sm_<state machine type>  = state machine type definition
--|    s_<signal name>          = state name
--|
--+----------------------------------------------------------------------------
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;

-- entity name should match filename, this has been filled out for you  
entity thirtyOneDayMonth is 
  port(
	i_A    : in std_logic; -- one of four inputs
	i_B    : in std_logic;
	i_C    : in std_logic;
	i_D    : in std_logic;
	o_Y    : out std_logic	   -- output
  );
end thirtyOneDayMonth;

architecture thirtyOneDayMonth_arch of thirtyOneDayMonth is 
	-- include components declarations and signals
	
	--signals internal to the architecture are declared and initialized such as w_sel
	signal w_sel : std_logic_vector (2 downto 0); -- MUX sel
  
begin
	-- CONCURRENT STATEMENTS---------------------------------------
	--assigning names to reflect original schematics (for ease of understanding if you wish to)
	w_sel(0) <= i_B;	-- one
	--finish assigning signals
	w_sel(1) <= i_C;
	w_sel(2) <= i_D;
	
	--enter your logic here to implement the mux.  See VHDL reference sheet for MUX syntax.
--	entity MUX_8T1 is
--	   port ( SEL : in std_logic_vector(3 downto 0);
--	          i_D :	in std_logic_vector(8 downto 0);
--	          o_Y : out std_logic_vector(0 to 0);
--	end MUX_8T1;
	
--	architecture my_mux of MUX_8T1 is
--	begin
--	   o_Y <= i_D(0) when (SEL = "000") else
--	          i_D(1) when (SEL = "001") else
--	          i_D(2) when (SEL = "010") else
--	          i_D(3) when (SEL = "011") else
--	          (others => '0'); 
--	end my_mux;

-- Code from C3C Komata when the code I attempted to implement did not work. She walked me through it
-- Lt Col Trimble helped me with the following lines 
    with w_sel select
        o_Y <= i_A when "000",
               i_A when "001",
               i_A when "010",
               i_A when "011",
               (NOT i_A) when "100",
               (NOT i_A) when "101",
               (NOT i_A) when "110",
               (NOT i_A) when "111",
               '0' when others;

	---------------------------------------------------------------	
end thirtyOneDayMonth_arch;
