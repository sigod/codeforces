module sigod.codeforces.p287B;

import std.stdio;

void main()
{
	long n, k;
	stdin.readf("%s %s", &n, &k);

	long count = solve(n, k);

	stdout.writeln(count);
}

long solve(long n, long k)
{
	if (n == 1) return 0;
	else if (n <= k) return 1;

	long S = s(k - 1, k);
	if (n > S) return -1;
	else if (n == S) return k - 1;

	long min_count;
	long min = long.max;

	long left_count = 1;
	long right_count = k - 1;

	while (left_count < right_count - 1) {
		long middle_count = (left_count + right_count) / 2;
		long middle = s(middle_count, k);

		if (middle < n) {
			left_count = middle_count;
		}
		else {
			right_count = middle_count;

			if (min > middle) {
				min_count = middle_count;
				min = middle;
			}
		}
	}

	return min_count;
}

private
long s(long count, long k)
{
	//long S = (1 + (k - 1)) * (k - 1) / 2 + 1;
	return (k - count + k - 1) * count / 2 + 1;
}

unittest {
	static assert(solve(4, 3) == 2);
	static assert(solve(5, 5) == 1);
	static assert(solve(8, 4) == -1);
}