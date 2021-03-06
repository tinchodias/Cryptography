tests - mapped
testDefinedMappedUTF8StringType

	| bytes obj newBytes type |
	((ASN1Module name: #test) mapped: #TestMapped)
		mapping: ASN1TestModel mappingSymbol: #testSlot1 type: #ASN1StringType.
	type := (ASN1Module name: #test) find: #TestMapped.

	bytes := #(12 11 104 101 108 108 111 32 119 111 114 108 100).
	obj := ASN1Stream decodeBytes: bytes withType: type.
	self assert: (obj isKindOf: ASN1TestModel).
	self assert: (obj testSlot1 = 'hello world').
	newBytes := ASN1Stream encode: obj withType: type.
	self assert: (bytes asByteArray = newBytes).
