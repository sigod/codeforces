module sigod.codeforces.p298B;

import std.stdio;
import std.string;

private {
	struct Direction
	{
		int l_x = 0;
		int l_y = 0;
		int r_x = 0;
		int r_y = 0;

		ref Direction opOpAssign(string op)(in Direction direction)
			if (op == "+")
		{
			l_x += direction.l_x;
			l_y += direction.l_y;
			r_x += direction.r_x;
			r_y += direction.r_y;

			return this;
		}
	}
}


void main()
{
	int t, sx, sy, ex, ey;
	stdin.readf(" %s %s %s %s %s", &t, &sx, &sy, &ex, &ey);

	string direction;
	stdin.readf(" %s", &direction);
	direction = direction.strip();

	Direction[char] compas;
	compas['E'] = Direction(0, 0, 1, 0);
	compas['S'] = Direction(0, 0, 0, -1);
	compas['W'] = Direction(-1, 0, 0, 0);
	compas['N'] = Direction(0, 1, 0, 0);

	Direction zone = Direction(sx, sy, sx, sy);

	foreach (index, way; direction) {
		zone += compas[way];

		if (zone.l_x <= ex && zone.r_x >= ex
			&& zone.l_y >= ey && zone.r_y <= ey)
		{
			stdout.writeln(index + 1);
			return;
		}
	}

	stdout.writeln("-1");
}