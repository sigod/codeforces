module sigod.codeforces.p289A;

import std.stdio;

void main()
{
	int n, k;
	stdin.readf("%s %s", &n, &k);
	stdin.readln();

	long length = 0;

	foreach (i; 0 .. n) {
		int l, r;

		stdin.readf("%s %s", &l, &r);
		stdin.readln();

		length += r - l + 1;
	}

	stdout.writeln((k - length % k) % k);
}