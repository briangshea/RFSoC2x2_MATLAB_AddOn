library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity axi4_stream_synchonizer is
	generic (
		-- Parameters of Axi Slave Bus Interfaces
		C_AXIS_TDATA_WIDTH	    : integer	:= 128
	);
	port (

        -- This IP expects all streams to opearate at the same clock
        ACLK	        : in std_logic;
		ARESETN	        : in std_logic;
		
		-- Ports of Axi Slave Bus Interface S00_AXIS
		S00_AXIS_TREADY	: out std_logic;
		S00_AXIS_TDATA	: in std_logic_vector(C_AXIS_TDATA_WIDTH-1 downto 0);
		S00_AXIS_TLAST	: in std_logic;
		S00_AXIS_TVALID	: in std_logic;

		-- Ports of Axi Slave Bus Interface S01_AXIS
		S01_AXIS_TREADY	: out std_logic;
		S01_AXIS_TDATA	: in std_logic_vector(C_AXIS_TDATA_WIDTH-1 downto 0);
		S01_AXIS_TLAST	: in std_logic;
		S01_AXIS_TVALID	: in std_logic;

		-- Ports of Axi Master Bus Interface M00_AXIS
		M00_AXIS_TVALID	: out std_logic;
		M00_AXIS_TDATA  : out std_logic_vector(C_AXIS_TDATA_WIDTH-1 downto 0);
		M00_AXIS_TLAST	: out std_logic;
		M00_AXIS_TREADY	: in std_logic;
		
		-- Ports of Axi Master Bus Interface M01_AXIS
		M01_AXIS_TVALID	: out std_logic;
		M01_AXIS_TDATA  : out std_logic_vector(C_AXIS_TDATA_WIDTH-1 downto 0);
		M01_AXIS_TLAST	: out std_logic;
		M01_AXIS_TREADY	: in std_logic
	);
end axi4_stream_synchonizer;

architecture rtl of axi4_stream_synchonizer is
    signal all_masters_ready : std_logic;
    signal all_slaves_valid  : std_logic;
begin
              
    all_masters_ready <= M01_AXIS_TREADY and M00_AXIS_TREADY;
    all_slaves_valid  <= S01_AXIS_TVALID and S00_AXIS_TVALID;
    
    S00_AXIS_TREADY <= all_masters_ready and all_slaves_valid and ARESETN;
    S01_AXIS_TREADY <= all_masters_ready and all_slaves_valid and ARESETN;
    
    M00_AXIS_TDATA  <= S00_AXIS_TDATA;
    M00_AXIS_TVALID <= all_masters_ready and all_slaves_valid and ARESETN;
    M00_AXIS_TLAST  <= S00_AXIS_TLAST;
    
    M01_AXIS_TDATA  <= S01_AXIS_TDATA;
    M01_AXIS_TVALID <= all_masters_ready and all_slaves_valid and ARESETN;
    M01_AXIS_TLAST  <= S01_AXIS_TLAST;    
    
end rtl;
