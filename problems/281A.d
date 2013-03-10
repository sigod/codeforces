module sigod.codeforces.p281A;

import std.stdio;
import std.string;
import std.conv;

void main()
{

	stdout.write(solve(stdin.readln().strip()));
}

string solve(string str)
{
	return toUpper(str[0].to!string) ~ str[1 .. $];
}

unittest {
	assert(solve("ApPLe") == "ApPLe");
	assert(solve("konjac") == "Konjac");
}