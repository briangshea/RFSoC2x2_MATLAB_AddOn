%%- Passthru Setup Script -------------------------------------------------
%
% set workspace variables for passthru_hdl.slx
clc; 
clear all;
close all; 

%%- Configure Tool Chain --------------------------------------------------
% Uncomment this line and set the correct path to Xilinx Tool chain.

hdlsetuptoolpath('ToolName', 'Xilinx Vivado', 'ToolPath', '/tools/Xilinx/Vivado/2020.2/bin')

%%- Constants & Parameters ------------------------------------------------

SL_FNAME            = 'passthru_hdl.slx';         % Simulink Model Name
SIM.fs              = 300e6;                      % Sampling Rate
SIM.run             = false;                      % Run model?
SIM.modFactor       = 4;                          % Modulation Factor (4 = QPSK)
SIM.stopAfterPacket = 100;                        % Stop After Packet
Ts = 1/SIM.fs;                                    % sampling period


SimTime  = Ts*(2000);  % duration of simulation.

% Data Type Selects
FXPT_DT    = 0;  % fixed point data type
HDL_OPT_DT = 1;  % fixed point data type (reduced bit widths for HDL)
DBL_DT     = 2;  % double data type

%%
%% Open passthru_hdl.slx
%%
open(SL_FNAME)

