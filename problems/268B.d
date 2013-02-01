module sigod.codeforces.p268B;

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
	
	int count = 0;

	foreach (i; 1 .. n + 1) {
		count += (n - (i - 1)) * i - i + 1;
	}

	stdout.write(count);
}

void read() {
	temp = split(strip(stdin.readln()));
}

T get(T)(int p) {
	return to!(T)(temp[p]);
}