#   Copyright (c) 2021, Xilinx, Inc.
#   All rights reserved.
#
#   Redistribution and use in source and binary forms, with or without
#   modification, are permitted provided that the following conditions are met:
#
#   1.  Redistributions of source code must retain the above copyright notice,
#       this list of conditions and the following disclaimer.
#
#   2.  Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#
#   3.  Neither the name of the copyright holder nor the names of its
#       contributors may be used to endorse or promote products derived from
#       this software without specific prior written permission.
#
#   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
#   AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
#   THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
#   PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
#   CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
#   EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
#   PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
#   OR BUSINESS INTERRUPTION). HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
#   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
#   OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
#   ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

#
# Revisions
# 11/28/21 BGS Updated Transmitter to allow control to DAC Source AXIS Switch
#

__author__ = "David Northcote, Brian G. shea"
__copyright__ = "Copyright 2021, Xilinx, Brian G. Shea"
__email__ = "pynq_support@xilinx.com, bshea@eng.ucsd.edu"


from pynq import DefaultIP


class AmplitudeController(DefaultIP):
    """Driver for the transmit control IP Core.
    
    The Amplitude Controller is a simple IP core written
    in VHDL. The core outputs a user defined value on the master
    AXI-Stream interface when the enable register is high.
    This core was purposely designed to communicate with the
    RF Digital-to-Analogue Converter (RF DAC). The user
    can set the amplitude of the signal written to the RF DAC
    and use the RF DAC's fine mixer to generate a tone for
    loopback purposes on their development board.
    
    Attributes
    ----------
    enable : a bool
        If high, enables the output of the gain register on to
        the master AXI-Stream interface.
        
    gain : a float
        A float in Volts, that describes the amplitude of the
        output master AXI-Stream signal. Must be in range 0 to 1.
    
    """
    
    def __init__(self, description):
        super().__init__(description=description)
        
    bindto = ['xilinx.com:ip:amplitude_controller:1.0']
    
    @property
    def enable(self):
        """The state of the output master AXI-Stream data signal.
        If high, the gain register is passed to the data signal, if
        low, a zero is passed to the data signal."""
        return self.read(0x00)
    
    @enable.setter
    def enable(self, enable):
        if enable:
            self.write(0x00, int(1))
        else:
            self.write(0x00, int(0))
    
    @property
    def gain(self):
        """The amplitude of the output master AXI-Stream data signal.
        Measured in volts and should be a float in range 0 to 1."""
        gain = self.read(0x04) & 0x0000FFFF
        if gain > 0:
            return gain/0x7FFF
        else:
            return 0.0
    
    @gain.setter
    def gain(self, gain):
        if 0 <= gain <= 1:
            int_gain = int(gain*0x7FFF*0x00000001) | int(gain*0x7FFF*0x00010000)
            self.write(0x04, int_gain)
        else:
            raise ValueError('Programmable Gain must be in range 0 to 1.')

#
# BGS - This class creates a driver for the AXIS Switch Core
#       https://www.xilinx.com/support/documentation/ip_documentation/axis_infrastructure_ip_suite/v1_1/pg085-axi4stream-infrastructure.pdf
#
class DACSourceSwitch(DefaultIP):
    """Driver for the Xilnx AXI4-Stream Switch IP.
    
    Constants
    ---------
    SRC_AMPCTRL : Selects the Transmitter's Amplitude Controller as the DAC
        data source.
        
    SRC_IPCORE : Select the MATLAB IP CORE as the DAC data source.
    
    Attributes
    ----------
    busy : a bool
        If high, the AXI Stream Switch is still updating, otherwise done.
        
    selection : a number
        A number that describes the DAC's data source. Use SRC_AMPCTRL or SRC_IPCORE
    
    disabled : a bool
        If high, the DAC data stream is disabled.
    """
    
    def __init__(self, description):
        super().__init__(description=description)
        self.selection = 1
        self.disabled = False
        self.commit()
        
    bindto = ['xilinx.com:ip:axis_switch:1.1']
    
    SRC_AMPCTRL = 0x00
    SRC_IPCORE = 0x01
    
    @property
    def busy(self):
        """ Returns the status of the Switch core.
        If high, the core is still applying the new mux selections.
        """
        return (self.read(0x00) == 0x02)
    
    
    def commit(self):
        """ Commits the new Switch selection.
        """
        self.write(0x00, 0x02)
       
    @property
    def selection(self):
        """ The selected source for the DAC
        """
        return self.read(0x0040) & 0x000F
    
    @selection.setter
    def selection(self, selection):
        if selection > 1:
            raise ValueError("Selection out of range. Valid Range is 0 to 1.")
        
        self.write(0x0040, selection)
    
    @property
    def disabled(self):
        """ Returns the enable/disable status of the Stream
        If high, the stream is disabled, otherwise enabled.
        """
        return ((self.read(0x0040) & 0x80000000) == 0x80000000)
    
    @disabled.setter
    def disabled(self, disable):
        regVal = self.read(0x0040)
        if disable:
            regVal = 0x80000000 | regVal
        
        self.write(0x0040, regVal)
