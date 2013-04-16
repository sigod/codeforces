module sigod.codeforces.p292B;

import std.algorithm;
import std.stdio;
import std.typecons;

private {
	enum BUS = "bus topology";
	enum RING = "ring topology";
	enum STAR = "star topology";
	enum UNKNOWN = "unknown topology";
}

void main()
{
	int n, m;
	stdin.readf(" %s %s", &n, &m);

	int[] vertex = new int[n];

	foreach (i; 0 .. m) {
		int x, y;
		stdin.readf(" %s %s", &x, &y);

		++vertex[x - 1];
		++vertex[y - 1];
	}

	vertex.sort();

	auto g = vertex.group();

	if (n == m + 1) {
		if (equal(g, [tuple(1, 2u), tuple(2, cast(uint) n - 2)][])) {
			stdout.writeln(BUS);
		}
		else if (equal(g, [tuple(1, n - 1), tuple(n - 1, 1)][])) {
			stdout.writeln(STAR);
		}
		else {
			stdout.writeln(UNKNOWN);
		}
	}
	else if (n == m && equal(g, [tuple(2, n)][])) {
		stdout.writeln(RING);
	}
	else {
		stdout.writeln(UNKNOWN);
	}
}