from pynq import DefaultHierarchy

class RFSoCChannel(DefaultHierarchy):
	""" This class implements a channel within the RFSoC radio
	"""
	def __init__(self, description):
		super().__init__(description)

	@staticmethod
	def checkhierarchy(description):
		if 'packet_generator' in description['ip']:
			return True
		return False

class RFSoCRadio(DefaultHierarchy):
	""" This hierarchy is designed to work with the Radio hierarchy on the 
	RFSoC2x2 board.

	"""
	def __init__(self, description):
		super().__init__(description)

	@staticmethod
	def checkhierarchy(description):
		if 'rfdc' in description['ip'] \
			and 'receiver' in description['hierarchies']:
			return True
		return False
