*Cryptography
new

	self isPluginAvailable 
		ifTrue: [ ^SHA256WithPrimitive basicNew ]
		ifFalse: [ ^SHA256NonPrimitive basicNew ]