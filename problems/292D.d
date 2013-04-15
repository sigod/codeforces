module sigod.codeforces.p292D;

import std.stdio;

private {
	int n, m, k;

	V[][int] v;
	bool[] p;

	int left, right;
}

private
struct V
{
	int line;
	int comp;
}

void main()
{
	stdin.readf(" %s %s", &n, &m);

	p = new bool[n + 1];

	foreach (i; 1 .. m + 1) {
		int a, b;
		stdin.readf(" %s %s", &a, &b);

		v[a] ~= V(i, b);
		v[b] ~= V(i, a);
	}

	stdin.readf(" %s", &k);

	foreach (ki; 0 .. k) {
		stdin.readf(" %s %s", &left, &right);

		stdout.writeln(check());
	}
}

private
int check()
{
	p[] = true;

	int count = 0;

	foreach (comp; 1 .. n + 1) {
		if (!p[comp]) continue;

		++count;

		go(comp);
	}

	return count;
}

private
void go(int current)
{
	p[current] = false;

	foreach (ref vertex; v[current]) {
		if (p[vertex.comp] && (vertex.line < left || vertex.line > right)) {
			go(vertex.comp);
		}
	}
}