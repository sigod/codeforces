module sigod.codeforces.p291D;

import std.conv;
import std.stdio;

void main()
{
	int n, k;
	stdin.readf(" %s %s", &n, &k);

	string end_line = n.to!string() ~ (n > 1 ? " " ~ n.to!string() : "");

	int[] memory = new int[n + 1];
	memory[] = 1;
	memory[n] = 0;

	foreach (ki; 0 .. k) {
		foreach (i; 1 .. n - 1) {
			if (memory[i] < n - i) {
				if (memory[i] * 2 <= n - i) {
					memory[i] *= 2;
					stdout.write(i, " ");
				}
				else {
					int index = n - (n - i - memory[i]);

					memory[i] += memory[index];
					stdout.write(index, " ");
				}
			}
			else {
				stdout.write(n, " ");
			}
		}

		stdout.writeln(end_line);
	}
}