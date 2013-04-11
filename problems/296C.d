module sigod.codeforces.p296C;

import std.stdio;

void main()
{
	int n, m, k;
	stdin.readf(" %s %s %s", &n, &m, &k);

	long[] a = new long[n + 2];
	foreach (i; 1 .. n + 1) {
		stdin.readf(" %s", &a[i]);
	}

	int[] l = new int[m + 1];
	int[] r = new int[m + 1];
	long[] d = new long[m + 2];

	foreach (i; 1 .. m + 1) {
		stdin.readf(" %s %s %s", &l[i], &r[i], &d[i]);
	}

	// process requests

	int[] multipl = new int[m + 2];

	foreach (i; 0 .. k) {
		int x, y;
		stdin.readf(" %s %s", &x, &y);

		++multipl[x];
		--multipl[y + 1];
	}

	foreach (i; 1 .. m + 1) {
		multipl[i] += multipl[i - 1];

		d[i] *= multipl[i];
	}

	// process operations

	long[] sum = new long[n + 2];

	foreach (i; 1 .. m + 1) {
		sum[l[i]] += d[i];
		sum[r[i] + 1] -= d[i];
	}

	foreach (i; 1 .. n + 1) {
		sum[i] += sum[i - 1];

		a[i] += sum[i];
	}

	// output

	foreach (i; 1 .. n + 1) {
		stdout.write(a[i], " ");
	}
}