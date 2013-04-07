module sigod.codeforces.p294B;

import std.algorithm;
import std.stdio;

struct Book
{
	int t;
	int w;
}

void main()
{
	Book[] books = read_input();

	stdout.writeln(solve(books));
}

Book[] read_input()
{
	int n;
	stdin.readf("%s", &n);
	stdin.readln();

	Book[] books = new Book[n];

	foreach (ref book; books) {
		stdin.readf("%s %s", &(book.t), &(book.w));
		stdin.readln();
	}

	return books;
}

int solve(Book[] books)
{
	books.sort!("a.t != b.t ? a.t > b.t : a.w < b.w")();

	int t = 0;

	foreach (ref book; books) {
		t += book.t;
	}

	int w = 0;

	foreach (ref book; books) {
		if (t - book.t >= w + book.w) {
			t -= book.t;
			w += book.w;
		}
	}

	return t;
}

unittest {
	assert(solve([Book(1, 12), Book(1, 3), Book(2, 15), Book(2, 5), Book(2, 1)]) == 5);
	assert(solve([Book(1, 10), Book(2, 1), Book(2, 4)]) == 3);
}