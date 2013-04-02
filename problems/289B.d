module sigod.codeforces.p289B;

import std.array;
import std.conv;
import std.math;
import std.stdio;
import std.string;

void main()
{
	int n, m, d;
	stdin.readf("%s %s %s", &n, &m, &d);
	stdin.readln();

	int[] array = read_array_2_in_1!int(n);

	stdout.writeln(solve(array, d));
}

int solve(int[] array, int d)
{
	int min = int.max;
	int max = int.min;

	foreach (i, ref a; array[0 .. $ - 1]) {
		if (a < min) min = a;
		if (a > max) max = a;

		foreach (j, ref b; array[i + 1 .. $]) {
			if (abs(a - b) % d != 0) return -1;


		}
	}

	int middle = (min + max) / 2;
	middle += d - abs(middle - array[0]) % d;
	
	int result = 0;

	foreach (ref a; array) {
		result += abs(middle - a) / d;
	}

	return result;
}

unittest {
	assert(solve([[2, 4], [6, 8]], 2) == 4);
	assert(solve([[6, 7]], 7) == -1);
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

private
T[] read_array_2_in_1(T)(uint length)
{
	auto result = appender!(T[])();

	foreach (i; 0 .. length) {
		result.put(read_array!T());
	}

	return result.data();
}

private
T[][] read_array_2(T)(uint length)
{
	auto result = new T[][length];

	foreach (i; 0 .. length) {
		result[i] = read_array!T();
	}

	return result;
}