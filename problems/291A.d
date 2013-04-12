module sigod.codeforces.p291A;

import std.algorithm;
import std.stdio;

void main()
{
	int n;
	stdin.readf(" %s", &n);

	int[] d = new int[n];
	foreach (i; 0 .. n) {
		stdin.readf(" %s", &d[i]);
	}

	stdout.writeln(solve(d));
}

int solve(int[] d)
{
	d.sort();

	int start;
	foreach (i, di; d) {
		if (di == 0) start = i + 1;
		else break;
	}

	d = d[start .. $];

	int count = 0;
	int prev = 0;
	int prev_count = 0;

	foreach (di; d) {
		if (di == prev) {
			++prev_count;
		}
		else {
			if (prev_count > 2) {
				count = -1;
				break;
			}
			else if (prev_count == 2) {
				++count;
			}

			prev = di;
			prev_count = 1;
		}
	}

	if (prev_count > 2) count = -1;
	else if (prev_count == 2) ++count;

	return count;
}

unittest {
	assert(solve([0, 1, 7, 1, 7, 10]) == 2);
	assert(solve([1, 1, 1]) == -1);
	assert(solve([0]) == 0);
}