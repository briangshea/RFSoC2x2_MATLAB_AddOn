# RFSoC2x2_MATLAB_AddOn
MATLAB Addon to target the RFSoC 2x2 from MATLAB Simulink

# RFSoC 2x2
Documentation for the RFSoC 2x2 can be found here [RFSoC 2x2](http://www.rfsoc-pynq.io/index.html)

# v0.6.0 Release
- ADC Tile 224 ADC0 and ADC Tile 226 ADC0 are supported.
- DAC Tile 228 and 229 are supported.
- Simulink IP Core runs at 300MHz.
- DIP Switches avialable to MATLAB IP Core
- Push Button Switches avialable to MATLAB IP Core
- LEDs avialable to MATLAB IP Core
- RGBLEDs avialable to MATLAB IP Core
- PMOD0 and PMOD1 avialable to MATLAB IP Core
- SYZYGY Port avialable via GPIO Controller
- Tested ADC and DAC Channels using PYNQ Notebook.
- Added Python Code to control base overlay
  - DAC Source must be configured manually via Python to select MATLAB as DAC Data Source
  - DAC AXI Stream Switch is initially disabled or not configured.

# Next Steps
- Fix AXI4-Stream Switch manual configuration
- Verify DMA I/Q Stream to MATLAB IP
- Add Real-time monitor ports for ADC and DAC
- Create Variant that has PMODs controlled via microblaze processors to easy the use of PMODs
- Create Block diagram for Dataflow and better documentation

# How to Install

Download [HDL Coder Support Package for RFSoc 2x2 XUP Board.mltbx](https://github.com/briangshea/RFSoC2x2_MATLAB_AddOn/blob/main/HDL%20Coder%20Support%20Package%20for%20RFSoc%202x2%20XUP%20Board.mltbx) and open in MATLAB to install this toolbox.

Using Vivado 2020.2 or 2021.2 run the following TCL commands to install board files
```
xhub::refresh_catalog [xhub::get_xstores xilinx_board_store]
xhub::install [xhub::get_xitems xilinx.com:xilinx_board_store:rfsoc2x2:1.1]
```
