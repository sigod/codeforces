module sigod.codeforces.p294A;

import std.conv;
import std.stdio;
import std.string;

void main()
{
	int N;
	stdin.readf("%s", &N);
	stdin.readln();

	int[] counts = read_array!int();

	int M;
	stdin.readf("%s", &M);
	stdin.readln();

	foreach (i; 0 .. M) {
		int x, y;

		stdin.readf("%s %s", &x, &y);
		stdin.readln();

		--x;

		if (x > 0) {
			counts[x - 1] += y - 1;
		}
		if (x < N - 1) {
			counts[x + 1] += counts[x] - y;
		}

		counts[x] = 0;
	}

	foreach (count; counts) {
		stdout.writeln(count);
	}
}

private
T[] read_array(T)()
{
	auto input = stdin.readln().strip().split();

	T[] result = new T[input.length];

	foreach (index, ref element; input) {
		result[index] = element.to!T();
	}

	return result;
}