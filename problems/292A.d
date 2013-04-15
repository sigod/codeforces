module sigod.codeforces.p292A;

import std.stdio;

void main()
{
	int n;
	stdin.readf(" %s", &n);

	int[] t = new int[n];
	int[] c = new int[n];

	foreach (i; 0 .. n) {
		stdin.readf(" %s %s", &t[i], &c[i]);
	}

	int x, y;
	solve(t, c, x, y);

	stdout.writeln(x, " ", y);
}

void solve(int[] time, int[] count, out int last_send_time, out int max_queue_size)
{
	max_queue_size = int.min;

	int queue_size = 0;
	int current_time = 0;

	foreach (i; 0 .. time.length) {
		queue_size = max(queue_size - (time[i] - current_time), 0) + count[i];

		current_time = time[i];

		if (max_queue_size < queue_size) max_queue_size = queue_size;

		version (unittest) {
			stdout.writeln("queue_size: ", queue_size,
				"; current_time: ", current_time);
		}
	}

	last_send_time = current_time + queue_size;

	if (max_queue_size < queue_size) max_queue_size = queue_size;
}

unittest {
	import std.string;

	int x, y;

	solve([1, 2], [1, 1], x, y);
	assert(x == 3 && y == 1, format("x: %s, y: %s", x, y));

	solve([1000000], [10], x, y);
	assert(x == 1000010 && y == 10, format("x: %s, y: %s", x, y));

	solve([3, 4, 5], [3, 3, 3], x, y);
	assert(x == 12 && y == 7, format("x: %s, y: %s", x, y));
}

private pure
int max(int a, int b)
{
	if (a > b) return a;
	else return b;
}