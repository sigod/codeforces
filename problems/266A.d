module sigod.codeforces.p266A;

import std.conv : to;
import std.stdio;
import std.string : strip;

void main() {
	int n = to!int(strip(stdin.readln()));
	string sequence = strip(stdin.readln());

	char last_symbol = sequence[0];
	int length = 1;

	for (auto i = 1; i < sequence.length; ++i) {
		if (sequence[i] != last_symbol) {
			++length;

			last_symbol = sequence[i];
		}
	}

	stdout.write(sequence.length - length);
}