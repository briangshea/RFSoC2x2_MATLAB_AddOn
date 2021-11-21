% Customize DAC Channel
%
% Copyright Brian G. Shea (bshea@eng.ucsd.edu)

function customize(hRD, channelID, config)
% hRD: current reference design registration object
% config: custom parameters of the current channel, in struct format

if(nargin ~= 3)
    error("Invalid number of parameters.")
end

if(config.Enabled)
    if(config.MasterEn && config.SlaveEn)
        hRD.addAXI4StreamInterface(...
            'InterfaceID',              sprintf('DAC%d RE', channelID),...
            'MasterChannelConnection',  sprintf('radio/S%d0_AXIS_DAC_RE', channelID), ...
            'MasterChannelDataWidth',   512, ...    
            'SlaveChannelConnection',   sprintf('radio/M%d0_AXIS_DAC_RE', cahnnelID), ...
            'SlaveChannelDataWidth',    config.SlaveWidth);

        hRD.addAXI4StreamInterface(...
            'InterfaceID',              sprintf('DAC%d IM', channelID),...
            'MasterChannelConnection',  sprintf('radio/S%d0_AXIS_DAC_IM', channelID), ...
            'MasterChannelDataWidth',   512, ...
            'SlaveChannelConnection',   sprintf('radio/M%d0_AXIS_DAC_IM', channelID), ...
            'SlaveChannelDataWidth',    config.SlaveWidth);
    elseif (config.SlaveEn)
        hRD.addAXI4StreamInterface(...
            'InterfaceID',              sprintf('DAC%d RE', channelID),...
            'SlaveChannelConnection',   sprintf('radio/M%d0_AXIS_DAC_RE', cahnnelID), ...
            'SlaveChannelDataWidth',    config.SlaveWidth);

        hRD.addAXI4StreamInterface(...
            'InterfaceID',              sprintf('DAC%d IM', channelID),...
            'SlaveChannelConnection',   sprintf('radio/M%d0_AXIS_DAC_IM', channelID), ...
            'SlaveChannelDataWidth',    config.SlaveWidth);
    elseif (config.MasterEn)
        hRD.addAXI4StreamInterface(...
            'InterfaceID',              sprintf('DAC%d RE', channelID),...
            'MasterChannelConnection',  sprintf('radio/S%d0_AXIS_DAC_RE', channelID), ...
            'MasterChannelDataWidth',   512);

        hRD.addAXI4StreamInterface(...
            'InterfaceID',              sprintf('DAC%d IM', channelID),...
            'MasterChannelConnection',  sprintf('radio/S%d0_AXIS_DAC_IM', channelID), ...
            'MasterChannelDataWidth',   512);
    end
    
    if(config.NCOEnabled)
        % Map RF DACx Tile NCO Ports
        hRD.addInternalIOInterface(...
            'InterfaceID',         sprintf('DAC%d Ch0 NCO Frequency', channelID), ...
            'InterfaceType',       'OUT', ...
            'PortName',            sprintf('dac%d_01_nco_freq', channelID), ...
            'PortWidth',           48, ...
            'InterfaceConnection', sprintf('radio/dac%d_01_nco_freq', channelID) ...
            );
        hRD.addInternalIOInterface(...
            'InterfaceID',         sprintf('DAC%d Ch0 NCO Phase', channelID), ...
            'InterfaceType',       'OUT', ...
            'PortName',            sprintf('dac%d_01_nco_phase', channelID), ...
            'PortWidth',           18, ...
            'InterfaceConnection', sprintf('radio/dac%d_01_nco_phase', channelID) ...
            );
        hRD.addInternalIOInterface(...
            'InterfaceID',         sprintf('DAC%d Ch0 NCO Phase Reset', channelID), ...
            'InterfaceType',       'OUT', ...
            'PortName',            sprintf('dac%d_01_nco_phase_rst', channelID), ...
            'PortWidth',           1, ...
            'InterfaceConnection', sprintf('radio/dac%d_01_nco_phase_rst', channelID) ...
            );
        hRD.addInternalIOInterface(...
            'InterfaceID',         sprintf('DAC%d Ch0 NCO Update Enable', channelID), ...
            'InterfaceType',       'OUT', ...
            'PortName',            sprintf('dac%d_01_nco_update_en', channelID), ...
            'PortWidth',           6, ...
            'InterfaceConnection', sprintf('radio/dac%d_01_nco_update_en', channelID) ...
            );
        hRD.addInternalIOInterface(...
            'InterfaceID',         sprintf('DAC%d NCO Update Busy', channelID), ...
            'InterfaceType',       'IN', ...
            'PortName',            sprintf('dac%d_01_nco_update_busy', channelID), ...
            'PortWidth',           1, ...
            'InterfaceConnection', sprintf('radio/dac%d_01_nco_update_busy', channelID), ...
            'IsRequired',          false ...
            );
        hRD.addInternalIOInterface(...
            'InterfaceID',         sprintf('DAC%d NCO Update Request', channelID), ...
            'InterfaceType',       'OUT', ...
            'PortName',            sprintf('dac%d_01_nco_update_req', channelID), ...
            'PortWidth',           1, ...
            'InterfaceConnection', sprintf('radio/dac%d_01_nco_update_req', channelID) ...
            );
    end
end
