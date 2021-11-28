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

%% Customize ADC Channels
RFSoC_2x2.common.ADC.Channel.customize(hRD, 0, adc0);
RFSoC_2x2.common.ADC.Channel.customize(hRD, 2, adc2);

%% DAC Channel Configuration
%% Configure DAC0
if( strcmpi(config.dac0_enable, 'true') )
    dac0.Enabled = true;
    
    switch(config.dac0_axis_mode)
        case 'both'
            dac0.MasterEn = true;
            dac0.SlaveEn = true;
        case 'slave only'
            dac0.SlaveEn = true;
        case 'master only'
            dac0.MasterEn = true;
    end
    
    switch(config.dac0_axis_master_width)
        case '8'
            dac0.MasterWidth = 8;
        case '16'
            dac0.MasterWidth = 16;
        case '32'
            dac0.MasterWidth = 32;
        case '64'
            dac0.MasterWidth = 64;
        case '128'
            dac0.MasterWidth = 128;
        otherwise
            error("Unsupported Master Bus Width: %s", dac0.MasterWidth);
    end
    
    switch(config.dac0_axis_slave_width)
        case '8'
            dac0.SlaveWidth = 8;
        case '16'
            dac0.SlaveWidth = 16;
        case '32'
            dac0.SlaveWidth = 32;
        case '64'
            dac0.SlaveWidth = 64;
        case '128'
            dac0.SlaveWidth = 128;
        otherwise
            error("Unsupported Slave Bus Width: %s", dac0.SlaveWidth);
    end
    
    if( strcmpi(config.enable_dac_nco, 'true') )
        dac0.NCOEnabled = true;
    else
        dac0.NCOEnabled = false;
    end
else
    dac0.Enabled = false;
end

%% Configure DAC1
if( strcmpi(config.dac1_enable, 'true') )
    dac1.Enabled = true;
    
    switch(config.dac1_axis_mode)
        case 'both'
            dac1.MasterEn = true;
            dac1.SlaveEn = true;
        case 'slave only'
            dac1.SlaveEn = true;
        case 'master only'
            dac1.MasterEn = true;
    end
    
    switch(config.dac1_axis_master_width)
        case '8'
            dac1.MasterWidth = 8;
        case '16'
            dac1.MasterWidth = 16;
        case '32'
            dac1.MasterWidth = 32;
        case '64'
            dac1.MasterWidth = 64;
        case '128'
            dac1.MasterWidth = 128;
        otherwise
            error("Unsupported Master Bus Width: %s", dac1.MasterWidth);
    end
    
    switch(config.dac1_axis_slave_width)
        case '8'
            dac1.SlaveWidth = 8;
        case '16'
            dac1.SlaveWidth = 16;
        case '32'
            dac1.SlaveWidth = 32;
        case '64'
            dac1.SlaveWidth = 64;
        case '128'
            dac1.SlaveWidth = 128;
        otherwise
            error("Unsupported Slave Bus Width: %s", dac1.SlaveWidth);
    end
    
    if( strcmpi(config.enable_dac_nco, 'true') )
        dac1.NCOEnabled = true;
    else
        dac1.NCOEnabled = false;
    end
else
    dac1.Enabled = false;
end

%% Customize DAC Channels
RFSoC_2x2.common.DAC.Channel.customize(hRD, 0, dac0);
RFSoC_2x2.common.DAC.Channel.customize(hRD, 1, dac1);
