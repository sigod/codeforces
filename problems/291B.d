module sigod.codeforces.p291B;

import std.array;
import std.stdio;
import std.string;

void main()
{
	auto result = solve(stdin.readln());

	foreach (r; result) {
		stdout.writeln(r);
	}
}

string[] solve(string input)
{
	input = input.strip();

	auto result = appender!(string[])();

	bool quote = false;
	bool without = false;
	int start;

	foreach (index, c; input) {
		if (quote) {
			if (c == '"') {
				result.put('<' ~ input[start + 1 .. index] ~ '>');
				quote = false;
			}
		}
		else if (without) {
			if (c == ' ') {
				result.put('<' ~ input[start .. index] ~ '>');
				without = false;
			}
		}
		else {
			if (c == '"') {
				quote = true;
				start = index;
			}
			else if (c != ' ') {
				without = true;
				start = index;
			}
		}
	}

	if (without) {
		result.put('<' ~ input[start .. $] ~ '>');
	}

	return result.data();
}

unittest {
	assert(std.algorithm.equal(solve(`"RUn.exe O" "" "   2ne, " two! . " "`), [
			"<RUn.exe O>",
			"<>",
			"<   2ne, >",
			"<two!>",
			"<.>",
			"< >"
		]));
	assert(std.algorithm.equal(solve(`   firstarg   second   ""    `), [
			"<firstarg>",
			"<second>",
			"<>"
		]));
}