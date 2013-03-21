module sigod.codeforces.p285C;

import std.algorithm;
import std.conv;
import std.math;
import std.stdio;
import std.string;

void main()
{
	int n;
	stdin.readf("%s", &n);

	stdin.readln();
	long[] a = read_array!(long)();

	sort(a);

	long result = 0;

	foreach (i, ai; a) {
		result += abs(ai - (i + 1));
	}

	stdout.writeln(result);
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