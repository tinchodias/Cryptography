tests - base
testUniversalString

	| bytes obj newBytes testObj |
	bytes := #(28 11 104 101 108 108 111 32 119 111 114 108 100).
	testObj := 'hello world'.
	obj := ASN1Stream decodeBytes: bytes.
	self assert: (obj = testObj).
	newBytes := ASN1Stream encode: obj.
	self assert: (bytes asByteArray = newBytes).
