module sigod.codeforces.p265A;

import std.stdio;

void main() {
	string land = stdin.readln();

	size_t position = 1;

	foreach (char command; stdin.readln()) {
		if (command == land[position - 1]) {
			++position;
		}
	}

	stdout.write(position);
}