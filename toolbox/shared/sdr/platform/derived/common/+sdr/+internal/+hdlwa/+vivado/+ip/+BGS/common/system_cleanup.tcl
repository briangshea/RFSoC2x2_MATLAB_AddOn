# Cleanup script to be called from HDL Coder
set thisDir [file normalize [file dirname [info script]]]

#if { ! [info exists mw_hdl_dir] } {
#    set mw_hdl_dir ${thisDir}/ipcore/mw
#}

#source $mw_hdl_dir/common/scripts/xilinx/mw_project.tcl

if { [llength [current_bd_design -quiet]] == 0 } {
    set BDFILEPATH [get_files -quiet base.bd]
    open_bd_design $BDFILEPATH
}

#Disable the ADC NCO Ports on rfcd if they are not enabled
if { $enable_adc_nco == "false" } {
    set_property -dict [list CONFIG.ADC_NCO_RTS {false}] [get_bd_cells radio/rfdc]
}

#Disable the DAC NCO Ports on rfcd if they are not enabled
#if { $enable_dac_nco == "false" } {
#    set_property -dict [list CONFIG.DAC_NCO_RTS {false}] [get_bd_cells radio/rfdc]
#}

#source $mw_hdl_dir/projects/ad9361/common/mw_cleanup_io.tcl

# Connected Unused AXIS Streams
if { $adc0_enable == "false" } {
    connect_bd_intf_net [get_bd_intf_pins radio/M00_AXIS_ADC_RE] -boundary_type upper [get_bd_intf_pins radio/S00_AXIS_ADC_RE]
    connect_bd_intf_net [get_bd_intf_pins radio/M00_AXIS_ADC_IM] -boundary_type upper [get_bd_intf_pins radio/S00_AXIS_ADC_IM]
set_property -dict [list CONFIG.C_S_AXIS_DATA_WIDTH {128}] [get_bd_cells radio/receiver/channel_00/packet_generator]
} else {
    switch $adc0_axis_master_width {
        8 {
        set axis_m_width 8
        } 16 {
        set axis_m_width 16
        } 32 {
        set axis_m_width 32
        } 64 {
        set axis_m_width 64
        } 128 {
        set axis_m_width 128
        } defalut {
        set axis_m_width 128
        }
    }
        
    set_property -dict [list CONFIG.C_S_AXIS_DATA_WIDTH $axis_m_width] [get_bd_cells radio/receiver/channel_00/packet_generator]
}

if { $adc2_enable == "false" } {
    connect_bd_intf_net [get_bd_intf_pins radio/M20_AXIS_ADC_RE] -boundary_type upper [get_bd_intf_pins radio/S20_AXIS_ADC_RE]
    connect_bd_intf_net [get_bd_intf_pins radio/M20_AXIS_ADC_IM] -boundary_type upper [get_bd_intf_pins radio/S20_AXIS_ADC_IM]
    set_property -dict [list CONFIG.C_S_AXIS_DATA_WIDTH {128}] [get_bd_cells radio/receiver/channel_20/packet_generator]
} else {
    switch $adc2_axis_master_width {
        8 {
        set axis_m_width 8
        } 16 {
        set axis_m_width 16
        } 32 {
        set axis_m_width 32
        } 64 {
        set axis_m_width 64
        } 128 {
        set axis_m_width 128
        } defalut {
        set axis_m_width 128
        }
    }
    set_property -dict [list CONFIG.C_S_AXIS_DATA_WIDTH $axis_m_width] [get_bd_cells radio/receiver/channel_20/packet_generator]
}

#source $mw_hdl_dir/projects/ad9361/common/mw_cleanup_bd_gpio.tcl

validate_bd_design
save_bd_design

source $sharedFolder/common/gen_wrapper.tcl
