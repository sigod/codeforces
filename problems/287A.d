module sigod.codeforces.p287A;

import std.stdio;
import std.string;

void main()
{
	bool[4][4] square = read();

	bool answer = solve(square);

	stdout.writeln(answer ? "YES" : "NO");
}

private
bool[4][4] read()
{
	bool[4][4] square;

	foreach (ref line; square) {
		auto tmp = stdin.readln().strip();

		foreach (i; 0 .. 4) {
			line[i] = tmp[i] == '.';
		}
	}

	return square;
}

bool solve(bool[4][4] square)
{
	foreach (i, line; square[0 .. $ - 1]) {
		foreach (j, e; line[0 .. $ - 1]) {
			auto count = e + line[j + 1]
				+ square[i + 1][j] + square[i + 1][j + 1];

			if (count != 2) return true;
		}
	}

	return false;
}

unittest {
	bool[4][4] t1 = [
		[false, false, false, false],
		[true, false, true, true],
		[false, false, false, false],
		[true, true, true, true]
	];

	assert(solve(t1) == true);

	bool[4][4] t2 = [
		[false, false, false, false],
		[true, true, true, true],
		[false, false, false, false],
		[true, true, true, true]
	];

	assert(solve(t2) == false);
}