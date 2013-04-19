module sigod.codeforces.p298D;

import std.algorithm;
import std.stdio;

void main()
{
	int n, m, k;
	stdin.readf(" %s %s %s", &n, &m, &k);

	long a_sum = 0;
	long b_sum = 0;

	int[] a = new int[n];
	foreach (i; 0 .. n) {
		stdin.readf(" %s", &a[i]);

		a_sum += a[i];
	}

	int[] b = new int[m];
	foreach (i; 0 .. m) {
		stdin.readf(" %s", &b[i]);

		b_sum += b[i];
	}


	if (a_sum > b_sum) {
		stdout.writeln("YES");
		return;
	}

	a.sort();
	b.sort();

	if (a[a.length - 1] > b[b.length - 1]) {
		stdout.writeln("YES");
		return;
	}

	stdout.writeln("NO");
}