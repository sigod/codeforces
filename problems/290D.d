module sigod.codeforces.p290D;

import std.conv;
import std.stdio;
import std.string;

void main()
{
	string str = stdin.readln().strip();
	int value = stdin.readln().strip().to!int();

	stdout.write(solve(str, value));
}

string solve(string str, int value)
{
	string result;

	foreach (ref ch; str.toLower()) {
		if (ch < value + 97) {
			result ~= (ch ~ "").toUpper();
		}
		else {
			result ~= ch;
		}
	}

	return result;
}

unittest {
	assert(solve("AprilFool", 14) == "AprILFooL");
}