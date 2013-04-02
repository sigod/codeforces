module sigod.codeforces.p289C;

import std.array;
import std.stdio;

void main()
{
	int n, k;
	stdin.readf("%s %s", &n, &k);
	
	stdout.writeln(solve(n, k));
}

string solve(int n, int k)
{
	if (n < k) return "-1";
	if (k == 1) {
		if (n == 1) return "a";
		else return "-1";
	}

	auto result = appender!string();
	result.reserve(n);

	int g = n - max(k - 2, 0);

	foreach (i; 0 .. g / 2) {
		result.put("ab");
	}

	if (g % 2 != 0) result.put('a');

	foreach (i; 99 .. 99 + max(k - 2, 0)) {
		result.put(cast(char) i);
	}

	return result.data();
}

unittest {
	assert(solve(7, 4) == "ababacd");
	assert(solve(4, 7) == "-1");
}

pure int max(int a, int b)
{
	if (a > b) return a;
	else return b;
}