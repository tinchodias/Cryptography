functions
lshift: u bits: s 
	"
	(Md4 new lshift: 1 s: 33) printStringRadix: 2 
	"

	| lo |
	lo := u bitAnd: 16rFFFFFFFF.
	^ (lo << s bitAnd: 16rFFFFFFFF)
		bitOr: lo >> (32 - s)