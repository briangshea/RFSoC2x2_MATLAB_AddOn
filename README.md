# RFSoC2x2_MATLAB_AddOn
MATLAB Addon to target the RFSoC 2x2 from MATLAB Simulink

# RFSoC 2x2
Documentation for the RFSoC 2x2 can be found here [RFSoC 2x2](http://www.rfsoc-pynq.io/index.html)

# Initial Release
- ADC Tile 224 ADC0 and ADC Tile 226 ADC0 are now both supported.
- Simulink IP Core runs at 256MHz
- DIP Switches Avialable
- Push Button Switches Avialable
- PMOD0 and PMOD1 Avialable (Removed)
- SYZYGY Port Avialable
- Restored the Same Heirarchy as the RFSoC2x2 so that default Pynq Image should work (not tested ble


# Next Steps
- Add Real-time interface to ADC0 NCO Frequency & Phase ports
  - Ports have been added, Configuration parameters placed, however, updates are still needed to get fully functional. 
  - Will be addressed in future version.
- Work on Drivers for Pynq System to access Data Streams (May not be required with new heirarchy)

# How to Install

Download [HDL Coder Support Package for RFSoc 2x2 XUP Board.mltbx](https://github.com/briangshea/RFSoC2x2_MATLAB_AddOn/blob/main/HDL%20Coder%20Support%20Package%20for%20RFSoc%202x2%20XUP%20Board.mltbx) and open in MATLAB to install this toolbox.
