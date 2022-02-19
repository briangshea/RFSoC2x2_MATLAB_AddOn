%--------------------------------------------------------------------------
% HDL Workflow Script
% Generated with MATLAB 9.9 (R2020b) at 19:59:05 on 28/11/2021
% This script was generated using the following parameter values:
%     Filename  : '/home/brian/Documents/UCSD/capstoneProject/OFDM_SIM_rfsoc/simulink/passthru/hdlworkflow.m'
%     Overwrite : true
%     Comments  : true
%     Headers   : true
%     DUT       : 'passthru_hdl/PASSTHRU'
% To view changes after modifying the workflow, run the following command:
% >> hWC.export('DUT','passthru_hdl/PASSTHRU');
%--------------------------------------------------------------------------

%% Load the Model
load_system('passthru_hdl');

%% Restore the Model to default HDL parameters
%hdlrestoreparams('passthru_hdl/PASSTHRU');

%% Model HDL Parameters
%% Set Model 'passthru_hdl' HDL parameters
hdlset_param('passthru_hdl', 'CriticalPathEstimation', 'on');
hdlset_param('passthru_hdl', 'FloatingPointTargetConfiguration', hdlcoder.createFloatingPointTargetConfig('NativeFloatingPoint' ...
, 'LatencyStrategy', 'MIN',  'HandleDenormals', 'on') ...
);
hdlset_param('passthru_hdl', 'HDLSubsystem', 'passthru_hdl/PASSTHRU');
hdlset_param('passthru_hdl', 'MapPipelineDelaysToRAM', 'on');
hdlset_param('passthru_hdl', 'OptimizationReport', 'on');
hdlset_param('passthru_hdl', 'ReferenceDesign', 'Receiver Only');
hdlset_param('passthru_hdl', 'ReferenceDesignParameter', {'boardName','rfsoc 2x2','project','rfsoc_2x2','variant','rx','sharedFolder','/home/brian/projects/RFSoC2x2_MATLAB_AddOn/toolbox/shared/sdr/platform/derived/common/+sdr/+internal/+hdlwa/+vivado/+ip/+BGS','adc0_enable','true','adc0_axis_mode','both','adc0_axis_master_width','128','adc0_axis_slave_width','128','adc2_enable','true','adc2_axis_mode','both','adc2_axis_master_width','128','adc2_axis_slave_width','128','enable_adc_nco','true','dac0_enable','true','dac0_axis_mode','both','dac0_axis_slave_width','128','dac0_axis_master_width','128','dac1_enable','true','dac1_axis_mode','both','dac1_axis_slave_width','128','dac1_axis_master_width','128','enable_dac_nco','true','HDLVerifierJTAGAXI','off'});
hdlset_param('passthru_hdl', 'ResetType', 'Synchronous');
hdlset_param('passthru_hdl', 'ResourceReport', 'on');
hdlset_param('passthru_hdl', 'SynthesisTool', 'Xilinx Vivado');
hdlset_param('passthru_hdl', 'SynthesisToolChipFamily', 'Zynq UltraScale+ RFSoC');
hdlset_param('passthru_hdl', 'SynthesisToolDeviceName', 'xczu28dr-ffvg1517-2-e');
hdlset_param('passthru_hdl', 'SynthesisToolPackageName', '');
hdlset_param('passthru_hdl', 'SynthesisToolSpeedValue', '');
hdlset_param('passthru_hdl', 'TargetDirectory', 'hdl_prj/hdlsrc');
hdlset_param('passthru_hdl', 'TargetFrequency', 300);
hdlset_param('passthru_hdl', 'TargetLanguage', 'Verilog');
hdlset_param('passthru_hdl', 'TargetPlatform', 'RFSoC 2x2');
hdlset_param('passthru_hdl', 'UseSingleLibrary', 'on');
hdlset_param('passthru_hdl', 'Workflow', 'IP Core Generation');

% Set SubSystem HDL parameters
hdlset_param('passthru_hdl/PASSTHRU', 'AXI4SlaveIDWidth', '12');
hdlset_param('passthru_hdl/PASSTHRU', 'IPCoreName', 'OFDM_RCVR_ip');
hdlset_param('passthru_hdl/PASSTHRU', 'IPCoreVersion', '1.0');
hdlset_param('passthru_hdl/PASSTHRU', 'ProcessorFPGASynchronization', 'Free running');

% Set Inport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/adc0_in_re', 'IOInterface', 'ADC0 RE Slave');
hdlset_param('passthru_hdl/PASSTHRU/adc0_in_re', 'IOInterfaceMapping', 'Data');

% Set Inport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/adc0_in_re_vld', 'IOInterface', 'ADC0 RE Slave');
hdlset_param('passthru_hdl/PASSTHRU/adc0_in_re_vld', 'IOInterfaceMapping', 'Valid');

% Set Inport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/adc0_out_re_rdy', 'IOInterface', 'ADC0 RE Master');
hdlset_param('passthru_hdl/PASSTHRU/adc0_out_re_rdy', 'IOInterfaceMapping', 'Ready (optional)');

% Set Inport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/adc0_in_im', 'IOInterface', 'ADC0 IM Slave');
hdlset_param('passthru_hdl/PASSTHRU/adc0_in_im', 'IOInterfaceMapping', 'Data');

% Set Inport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/adc0_in_im_vld', 'IOInterface', 'ADC0 IM Slave');
hdlset_param('passthru_hdl/PASSTHRU/adc0_in_im_vld', 'IOInterfaceMapping', 'Valid');

% Set Inport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/adc0_out_im_rdy', 'IOInterface', 'ADC0 IM Master');
hdlset_param('passthru_hdl/PASSTHRU/adc0_out_im_rdy', 'IOInterfaceMapping', 'Ready (optional)');

% Set Inport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/adc2_in_re', 'IOInterface', 'ADC2 RE Slave');
hdlset_param('passthru_hdl/PASSTHRU/adc2_in_re', 'IOInterfaceMapping', 'Data');

% Set Inport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/adc2_in_re_vld', 'IOInterface', 'ADC2 RE Slave');
hdlset_param('passthru_hdl/PASSTHRU/adc2_in_re_vld', 'IOInterfaceMapping', 'Valid');

% Set Inport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/adc2_out_re_rdy', 'IOInterface', 'ADC2 RE Master');
hdlset_param('passthru_hdl/PASSTHRU/adc2_out_re_rdy', 'IOInterfaceMapping', 'Ready (optional)');

% Set Inport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/adc2_in_im', 'IOInterface', 'ADC2 IM Slave');
hdlset_param('passthru_hdl/PASSTHRU/adc2_in_im', 'IOInterfaceMapping', 'Data');

% Set Inport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/adc2_in_im_vld', 'IOInterface', 'ADC2 IM Slave');
hdlset_param('passthru_hdl/PASSTHRU/adc2_in_im_vld', 'IOInterfaceMapping', 'Valid');

% Set Inport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/adc2_out_im_rdy', 'IOInterface', 'ADC2 IM Master');
hdlset_param('passthru_hdl/PASSTHRU/adc2_out_im_rdy', 'IOInterfaceMapping', 'Ready (optional)');

% Set Inport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/dac0_re_in', 'IOInterface', 'DAC0 RE Slave');
hdlset_param('passthru_hdl/PASSTHRU/dac0_re_in', 'IOInterfaceMapping', 'Data');

% Set Inport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/dac0_re_vld_in', 'IOInterface', 'DAC0 RE Slave');
hdlset_param('passthru_hdl/PASSTHRU/dac0_re_vld_in', 'IOInterfaceMapping', 'Valid');

% Set Inport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/dac0_out_re_rdy', 'IOInterface', 'DAC0 RE Master');
hdlset_param('passthru_hdl/PASSTHRU/dac0_out_re_rdy', 'IOInterfaceMapping', 'Ready (optional)');

% Set Inport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/dac0_im_in', 'IOInterface', 'DAC0 IM Slave');
hdlset_param('passthru_hdl/PASSTHRU/dac0_im_in', 'IOInterfaceMapping', 'Data');

% Set Inport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/dac0_re_vld_in1', 'IOInterface', 'DAC0 IM Slave');
hdlset_param('passthru_hdl/PASSTHRU/dac0_re_vld_in1', 'IOInterfaceMapping', 'Valid');

% Set Inport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/dac0_out_im_rdy', 'IOInterface', 'DAC0 IM Master');
hdlset_param('passthru_hdl/PASSTHRU/dac0_out_im_rdy', 'IOInterfaceMapping', 'Ready (optional)');

% Set Inport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/dac1_re_in', 'IOInterface', 'DAC1 RE Slave');
hdlset_param('passthru_hdl/PASSTHRU/dac1_re_in', 'IOInterfaceMapping', 'Data');

% Set Inport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/dac1_re_vld', 'IOInterface', 'DAC1 RE Slave');
hdlset_param('passthru_hdl/PASSTHRU/dac1_re_vld', 'IOInterfaceMapping', 'Valid');

% Set Inport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/dac1_out_re_rdy', 'IOInterface', 'DAC1 RE Master');
hdlset_param('passthru_hdl/PASSTHRU/dac1_out_re_rdy', 'IOInterfaceMapping', 'Ready (optional)');

% Set Inport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/dac1_im_in', 'IOInterface', 'DAC1 IM Slave');
hdlset_param('passthru_hdl/PASSTHRU/dac1_im_in', 'IOInterfaceMapping', 'Data');

% Set Inport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/dac1_im_vld_in', 'IOInterface', 'DAC1 IM Slave');
hdlset_param('passthru_hdl/PASSTHRU/dac1_im_vld_in', 'IOInterfaceMapping', 'Valid');

% Set Inport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/dac1_out_im_rdy', 'IOInterface', 'DAC1 IM Master');
hdlset_param('passthru_hdl/PASSTHRU/dac1_out_im_rdy', 'IOInterfaceMapping', 'Ready (optional)');

% Set Inport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/switches', 'IOInterface', 'DIP Switches [0:3]');
hdlset_param('passthru_hdl/PASSTHRU/switches', 'IOInterfaceMapping', '[0:3]');

% Set Inport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/adc0_nco_update_busy', 'IOInterface', 'ADC0 NCO Update Busy');
hdlset_param('passthru_hdl/PASSTHRU/adc0_nco_update_busy', 'IOInterfaceMapping', '[0]');

% Set Inport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/adc2_nco_update_busy', 'IOInterface', 'ADC2 NCO Update Busy');
hdlset_param('passthru_hdl/PASSTHRU/adc2_nco_update_busy', 'IOInterfaceMapping', '[0]');

% Set Inport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/dac0_nco_update_busy', 'IOInterface', 'DAC0 NCO Update Busy');
hdlset_param('passthru_hdl/PASSTHRU/dac0_nco_update_busy', 'IOInterfaceMapping', '[0]');

% Set Inport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/dac1_nco_update_busy', 'IOInterface', 'DAC1 NCO Update Busy');
hdlset_param('passthru_hdl/PASSTHRU/dac1_nco_update_busy', 'IOInterfaceMapping', '[0]');

% Set Inport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/adc0_freq_upper', 'IOInterface', 'AXI4-Lite');
hdlset_param('passthru_hdl/PASSTHRU/adc0_freq_upper', 'IOInterfaceMapping', 'x"100"');

% Set Inport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/adc0_freq_lower', 'IOInterface', 'AXI4-Lite');
hdlset_param('passthru_hdl/PASSTHRU/adc0_freq_lower', 'IOInterfaceMapping', 'x"104"');

% Set Inport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/adc0_phase', 'IOInterface', 'AXI4-Lite');
hdlset_param('passthru_hdl/PASSTHRU/adc0_phase', 'IOInterfaceMapping', 'x"108"');

% Set Inport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/adc0_update', 'IOInterface', 'AXI4-Lite');
hdlset_param('passthru_hdl/PASSTHRU/adc0_update', 'IOInterfaceMapping', 'x"10C"');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/adc0_out_re', 'IOInterface', 'ADC0 RE Master');
hdlset_param('passthru_hdl/PASSTHRU/adc0_out_re', 'IOInterfaceMapping', 'Data');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/adc0_out_re_vld', 'IOInterface', 'ADC0 RE Master');
hdlset_param('passthru_hdl/PASSTHRU/adc0_out_re_vld', 'IOInterfaceMapping', 'Valid');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/adc0_in_re_rdy', 'IOInterface', 'ADC0 RE Slave');
hdlset_param('passthru_hdl/PASSTHRU/adc0_in_re_rdy', 'IOInterfaceMapping', 'Ready (optional)');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/adc0_out_im', 'IOInterface', 'ADC0 IM Master');
hdlset_param('passthru_hdl/PASSTHRU/adc0_out_im', 'IOInterfaceMapping', 'Data');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/adc0_out_im_vld', 'IOInterface', 'ADC0 IM Master');
hdlset_param('passthru_hdl/PASSTHRU/adc0_out_im_vld', 'IOInterfaceMapping', 'Valid');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/adc0_in_im_rdy', 'IOInterface', 'ADC0 IM Slave');
hdlset_param('passthru_hdl/PASSTHRU/adc0_in_im_rdy', 'IOInterfaceMapping', 'Ready (optional)');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/adc2_out_re', 'IOInterface', 'ADC2 RE Master');
hdlset_param('passthru_hdl/PASSTHRU/adc2_out_re', 'IOInterfaceMapping', 'Data');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/adc2_out_re_vld', 'IOInterface', 'ADC2 RE Master');
hdlset_param('passthru_hdl/PASSTHRU/adc2_out_re_vld', 'IOInterfaceMapping', 'Valid');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/adc2_in_re_rdy', 'IOInterface', 'ADC2 RE Slave');
hdlset_param('passthru_hdl/PASSTHRU/adc2_in_re_rdy', 'IOInterfaceMapping', 'Ready (optional)');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/adc2_out_im', 'IOInterface', 'ADC2 IM Master');
hdlset_param('passthru_hdl/PASSTHRU/adc2_out_im', 'IOInterfaceMapping', 'Data');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/adc2_out_im_vld', 'IOInterface', 'ADC2 IM Master');
hdlset_param('passthru_hdl/PASSTHRU/adc2_out_im_vld', 'IOInterfaceMapping', 'Valid');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/adc2_in_im_rdy', 'IOInterface', 'ADC2 IM Slave');
hdlset_param('passthru_hdl/PASSTHRU/adc2_in_im_rdy', 'IOInterfaceMapping', 'Ready (optional)');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/dac0_re_out', 'IOInterface', 'DAC0 RE Master');
hdlset_param('passthru_hdl/PASSTHRU/dac0_re_out', 'IOInterfaceMapping', 'Data');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/dac0_re_vld_out', 'IOInterface', 'DAC0 RE Master');
hdlset_param('passthru_hdl/PASSTHRU/dac0_re_vld_out', 'IOInterfaceMapping', 'Valid');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/dac0_in_re_rdy', 'IOInterface', 'DAC0 RE Slave');
hdlset_param('passthru_hdl/PASSTHRU/dac0_in_re_rdy', 'IOInterfaceMapping', 'Ready (optional)');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/dac0_im_out', 'IOInterface', 'DAC0 IM Master');
hdlset_param('passthru_hdl/PASSTHRU/dac0_im_out', 'IOInterfaceMapping', 'Data');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/dac0_re_vld_out1', 'IOInterface', 'DAC0 IM Master');
hdlset_param('passthru_hdl/PASSTHRU/dac0_re_vld_out1', 'IOInterfaceMapping', 'Valid');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/dac0_in_im_rdy', 'IOInterface', 'DAC0 IM Slave');
hdlset_param('passthru_hdl/PASSTHRU/dac0_in_im_rdy', 'IOInterfaceMapping', 'Ready (optional)');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/dac1_re_out', 'IOInterface', 'DAC1 RE Master');
hdlset_param('passthru_hdl/PASSTHRU/dac1_re_out', 'IOInterfaceMapping', 'Data');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/dac1_vld_out', 'IOInterface', 'DAC1 RE Master');
hdlset_param('passthru_hdl/PASSTHRU/dac1_vld_out', 'IOInterfaceMapping', 'Valid');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/dac1_in_re_rdy', 'IOInterface', 'DAC1 RE Slave');
hdlset_param('passthru_hdl/PASSTHRU/dac1_in_re_rdy', 'IOInterfaceMapping', 'Ready (optional)');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/dac1_im_out', 'IOInterface', 'DAC1 IM Master');
hdlset_param('passthru_hdl/PASSTHRU/dac1_im_out', 'IOInterfaceMapping', 'Data');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/dac1_im_vld_out', 'IOInterface', 'DAC1 IM Master');
hdlset_param('passthru_hdl/PASSTHRU/dac1_im_vld_out', 'IOInterfaceMapping', 'Valid');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/dac1_in_im_rdy', 'IOInterface', 'DAC1 IM Slave');
hdlset_param('passthru_hdl/PASSTHRU/dac1_in_im_rdy', 'IOInterfaceMapping', 'Ready (optional)');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/leds', 'IOInterface', 'LEDs General Purpose [0:3]');
hdlset_param('passthru_hdl/PASSTHRU/leds', 'IOInterfaceMapping', '[0:3]');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/adc0_nco_freq', 'IOInterface', 'ADC0 Ch0 NCO Frequency [0:47]');
hdlset_param('passthru_hdl/PASSTHRU/adc0_nco_freq', 'IOInterfaceMapping', '[0:47]');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/adc0_nco_phase', 'IOInterface', 'ADC0 Ch0 NCO Phase [0:17]');
hdlset_param('passthru_hdl/PASSTHRU/adc0_nco_phase', 'IOInterfaceMapping', '[0:17]');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/adc0_nco_phase_rst', 'IOInterface', 'ADC0 Ch0 NCO Phase Reset');
hdlset_param('passthru_hdl/PASSTHRU/adc0_nco_phase_rst', 'IOInterfaceMapping', '[0]');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/adc0_nco_update_en', 'IOInterface', 'ADC0 Ch0 NCO Update Enable [0:5]');
hdlset_param('passthru_hdl/PASSTHRU/adc0_nco_update_en', 'IOInterfaceMapping', '[0:5]');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/adc0_nco_update_req', 'IOInterface', 'ADC0 NCO Update Request');
hdlset_param('passthru_hdl/PASSTHRU/adc0_nco_update_req', 'IOInterfaceMapping', '[0]');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/adc2_nco_freq', 'IOInterface', 'ADC2 Ch0 NCO Frequency [0:47]');
hdlset_param('passthru_hdl/PASSTHRU/adc2_nco_freq', 'IOInterfaceMapping', '[0:47]');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/adc2_nco_phase', 'IOInterface', 'ADC2 Ch0 NCO Phase [0:17]');
hdlset_param('passthru_hdl/PASSTHRU/adc2_nco_phase', 'IOInterfaceMapping', '[0:17]');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/adc2_nco_phase_rst', 'IOInterface', 'ADC2 Ch0 NCO Phase Reset');
hdlset_param('passthru_hdl/PASSTHRU/adc2_nco_phase_rst', 'IOInterfaceMapping', '[0]');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/adc2_nco_update_en', 'IOInterface', 'ADC2 Ch0 NCO Update Enable [0:5]');
hdlset_param('passthru_hdl/PASSTHRU/adc2_nco_update_en', 'IOInterfaceMapping', '[0:5]');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/adc2_nco_update_req', 'IOInterface', 'ADC2 NCO Update Request');
hdlset_param('passthru_hdl/PASSTHRU/adc2_nco_update_req', 'IOInterfaceMapping', '[0]');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/dac0_nco_freq', 'IOInterface', 'DAC0 Ch0 NCO Frequency [0:47]');
hdlset_param('passthru_hdl/PASSTHRU/dac0_nco_freq', 'IOInterfaceMapping', '[0:47]');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/dac0_nco_phase', 'IOInterface', 'DAC0 Ch0 NCO Phase [0:17]');
hdlset_param('passthru_hdl/PASSTHRU/dac0_nco_phase', 'IOInterfaceMapping', '[0:17]');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/dac0_nco_phase_rst', 'IOInterface', 'DAC0 Ch0 NCO Phase Reset');
hdlset_param('passthru_hdl/PASSTHRU/dac0_nco_phase_rst', 'IOInterfaceMapping', '[0]');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/dac0_nco_update_en', 'IOInterface', 'DAC0 Ch0 NCO Update Enable [0:5]');
hdlset_param('passthru_hdl/PASSTHRU/dac0_nco_update_en', 'IOInterfaceMapping', '[0:5]');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/dac0_nco_update_req', 'IOInterface', 'DAC0 NCO Update Request');
hdlset_param('passthru_hdl/PASSTHRU/dac0_nco_update_req', 'IOInterfaceMapping', '[0]');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/dac1_nco_freq', 'IOInterface', 'DAC1 Ch0 NCO Frequency [0:47]');
hdlset_param('passthru_hdl/PASSTHRU/dac1_nco_freq', 'IOInterfaceMapping', '[0:47]');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/dac1_nco_phase', 'IOInterface', 'DAC1 Ch0 NCO Phase [0:17]');
hdlset_param('passthru_hdl/PASSTHRU/dac1_nco_phase', 'IOInterfaceMapping', '[0:17]');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/dac1_nco_phase_rst', 'IOInterface', 'DAC1 Ch0 NCO Phase Reset');
hdlset_param('passthru_hdl/PASSTHRU/dac1_nco_phase_rst', 'IOInterfaceMapping', '[0]');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/dac1_nco_update_en', 'IOInterface', 'DAC1 Ch0 NCO Update Enable [0:5]');
hdlset_param('passthru_hdl/PASSTHRU/dac1_nco_update_en', 'IOInterfaceMapping', '[0:5]');

% Set Outport HDL parameters
hdlset_param('passthru_hdl/PASSTHRU/dac1_nco_update_req', 'IOInterface', 'DAC1 NCO Update Request');
hdlset_param('passthru_hdl/PASSTHRU/dac1_nco_update_req', 'IOInterfaceMapping', '[0]');


%% Workflow Configuration Settings
% Construct the Workflow Configuration Object with default settings
hWC = hdlcoder.WorkflowConfig('SynthesisTool','Xilinx Vivado','TargetWorkflow','IP Core Generation');

% Specify the top level project directory
hWC.ProjectFolder = 'hdl_prj';
hWC.ReferenceDesignToolVersion = '2020.2';
hWC.IgnoreToolVersionMismatch = false;

% Set Workflow tasks to run
hWC.RunTaskGenerateRTLCodeAndIPCore = true;
hWC.RunTaskCreateProject = true;
hWC.RunTaskGenerateSoftwareInterface = true;
hWC.RunTaskBuildFPGABitstream = true;
hWC.RunTaskProgramTargetDevice = false;

% Set properties related to 'RunTaskGenerateRTLCodeAndIPCore' Task
hWC.IPCoreRepository = '';
hWC.GenerateIPCoreReport = true;

% Set properties related to 'RunTaskCreateProject' Task
hWC.Objective = hdlcoder.Objective.None;
hWC.AdditionalProjectCreationTclFiles = '';
hWC.EnableIPCaching = true;

% Set properties related to 'RunTaskGenerateSoftwareInterface' Task
hWC.GenerateSoftwareInterfaceModel = true;
hWC.OperatingSystem = 'Linux';
hWC.GenerateSoftwareInterfaceScript = true;

% Set properties related to 'RunTaskBuildFPGABitstream' Task
hWC.RunExternalBuild = true;
hWC.TclFileForSynthesisBuild = hdlcoder.BuildOption.Default;
hWC.CustomBuildTclFile = '';

% Set properties related to 'RunTaskProgramTargetDevice' Task
hWC.ProgrammingMethod = hdlcoder.ProgrammingMethod.Download;
hWC.IPAddress = '192.168.3.5';
hWC.SSHUsername = 'root';
hWC.SSHPassword = '****';

% Validate the Workflow Configuration Object
hWC.validate;

%% Run the workflow
hdlcoder.runWorkflow('passthru_hdl/PASSTHRU', hWC);
