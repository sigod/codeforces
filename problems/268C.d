module sigod.codeforces.p268C;

import std.algorithm : min;
import std.stdio;

void main() {
	int n, m;
	stdin.readf("%s %s", &n, &m);

	solve(n, m);
}

void solve(int n, int m) {
	int min = min(n, m);

	stdout.writeln(min + 1);

	foreach (i; 0 .. min + 1) {
		stdout.writeln(i, " ", min - i);
	}
}