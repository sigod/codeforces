module sigod.codeforces.p268A;

import std.array : split;
import std.conv : to;
import std.stdio;
import std.string : strip;

private {
	string[] temp;
}

void main() {
	read();

	int n = get!int(0);
	int[] h = new int[n];
	int[] a = new int[n];

	foreach (i; 0 .. n) {
		read();

		h[i] = get!int(0);
		a[i] = get!int(1);
	}

	int count = 0;

	foreach (i, hi; h) {
		foreach (j, aj; a) {
			if (i != j && hi == aj)
				++count;
		}
	}

	stdout.write(count);
}

void read() {
	temp = split(strip(stdin.readln()));
}

T get(T)(int p) {
	return to!(T)(temp[p]);
}