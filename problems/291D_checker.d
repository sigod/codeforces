module sigod.codeforces.p291D_checker;

import std.conv;
import std.stdio;

void main(string[] args)
{
	int n = args[1].to!int();
	int k = args[2].to!int();

	int[] memory1 = new int[n + 1];
	memory1[] = 1;
	memory1[n] = 0;

	auto memory2 = memory1.dup;

	foreach (ki; 0 .. k) {
		foreach (ni; 1 .. n + 1) {
			int p;
			stdin.readf(" %s", &p);

			memory2[ni] += memory1[p];
		}

		memory1[] = memory2[];
	}

	foreach (i; 1 .. n + 1) {
		if (memory1[i] != n - i) {
			stdout.writeln("NO");
			return;
		}
	}

	stdout.writeln("YES");
}