module sigod.codeforces.p266B;

import std.array : split;
import std.conv : to;
import std.stdio;
import std.string : strip;

void main() {
	auto temp = split(strip(stdin.readln()));

	int n = to!int(temp[0]),
		t = to!int(temp[1]);

	string start_queue = strip(stdin.readln());

	char[] queue = start_queue.dup;

	foreach (tick; 0 .. t) {
		int i = 0;

		while (i < queue.length - 1) {
			if (queue[i] == 'B' && queue[i + 1] == 'G') {
				queue[i] = 'G';
				queue[i + 1] = 'B';

				i += 2;
			} else {
				++i;
			}
		}
	}

	stdout.write(queue);
}