from pynq import DefaultIP
import time

class MATLABExample_ip_0(DefaultIP):
    """Class for interacting with the MATLABExample_ip_0 IP Core
    
    Attributes
    ----------
    adc_freq_hi : upper 32bits of a 64bit signed frequency tuning word
    
    adc_freq_lo : lower 32bits of a 64bit signed frequency tuning word
    
    NOTE: frequency tuning word is 48bits wide, the lwoer 16bits of the 64bit
          are truncated.
    
    """

    def __init__(self, description):
        super().__init__(description=description)

    bindto = ['user.org:ip:PASSTHRU_ip:1.0']
    
    SAMPLERATE = 4096e6/2
    HALFSAMPLERATE = SAMPLERATE/2
    
    def adc0_freq(self, freq):
        if freq >= self.HALFSAMPLERATE or freq < -self.HALFSAMPLERATE:
            raise ValueError('freq out of range, valid range is {1} to {2} '.format(self.HALFSAMPLERATE, -self.HALFSAMPLERATE))
            
        omega = freq/self.SAMPLERATE
        
        omega = int(omega * 2**47)
        
        freq_hi = (omega>>16)
        freq_lo = (omega&0xFFFF)<<16
        
        self.write(0x100, freq_hi)
        self.write(0x104, freq_lo)
        
    @property
    def adc0_freq_hi(self):
        return self.read(0x100)
    
    @property
    def adc0_freq_lo(self):
        return self.read(0x104)
    
    def adc0_update(self):
        self.write(0x10c, 0x3F)
        time.sleep(0.010)
        self.write(0x10c, 0x00)
        
    def adc_capture_reset(self):
        self.write(0x110, 0x80000000)
        time.sleep(0.010)
        self.write(0x110, 0x00000000)
