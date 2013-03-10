module sigod.codeforces.p281B;

import std.conv;
import std.math;
import std.stdio;

void main()
{
	int x, y, n;
	stdin.readf("%s %s %s", &x, &y, &n);

	stdout.write(solve(x, y, n));
}

string solve(int x, int y, int n)
{
	//if (y == 1) return x.to!string ~ "/1";

	double x_y = cast(double)x / cast(double)y;

	double min = double.max;
	int min_a, min_b;

	foreach (int b; 1 .. n + 1) {
		int a;

		if (x_y * b - floor(x_y * b) - 0.5 < 0.0000000001) {
			a = cast(int)(x_y * b);
		}
		else {
			a = cast(int)(x_y * b + 0.5);
		}

		double tmp = abs(x_y - cast(double)a / cast(double)b);

		if (tmp < min) {
			min = tmp;
			min_a = a;
			min_b = b;
		}
	}

	return min_a.to!string ~ "/" ~ min_b.to!string;
}

unittest {
	assert(solve(3, 7, 6) == "2/5");
	assert(solve(7, 2, 4) == "7/2");
}