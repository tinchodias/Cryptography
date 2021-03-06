initialize-release
unpredictableStringsDo: aBlock
	"Enumerate sources of information from my environment that should be generally hard to guess."
	| time |
	time := Time millisecondsToRun:
		[ aBlock
			value: World imageForm bits compressToByteArray ;
			value: Sensor mousePoint x asString ;
			value: Sensor mousePoint y asString ;
			value: Time millisecondClockValue asByteArray ;
			value: Date today asString ;
			value: Time now asString ;
			value: Display extent asString.
		100 timesRepeat: [ aBlock value: UUID new ].
		#(imagePath lastUpdateString systemInformationString shortImageName datedVersion lastQuitLogPosition licenseStringTemplate)  collect:
			[ : each |
			aBlock value: (SmalltalkImage current perform: each) asByteArray ] ].
	aBlock 
		value: time asByteArray;
		"maybe the pointer has moved, hit it again."
		value: Sensor mousePoint asString ;
		value: Time millisecondClockValue asByteArray
