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

	int start = -1;
	foreach (i, di; d) {
		if (di != 0) {
			start = i;
			break;
		}
	}

	if (start != -1) {
		d = d[start .. $];
	}
	else if (d[d.length - 1] == 0) {
		return 0;
	}

	int count = 0;

	foreach (tuple; d.group()) {
		if (tuple[1] == 2) {
			++count;
		}
		else if (tuple[1] > 2) {
			return -1;
		}
	}

	return count;
}

unittest {
	assert(solve([0, 1, 7, 1, 7, 10]) == 2);
	assert(solve([1, 1, 1]) == -1);
	assert(solve([0]) == 0);
}