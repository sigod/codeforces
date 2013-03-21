module sigod.codeforces.p285A;

import std.stdio;

void main()
{
	int n, k;
	stdin.readf("%s %s", &n, &k);

	foreach (ki; 1 .. k + 1) {
		stdout.write(n - ki + 1, " ");
	}

	foreach (ni; 1 .. n - k) {
		stdout.write(ni, " ");
	}

	stdout.write(n - k);
}