function hRD = plugin_rd(varargin)
% Reference design definition
% Copyright Brian G. Shea (bshea@eng.ucsd.edu)
% REQUIRES: Communications Toolbox Support Package for Xilinx Zynq-Based Radio

toolVersion = '2020.2';

p = inputParser;
p.addParameter('Board',   'RFSoC 2x2');
p.addParameter('Project', 'RFSoC_2x2');
p.addParameter('Variant', 'rx');

p.parse(varargin{:});
config = p.Results;

switch(lower(config.Board))
    case 'rfsoc 2x2'
        boardName='RFSoC 2x2';
        boardPath='rfsoc2x2';
        vivadoBoard='xilinx.com:rfsoc2x2:part0:1.1';
    otherwise
        error("Unsupported Board: '%s'", config.Board);
end

% Construct reference design object
hRD = hdlcoder.ReferenceDesign('SynthesisTool', 'Xilinx Vivado');

switch(lower(config.Variant))
    case 'rx'
        hRD.ReferenceDesignName = ['Receiver Only (Vivado ' toolVersion ')'];
    case 'rxtx'
        hRD.ReferenceDesignName = ['Receiver & Transmitter (Vivado ' toolVersion ')'];
    case 'tx'
        hRD.ReferenceDesignName = ['Transmitter Only (Vivado ' toolVersion ')'];
    otherwise
        error("Unsupported Board Variant: %s", config.Variant);
end

% Tool information
hRD.SupportedToolVersion = {toolVersion};

hRD.BoardName = boardName;

base_iplist = ['sdr.internal.hdlwa.vivado.v' replace(toolVersion, '.', '_') '.ip.BGS.hdlcoder_base_iplist'];
sharedFolder = fileparts(which(base_iplist));

% Shared Design Files
hRD.SharedRD = true;
hRD.SharedRDFolder = sharedFolder;


% Add IP Repository
hRD.addIPRepository(...
    'IPListFunction',  base_iplist,...
    'NotExistMessage', 'IP repository not found');

%% Add custom design files
% add custom Vivado design
hRD.addCustomVivadoDesign( ...
    'CustomBlockDesignTcl', fullfile('board', boardPath, 'base_bd.tcl'), ...
    'CustomTopLevelHDL',    fullfile('board', boardPath, 'base_wrapper.v'), ...
    'VivadoBoardPart',      vivadoBoard);

hRD.BlockDesignName = 'base';
hRD.CustomUpdateProjTcl = fullfile('common', 'system_cleanup.tcl');

hRD.CustomConstraints = {fullfile('board', boardPath, 'base.xdc')};

sdr.internal.hdlwa.addFixedParameter(hRD, 'boardName',    lower(config.Board));
sdr.internal.hdlwa.addFixedParameter(hRD, 'project',      lower(config.Project));
sdr.internal.hdlwa.addFixedParameter(hRD, 'variant',      lower(config.Variant));
sdr.internal.hdlwa.addFixedParameter(hRD, 'sharedFolder', sharedFolder);

% Add ADC0 and ADC2 Port Parameters
RFSoC_2x2.common.ADC.Channel.addParameters(hRD, 0);
RFSoC_2x2.common.ADC.Channel.addParameters(hRD, 2);

% Add Enable ADC NCO Parameter
hRD.addParameter(...
    'ParameterID',   'enable_adc_nco', ...
    'DisplayName',   'Enable ADC NCO Ports', ...
    'DefaultValue',  'false', ...
    'ParameterType', hdlcoder.ParameterType.Dropdown, ...
    'Choice',        {'false', 'true'}...
    );

% Add Enable ADC RTS Parameter
hRD.addParameter(...
    'ParameterID',   'enable_adc_rts', ...
    'DisplayName',   'Enable ADC RTS Ports', ...
    'DefaultValue',  'false', ...
    'ParameterType', hdlcoder.ParameterType.Dropdown, ...
    'Choice',        {'false', 'true'}...
    );


%% Add DAC Configuration
RFSoC_2x2.common.DAC.Channel.addParameters(hRD, 0);
RFSoC_2x2.common.DAC.Channel.addParameters(hRD, 1);

% Add Enable ADC NCO Parameter
hRD.addParameter(...
    'ParameterID',   'enable_dac_nco', ...
    'DisplayName',   'Enable DAC NCO Ports', ...
    'DefaultValue',  'false', ...
    'ParameterType', hdlcoder.ParameterType.Dropdown, ...
    'Choice',        {'false', 'true'}...
    );

% Add Enable DAC RTS Parameter
hRD.addParameter(...
    'ParameterID',   'enable_dac_rts', ...
    'DisplayName',   'Enable DAC RTS Ports', ...
    'DefaultValue',  'false', ...
    'ParameterType', hdlcoder.ParameterType.Dropdown, ...
    'Choice',        {'false', 'true'}...
    );

%% Register Customization Callback for Design
hRD.CustomizeReferenceDesignFcn = @RFSoC_2x2.common.customizeReferenceDesign;

%% Add interfaces
% add clock interface
hRD.addClockInterface( ...
    'ClockConnection',     'zynq_ultra_ps_e_0/pl_clk1', ...
    'ResetConnection',     'proc_sys_reset_1/peripheral_aresetn',...
    'DefaultFrequencyMHz', 300,...
    'MinFrequencyMHz',     300,...
    'MaxFrequencyMHz',     300 ...
    %{ 
    'ClockModuleInstance', 'clk_wiz_0',...
    'ClockNumber',         1 ...
    %}
    );  

% add AXI4 and AXI4-Lite slave interfaces
hRD.addAXI4SlaveInterface( ...
    'InterfaceConnection',      'axi_clk_conv_0/M_AXI', ...
    'BaseAddress',              '0x00B0200000', ...
    'MasterAddressSpace',       'zynq_ultra_ps_e_0/Data');

hRD.DeviceTreeName = 'devicetree_axilite_iio.dtb';

% LocalWords:  Zynq ZC vlnv xilinx zynq zc AXI axi Addr wiz aresetn IPCORE
% LocalWords:  avnet devicetree axilite dtb Vivado
