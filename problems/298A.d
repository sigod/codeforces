module sigod.codeforces.p298A;

import std.stdio;

void main()
{
	stdin.readln();
	string road = stdin.readln();


	int r_start = -1;
	int r_end = -1;
	int l_start = -1;
	int l_end = -1;
	
	foreach (index, c; road) {
		if (c == 'R') {
			r_end = index + 1;

			if (r_start == -1) r_start = index + 1;
		}
		else if (c == 'L') {
			l_end = index + 1;

			if (l_start == -1) l_start = index + 1;
		}
	}


	int start = -1;
	int target = -1;

	if (l_start == -1) {
		start = r_start;
		target = r_end + 1;
	}
	else if (r_start == -1) {
		start = l_end;
		target = l_start - 1;
	}
	else {
		start = r_start;
		target = l_start - 1;
	}

	stdout.writeln(start, " ", target);
}