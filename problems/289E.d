module sigod.codeforces.p289E;

import std.stdio;

void main()
{
	int n;
	stdin.readf("%s", &n);

	int length = get_length(n);
	int div = get(length);

	int result = 0;
	int[] array = new int[n + 1];

	array[0] = 0;
	for (int i = n; i > 0; --i) {
		array[i] = i ^ div;

		if (array[i] > n) {
			div = get(--length);

			array[i] = i ^ div;
		}

		result += array[i] ^ i;
	}

	stdout.writeln(result);
	foreach (ref element; array) {
		stdout.write(element, " ");
	}
}

int get_length(int number)
{
	int result = 0;

	while (number > 0) {
		++result;
		number /= 2;
	}

	return result;
}

int get(int length)
{
	int result = 1;
	int s = 1;

	foreach (i; 1 .. length) {
		s *= 2;
		result += s;
	}

	return result;
}