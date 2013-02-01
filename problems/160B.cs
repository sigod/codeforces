using System;
using System.Collections.Generic;
using System.Linq;

namespace com.codeforces._160
{
    public static class B
    {
        static void solve()
        {
            int n = Convert.ToInt32(RL());
            string n2 = RL();

            string part1 = n2.Substring(0, n);
            string part2 = n2.Substring(n);

            var p1 = part1.OrderBy(e => e).ToArray();
            var p2 = part2.OrderBy(e => e).ToArray();

            int m = 0;
            int b = 0;
            for (int i = 0; i < n; i++)
            {
                if (p1[i] < p2[i])
                {
                    m++;
                }
                else if (p1[i] > p2[i])
                {
                    b++;
                }
            }

            if ((m == 0 || b == 0) && m + b == n)
            {
                Console.Write("YES");
            }
            else
            {
                Console.Write("NO");
            }
        }

        public static void Main()
        {
#if !ONLINE_JUDGE
            Console.SetIn(new System.IO.StreamReader("input.txt"));
            System.IO.StreamWriter fout = new System.IO.StreamWriter("output.txt");
            Console.SetOut(fout);
#endif
            solve();
#if !ONLINE_JUDGE
            fout.Flush();
            fout.Close();
#endif
        }

        public static string RL()
        {
            return Console.ReadLine();
        }

        public static int RI()
        {
            int c;
            do
            {
                c = Console.Read();
            }
            while ((c < '0' || c > '9') && c != '-');

            int sign = 1;
            if (c == '-')
            {
                sign = -1;
                c = Console.Read();
            }

            int value = 0;
            do
            {
                value = value * 10 + c - '0';
                c = Console.Read();
            }
            while (c >= '0' && c <= '9');

            return value * sign;
        }
    }
}