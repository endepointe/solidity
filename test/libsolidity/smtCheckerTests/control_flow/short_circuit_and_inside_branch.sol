pragma experimental SMTChecker;

contract c {
	uint x;
	function f() internal returns (uint) {
		x = x + 1;
		return x;
	}
	function g() public returns (bool) {
		bool b;
			x = 100;
			b = f() > 0;
			assert(x == 102);
			// Should fail.
			assert(!b);
		return b;
	}
}
// ----
// Warning 4661: (202-218): Assertion violation happens here
// Warning 4661: (242-252): Assertion violation happens here
