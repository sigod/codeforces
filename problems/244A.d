module sigod.codeforces.p244A;

import std.array : split;
import std.conv : to;
import std.stdio;
import std.string : strip;

void main() {
	int n, k;

	read_variables(n, k);

	auto a = read_array!int();
	auto orange = new bool[n * k + 1];

	foreach (ref ai; a) {
		orange[ai] = true;
	}

	int position = 1;

	foreach (ref ai; a) {
		stdout.write(ai);

		int count = 1;
		while (count < n) {
			if (!orange[position]) {
				stdout.write(" ", position);

				orange[position] = true;

				++count;
			}

			++position;
		}

		stdout.writeln();
	}
}

private
void read_variables(S...)(out S args) {
	auto input = stdin.readln().strip().split();

	foreach (index, ref arg; args) {
		arg = input[index].to!(typeof(arg))();
	}
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