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
# Modified by Brian G. Shea to support MATLAB Base image
#

__author__ = "David Northcote, Brian G. Shea"
__copyright__ = "Copyright 2021, Xilinx"
__email__ = "pynq_support@xilinx.com, bshea@eng.ucsd.edu"


from pynq import DefaultHierarchy
from pynq import allocate
from pynq import Interrupt
from .transmitter import AmplitudeController
from .transmitter import DACSourceSwitch
from .receiver import PacketGenerator
from .constants import *
import numpy as np
import xrfdc


class Transmitter(DefaultHierarchy):
    """Wrapper for the transmit pipeline.

    This wrapper assumes the following pipeline structure and naming

    channel_xy -> rfdc
    where x is a number associated with the relevant dac tile,
    and y is a number associated with the relevant dac block.

    Attributes
    ----------
    channel : list
        A list of hierarchies.DacChannel. The DacChannels are listed in the
        alphanumeric order that they are found.
        Indexing channel retrieves the associated
        DacChannel. Use get_channel_description() to obtain
        information of the associated adc_block and adc_tile as a dict.

    """

    @staticmethod
    def checkhierarchy(description):
        """The hierarchy must contain channel hierarchies and be named
        transmitter.
        """
        return (any('channel_' in s for s in description['hierarchies']) and
                description['fullpath'].split('/')[-1] == 'transmitter')

    def __init__(self, description, dac_tiles=None):
        """Initialise the driver for the transmit pipeline
        """
        super().__init__(description)
        self.channel = []
        self._dac_list = []
        self._dac_tiles = dac_tiles
        for i in range(0, NO_DAC_TILES):
            for j in range(0, NO_DAC_BLOCKS_PTILE):
                if ''.join(['channel_', str(i), str(j)]) in \
                        description['hierarchies']:
                    self.channel.append(getattr(
                        self, ''.join(['channel_', str(i), str(j)])))
                    self._dac_list.append([i, j])

    def _initialise_dacs(self):
        """Configure all DACs in the design as indicated by the dac_list.
        """
        for i in range(0, len(self._dac_list)):
            self.channel[i].dac_tile = self._dac_tiles[self._dac_list[i][0]]
            self.channel[i].dac_block = self.channel[i].dac_tile.blocks[
                self._dac_list[i][1]]
            self._setup_dac(self.channel[i].dac_tile,
                            self.channel[i].dac_block)

    def _setup_dac(self, dac_tile, dac_block):
        """Configure the dac block with default parameters.

        The DACs operate at 4096MHz with interpolation factor of 2. Just
        set the mixer frequency to 1000 as default. The fc must be because
        the first nyquist zone is set for the RF-DAC block.
        """
        dac_tile.DynamicPLLConfig(1, 409.6, 4096)
        dac_block.NyquistZone = 1
        dac_block.MixerSettings = {
            'CoarseMixFreq':  xrfdc.COARSE_MIX_BYPASS,
            'EventSource':    xrfdc.EVNT_SRC_IMMEDIATE,
            'FineMixerScale': xrfdc.MIXER_SCALE_1P0,
            'Freq':           0,
            'MixerMode':      xrfdc.MIXER_MODE_C2R,
            'MixerType':      xrfdc.MIXER_TYPE_FINE,
            'PhaseOffset':    0.0
        }
        dac_block.UpdateEvent(xrfdc.EVENT_MIXER)
        dac_tile.SetupFIFO(True)

    def get_channel_description(self):
        """Obtains the channels and their tile and block for the user.
        """
        ch_dict = {}
        for i in range(0, len(self._dac_list)):
            tile = self._dac_list[i][0]
            block = self._dac_list[i][1]
            ch_dict.update({''.join(["Channel ", str(i)]):
                            {"Tile": tile+228,
                             "Block": block}})
        return ch_dict


class Receiver(DefaultHierarchy):
    """Wrapper for the receiver pipeline.

    This wrapper assumes the following pipeline structure and naming

    rfdc => channel_xy
    where x is a number associated with the relevant adc tile,
    and y is a number associated with the relevant adc block.

    Attributes
    ----------
    channel : A list of hierarchies.AdcChannel
        The AdcChannels are listed in the alphanumeric order that
        they are found. Indexing channel retrieves the associated
        AdcChannel. Use get_channel_description() to obtain
        information of the associated adc_block and adc_tile as a dict.

    """

    @staticmethod
    def checkhierarchy(description):
        """The hierarchy must contain channel hierarchies and be named receiver.
        """
        return (any('channel' in s for s in description['hierarchies']) and
                description['fullpath'].split('/')[-1] == 'receiver')

    def __init__(self, description, adc_tiles=None):
        """Initialise the driver for the reciever pipeline
        """
        super().__init__(description)
        self.channel = []
        self._adc_list = []
        self._adc_tiles = adc_tiles
        for i in range(0, NO_ADC_TILES):
            for j in range(0, NO_ADC_BLOCKS_PTILE):
                if ''.join(['channel_', str(i), str(j)]) in \
                        description['hierarchies']:
                    self.channel.append(getattr(
                        self, ''.join(['channel_', str(i), str(j)])))
                    self._adc_list.append([i, j])

    def _initialise_adcs(self):
        """Configure all ADCs in the design as indicated by the adc_list.
        """
        for i in range(0, len(self._adc_list)):
            self.channel[i].adc_tile = self._adc_tiles[self._adc_list[i][0]]
            self.channel[i].adc_block = self.channel[i].adc_tile.blocks[
                self._adc_list[i][1]]
            self._setup_adc(self.channel[i].adc_tile,
                            self.channel[i].adc_block)

    def _setup_adc(self, adc_tile, adc_block):
        """Configure the adc block with default parameters.

        The ADCs operate at 4096MHz with decimation factor of 2. Just
        set the mixer frequency to 1024. Negative fc because first nyquist
        zone is set for RF-ADC.
        """
        adc_tile.DynamicPLLConfig(1, 409.6, 4096)
        adc_block.NyquistZone = 1
        adc_block.MixerSettings = {
            'CoarseMixFreq':  xrfdc.COARSE_MIX_BYPASS,
            'EventSource':    xrfdc.EVNT_SRC_TILE,
            'FineMixerScale': xrfdc.MIXER_SCALE_1P0,
            'Freq':           1024,
            'MixerMode':      xrfdc.MIXER_MODE_R2C,
            'MixerType':      xrfdc.MIXER_TYPE_FINE,
            'PhaseOffset':    0.0
        }
        adc_block.UpdateEvent(xrfdc.EVENT_MIXER)
        adc_tile.SetupFIFO(True)

    def get_channel_description(self):
        """Obtains the channels and their tile and block for the user.
        """
        ch_dict = {}
        for i in range(0, len(self._adc_list)):
            tile = self._adc_list[i][0]
            block = self._adc_list[i][1]
            ch_dict.update({''.join(["Channel ", str(i)]): 
                            {"Tile": tile+224,
                             "Block": block}})
        return ch_dict

class IQDacChannel(DefaultHierarchy):
    """Wrapper for the dac channel hierarchy.

    This wrapper assumes the following pipeline structure and naming

                                 +--------+
    amplitude_controller --I/Q-->|        |
                                 |  AXI   |
                       +-----+   | Switch | --I/Q--> rfdc
    MATLAB IP Core RE->| I/Q |   |        |
                       | MUX |-->|        |
    MATLAB IP Core RE->|     |   +--------+
                       +-----+

                            +-------+
                            |       | --> MATLAB IP Core RE
    Zynq MPSoC ----I/Q----> |  DMA  | 
                            | DEMUX | --> MATLAB IP Core IM
                            |       |
                            +-------+

    Attributes
    ----------
    dac_tile : xrfdc.dac_tile
        The channel's associated DAC Tile. Can be used by the user
        to directly control the tile.

    dac_block : xrfdc.dac_block
        The channel's associated DAC Block. Can be used by the user
        to directly control the block.

    control : transmitter.AmplitudeController
        The Amplitude Controller that enables/disables signal
        output gain.

    source : transmitter.DACSourceSwitch
        The DAC Source Switch that controls where DAC samples
        come from.

    dma :
        Direct Memory Access to I/Q Stream controller that sends
        I/Q data to the MATLAB Core. Data is deinterleaved into 
        Real and Imaginary Stream. Memory Data format should be
        16bit I and Q data interleaved in memory.

    """
    @staticmethod
    def checkhierarchy(description):
        return ('amplitude_controller' in description['ip'] and
                'dac_source_switch' in description['ip'] and
                'axi_dma_re' in description['ip'] and
                'axi_dma_im' in description['ip'] and
                description['fullpath'].split('/')[-2] == 'transmitter'
               )

    def __init__(self, description, dac_tile=None, dac_block=None):
        """Initialise the driver for the dac channel hierarchy.

        """
        super().__init__(description)
        self.dac_tile = dac_tile
        self.dac_block = dac_block
        self.control = self.amplitude_controller
        self.source = self.dac_source_switch


    def transfer(self, c_data, wait = True):
        """ Transfers a complex numpy array to the IP CORE
        """

        c_data_buffer_re = allocate(shape=(len(c_data),), dtype=np.int16)
        c_data_buffer_im = allocate(shape=(len(c_data),), dtype=np.int16)

        #c_data = np.multiply(c_data, ((2**15) + 1j * (2**15)))

        scale = 2**15
        min = -1*(scale)
        max =  1*(scale)-1

        for i in range(0, len(c_data)):
            c_data_buffer_re[i] = np.clip(np.real(c_data[i])*scale, min, max).astype(np.int16)
            c_data_buffer_im[i] = np.clip(np.imag(c_data[i])*scale, min, max).astype(np.int16)

        self.axi_dma_re.sendchannel.transfer(c_data_buffer_re)
        self.axi_dma_im.sendchannel.transfer(c_data_buffer_im)
        if( wait ):
            self.axi_dma_re.sendchannel.wait()
            self.axi_dma_im.sendchannel.wait()


class IQAdcChannel(DefaultHierarchy):
    """Wrapper for the adc channel hierarchy.

    This wrapper assumes the following pipeline structure and naming

    rfdc => packet_generator -> axi_dma_real
                             -> axi_dma_imag

    Attributes
    ----------
    adc_tile : xrfdc.adc_tile
        The channel's associated ADC Tile. Can be used by the user
        to directly control the tile.

    adc_block : xrfdc.adc_block
        The channel's associated ADC Block. Can be used by the user
        to directly control the block.

    """

    @staticmethod
    def checkhierarchy(description):
        return ('packet_generator' in description['ip'] and
                'axi_dma_real' in description['ip'] and
                'axi_dma_imag' in description['ip'] and
                description['fullpath'].split('/')[-2] == 'receiver')

    def __init__(self, description, adc_tile=None, adc_block=None):
        """Initialise the driver for the adc channel hierarchy.
        """
        super().__init__(description)
        self.adc_tile = adc_tile
        self.adc_block = adc_block
        self._pgen = self.packet_generator
        self._dma_real = self.axi_dma_real
        self._dma_imag = self.axi_dma_imag

    def transfer(self, packetsize):
        """Returns a numpy array with inspected data of length packetsize.
        """

        #self._dma_real.recvchannel.stop()
        #self._dma_imag.recvchannel.stop()
        #self._dma_real.recvchannel.start()
        #self._dma_imag.recvchannel.start()

        transfersize = int(np.ceil(packetsize/8))
        if transfersize > 4096 or transfersize < 2:
            raise ValueError(
                'Packet size incorrect, should be in range 16 to 32768.')
        self._pgen.packetsize = transfersize
        buffer_re = allocate(shape=(transfersize*8,), dtype=np.int16)
        buffer_im = allocate(shape=(transfersize*8,), dtype=np.int16)
        self._dma_real.recvchannel.transfer(buffer_re)
        self._dma_imag.recvchannel.transfer(buffer_im)
        self._pgen.transfer = 1
        self._dma_real.recvchannel.wait()
        self._dma_imag.recvchannel.wait()
        self._pgen.transfer = 0
        re_data = np.array(buffer_re) * 2**-15
        im_data = np.array(buffer_im) * 2**-15
        buffer_re.freebuffer()
        buffer_im.freebuffer()
        c_data = re_data.astype('double') + 1j * im_data.astype('double')
        return c_data[0:packetsize]

    def setup_buffer(self, packetsize):
        """Initializes data buffers and configures the DMA to receive I/Q 
           data from the ADCs.
        """
        self._packetsize = packetsize
        transfersize = int(np.ceil(packetsize/8))
        self._pgen.packetsize = transfersize
        self._re_buffer = allocate(shape=(transfersize*8,), dtype=np.int16)
        self._im_buffer = allocate(shape=(transfersize*8,), dtype=np.int16)
        #self._dma_real.recvchannel.transfer(self._re_buffer)
        #self._dma_imag.recvchannel.transfer(self._im_buffer)

    def initiate(self):
        """Starts the DMA Transfer to fill the buffers. This fucntion does not wait for
           the DMA to complete.
        """
        self._dma_real.recvchannel.transfer(self._re_buffer)
        self._dma_imag.recvchannel.transfer(self._im_buffer)
        self._pgen.transfer = 1

    def wait(self):
        """Waits for the intiated transfer to complete.
        """
        self._dma_real.recvchannel.wait()
        self._dma_imag.recvchannel.wait()

    def fetch(self):
        """Fetches the ADC data from the buffers and returns an array of
           complex doubles.
        """
        re_data = np.array(self._re_buffer) * 2 ** -15
        im_data = np.array(self._im_buffer) * 2 ** -15
        c_data = re_data.astype('double') + 1j * im_data.astype('double')
        return c_data[0:self._packetsize]

    def stop(self):
       self._pgen_transfer = 0

    def abort(self):
        """Aborts an in progress transfer.
        """
        self._pgen.transfer = 0
        self._dma_real.recvchannel.stop()
        self._dma_imag.recvchannel.stop()
        self._dma_real.recvchannel.start()
        self._dma_imag.recvchannel.start()

class RadioWrapper(DefaultHierarchy):
    """Hierarchy driver for the entire radio subsystem.

    Exposes the transmit, receive, and rfdc as attributes. The rfdc
    dac and adc tiles are passed to the transmitter and receiver
    respectively.

    This wrapper assumes the following separate pipelines
    * transmitter -> rfdc -> "the outside world"
    * "the outside world" -> rfdc => receiver

    The rfdc core is common between each pipeline.

    Attributes
    ----------
    transmitter : pynq.lib.radio.Transmitter
        The transmit control system
    receiver : pynq.lib.radio.Receiver
        The receive control system
    rfdc : xrfdc package
        The RF Data Converter core

    """

    @staticmethod
    def checkhierarchy(description):
        tx_pipeline = None
        rx_pipeline = None
        rfdc = None

        for hier, details in description['hierarchies'].items():
            if details['driver'] == Transmitter:
                tx_pipeline = hier
            elif details['driver'] == Receiver:
                rx_pipeline = hier

        for ip, details in description['ip'].items():
            if details['driver'] == xrfdc.RFdc:
                rfdc = ip

        return (tx_pipeline is not None and
                rx_pipeline is not None and
                rfdc is not None)

        #return (rx_pipeline is not None and
        #        rfdc is not None)

    def __init__(self, description):
        super().__init__(description)
        tx_pipeline = None
        rx_pipeline = None
        rfdc = None

        for hier, details in description['hierarchies'].items():
            if details['driver'] == Transmitter:
                tx_pipeline = hier
            elif details['driver'] == Receiver:
                rx_pipeline = hier

        for ip, details in description['ip'].items():
            if details['driver'] == xrfdc.RFdc:
                rfdc = ip

        #interrupt_controller = self.axi_intc

        if tx_pipeline != None: getattr(self, tx_pipeline)._dac_tiles = getattr(self, rfdc).dac_tiles
        getattr(self, rx_pipeline)._adc_tiles = getattr(self, rfdc).adc_tiles

        if tx_pipeline != None: getattr(self, tx_pipeline)._initialise_dacs()
        getattr(self, rx_pipeline)._initialise_adcs()

        if 'irq' in self.rfdc._interrupts:
            setattr(self.rfdc, 'interrupt', Interrupt(self.rfdc._interrupts['irq']['fullpath']))

