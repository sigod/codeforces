module sigod.codeforces.p298C;

import std.algorithm;
import std.stdio;
import std.string;

void main()
{
	string a = stdin.readln().strip();
	string b = stdin.readln().strip();

	size_t a_count = a.count('1');
	if (a_count % 2 == 1) ++a_count;

	size_t b_count = b.count('1');

	stdout.writeln(a_count >= b_count ? "YES" : "NO");
}