module sigod.codeforces.p291C;

import std.stdio;

private
enum MASK_INCREMENT = 0x80000000;

void main()
{
	int n, k;
	stdin.readf(" %s %s", &n, &k);

	uint[] ips = new uint[n];

	foreach (ref ip; ips) {
		ubyte b1, b2, b3, b4;
		stdin.readf(" %s.%s.%s.%s", &b1, &b2, &b3, &b4);

		ip = (((((b1 << 8) | b2) << 8) | b3) << 8) | b4;
	}

	uint mask = 0;

	foreach (x; 0 .. 32) {
		mask = (mask >> 1) | MASK_INCREMENT;

		bool[uint] webs;

		foreach (ip; ips) {
			webs[ip & mask] = true;
		}

		if (webs.length == k) {
			stdout.writeln(toIP(mask));
			return;
		}
	}

	stdout.writeln("-1");
}

private
string toIP(uint mask)
{
	ubyte b1, b2, b3, b4;

	b4 = mask & 0xFF;
	mask >>= 8;

	b3 = mask & 0xFF;
	mask >>= 8;

	b2 = mask & 0xFF;
	mask >>= 8;

	b1 = mask & 0xFF;

	return std.string.format("%s.%s.%s.%s", b1, b2, b3, b4);
}