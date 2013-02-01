module sigod.codeforces.p265C;

import std.array;
import std.stdio;
import std.string;

void main() {
	string commands = strip(stdin.readln());

	auto array = appender!(int[])();

	foreach (i, c; commands) {
		if (c == 'r') {
			stdout.writeln(i + 1);
		} else {
			array.put(i + 1);
		}
	}

	auto end = array.data;

	for (int i = end.length - 1; i >= 0; --i) {
		stdout.writeln(end[i]);
	}
}