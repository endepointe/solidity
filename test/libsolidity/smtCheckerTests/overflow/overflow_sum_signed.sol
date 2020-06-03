pragma experimental SMTChecker;

contract C
{
	function f(int8 x) public pure returns (int8) {
		x = 127;
		int8 y = x + 1;
		assert(y == -128);
		y = x + 127;
		assert(y == -2);
		x = -127;
		y = x + -127;
		assert(y == 2);
	}
}
// ----
// Warning 2529: (117-122): Overflow (resulting value larger than 127) happens here
// Warning 2529: (151-158): Overflow (resulting value larger than 127) happens here
// Warning 2529: (197-205): Underflow (resulting value less than -128) happens here
