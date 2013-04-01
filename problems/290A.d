module sigod.codeforces.p290A;

import std.stdio;

string[] array = [
	"",
	"Washington",
	"Adams",
	"Jefferson",
	"Madison",
	"Monroe",
	"Adams",
	"Jackson",
	"Van Buren",
	"Harrison",
	"Tyler",
	"Polk",
	"Taylor",
	"Fillmore",
	"Pierce",
	"Buchanan",
	"Lincoln",
	"Johnson",
	"Grant",
	"Hayes",
	"Garfield",
	"Arthur",
	"Cleveland",
	"Harrison",
	"Cleveland",
	"McKinley",
	"Roosevelt",
	"Taft",
	"Wilson",
	"Harding",
	"Coolidge",
	"Hoover",
	"Roosevelt",
	"Truman",
	"Eisenhower",
	"Kennedy",
	"Johnson",
	"Nixon",
	"Ford",
	"Carter",
	"Reagan",
	"Bush",
	"Clinton"
];

void main()
{
	int a;
	stdin.readf("%s", &a);

	stdout.writeln(array[a]);
}