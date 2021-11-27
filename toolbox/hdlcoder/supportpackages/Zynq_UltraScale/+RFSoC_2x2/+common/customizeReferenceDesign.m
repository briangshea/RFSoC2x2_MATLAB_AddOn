% Callback function to control AXI Master and AXI4 interface information dynamically

function customizeReferenceDesign(infoStruct)
%% Reference design callback run at the end of the task Set Target Reference Design
%
% infoStruct: information in structure format
% infoStruct.ReferenceDesignObject: current reference design registration object
% infoStruct.BoardObject: current board registration object
% infoStruct.ParameterStruct: custom parameters of the current reference design, in struct format
% infoStruct.HDLModelDutPath: the block path to the HDL DUT subsystem
% infoStruct.ReferenceDesignToolVersion: Reference design Tool Version set in 1.2 Task

hRD = infoStruct.ReferenceDesignObject;
config = infoStruct.ParameterStruct;

%% Configure ADC0
if( strcmpi(config.adc0_enable, 'true') )
    adc0.Enabled = true;
    
    switch(config.adc0_axis_mode)
        case 'both'
            adc0.MasterEn = true;
            adc0.SlaveEn = true;
        case 'slave only'
            adc0.SlaveEn = true;
        case 'master only'
            adc0.MasterEn = true;
    end
    
    switch(config.adc0_axis_master_width)
        case '8'
            adc0.MasterWidth = 8;
        case '16'
            adc0.MasterWidth = 16;
        case '32'
            adc0.MasterWidth = 32;
        case '64'
            adc0.MasterWidth = 64;
        case '128'
            adc0.MasterWidth = 128;
        otherwise
            error("Unsupported Master Bus Width: %s", adc0.MasterWidth);
    end
    
    switch(config.adc0_axis_slave_width)
        case '8'
            adc0.SlaveWidth = 8;
        case '16'
            adc0.SlaveWidth = 16;
        case '32'
            adc0.SlaveWidth = 32;
        case '64'
            adc0.SlaveWidth = 64;
        case '128'
            adc0.SlaveWidth = 128;
        otherwise
            error("Unsupported Slave Bus Width: %s", adc0.SlaveWidth);
    end
    
    if( strcmpi(config.enable_adc_nco, 'true') )
        adc0.NCOEnabled = true;
    else
        adc0.NCOEnabled = false;
    end
else
    adc0.Enabled = false;
end

%% Configure ADC2
if( strcmpi(config.adc2_enable, 'true') )
    adc2.Enabled = true;
    
    switch(config.adc2_axis_mode)
        case 'both'
            adc2.MasterEn = true;
            adc2.SlaveEn = true;
        case 'slave only'
            adc2.SlaveEn = true;
        case 'master only'
            adc2.MasterEn = true;
    end
    
    switch(config.adc2_axis_master_width)
        case '8'
            adc2.MasterWidth = 8;
        case '16'
            adc2.MasterWidth = 16;
        case '32'
            adc2.MasterWidth = 32;
        case '64'
            adc2.MasterWidth = 64;
        case '128'
            adc2.MasterWidth = 128;
        otherwise
            error("Unsupported Master Bus Width: %s", adc2.MasterWidth);
    end
    
    switch(config.adc2_axis_slave_width)
        case '8'
            adc2.SlaveWidth = 8;
        case '16'
            adc2.SlaveWidth = 16;
        case '32'
            adc2.SlaveWidth = 32;
        case '64'
            adc2.SlaveWidth = 64;
        case '128'
            adc2.SlaveWidth = 128;
        otherwise
            error("Unsupported Slave Bus Width: %s", adc2.SlaveWidth);
    end
    
    if( strcmpi(config.enable_adc_nco, 'true') )
        adc2.NCOEnabled = true;
    else
        adc2.NCOEnabled = false;
    end
else
    adc2.Enabled = false;
end

%% Customize Channels
RFSoC_2x2.common.ADC.Channel.customize(hRD, 0, adc0);
RFSoC_2x2.common.ADC.Channel.customize(hRD, 2, adc2);

%% DAC Channel Configuration

%RFSoC_2x2.common.DAC.Channel.customize(hRD, 0, dac0);
%RFSoC_2x2.common.DAC.Channel.customize(hRD, 2, dac2);
