module sigod.codeforces.p265B;

import std.conv;
import std.math;
import std.stdio;
import std.string;

private const JUMP_TIME = 1;
private const EAT_TIME = 1;

void main() {
	auto
		trees_count = read(),
		position = read(),
		time = position + EAT_TIME;

	foreach (i; 1 .. trees_count) {
		auto tree = read();

		time += abs(position - tree) + EAT_TIME + JUMP_TIME;
		
		position = tree;
	}

	stdout.write(time);
}

int read() {
	return to!int(strip(stdin.readln()));
}