module sigod.codeforces.p285B;

import std.conv;
import std.stdio;
import std.string;


void main()
{
	int n, s, t;
	stdin.readf("%s %s %s", &n, &s, &t);

	if (s == t) {
		stdout.write("0");
		return;
	}

	stdin.readln();
	int[] p = read_array!(int)();

	--s;
	--t;

	int result = 0;
	int position = s;

	while (position != t && p[position] != -1) {
		auto tmp = position;
		position = p[position] - 1;

		p[tmp] = -1;

		++result;
	}

	if (position != t) result = -1;

	stdout.write(result);
}

private
T[] read_array(T)() {
	auto input = stdin.readln().strip().split();

	T[] result = new T[input.length];

	foreach (index, ref element; input) {
		result[index] = element.to!T();
	}

	return result;
}