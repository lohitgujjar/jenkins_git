#!/usr/bin/python

from Cheetah.Template import Template
import csv


SET_TIME = 1.0
CHECK_TIME = 0.5


class TestCase:

	_stateID = 0
	_checkID = 0
	_name = ''

	def __init__(self, name):
		self._name = name

	def Reset(self):
		self._stepID = 0
		self._stateID = 0
		self._checkID = 0

	def GetName(self):
		return self._name

	def GetCurrentStateID(self):
		return self._stateID

	def GetCurrentCheckID(self):
		return self._checkID

	def GetNextStateID(self):
		self._checkID = 0;
		self._stateID = self._stateID + 1
		return self._stateID

	def GetNextCheckID(self):
		self._checkID = self._checkID + 1
		return self._checkID


#################################################################################
# Main
#################################################################################

TESTCASE = "rm3259-3"

SIGNALS = 	[
				[
					"Roi", 		# Parameter
					"enum", 		# Datentyp des Parameters
					"DRCAM_Gaze_ST3", 	# Signalname fuers Assert
					"ui8", 			# Datentyp des Asserts 
					"",				# Unit
					[
						["NoGaze", 0],
						["Roi01", 1],
						["Roi02", 2],
						["Roi03", 3],
						["Roi04", 4],
						["Roi05", 5],
						["Roi06", 6],
						["Roi07", 7],
						["Roi08", 8],
						["Roi09", 9],
						["Roi10", 10],
						["Roi11", 11],
						["Roi12", 12],
						["Roi13", 13],
						["Roi14", 14],
						["Roi15", 15],
						["Roi16", 16],
						["Roi17", 17],
						["Roi18", 18],
						["Roi19", 19],
						["Roi20", 20],
						["Roi21", 21],
						["Roi22", 22],
						["Roi23", 23],
						["Roi24", 24],
						["Roi25", 25],
						["Roi26", 26],
						["Roi27", 27],
						["Roi28", 28],
						["Roi29", 29],
						["NoRoi", 30]
					]
				]
			]




i = 0
for signal in SIGNALS:
	i = i + 1
	testCaseName = TESTCASE + ".xml"
	testCase = TestCase(testCaseName)
	testCase.Reset()

	cnt = len(signal[5])

	template = open(TESTCASE + ".template", 'r').read()
	xml = Template(template, searchList=[{'testCase' : testCase,
										  'SET_TIME' : SET_TIME,
										  'CHECK_TIME' : CHECK_TIME,
										  'SIGNALNAME_ACT' : signal[0],
										  'SIGNALNAME_ASS' : signal[2],
										  'DATATYPE_ACT' : signal[1],
										  'DATATYPE_ASS' : signal[3],
										  'UNIT' : signal[4],
										  'VALUES' : signal[5],
										  'CNT' : cnt}])
	open(testCaseName, 'w').write(str(xml))
	print testCaseName + ' generated'

