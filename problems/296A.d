module sigod.codeforces.p296A;

import std.stdio;

void main()
{
	int n;
	stdin.readf(" %s", &n);

	int[] array = new int[n];

	foreach (ref a; array) {
		stdin.readf(" %s", &a);
	}

	stdout.writeln(solve(array) ? "YES" : "NO");
}

bool solve(int[] array)
{
	if (array.length == 1) return true;

	int[int] counts;

	foreach (e; array) {
		++counts[e];
	}

	int max = 0;
	foreach (value; counts.byValue) {
		if (value > max) max = value;
	}

	return (max - 1) <= (array.length - max);
}

unittest {
	assert(solve([1]) == true);
	assert(solve([1, 1, 2]) == true);
	assert(solve([7, 7, 7, 7]) == false);
}