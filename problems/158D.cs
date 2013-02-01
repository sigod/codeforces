using System;

namespace com.codeforces._158
{
    public static class D
    {
        static void solve()
        {
            int n = RI();

            int total = 0;
            int minus = 0;

            int[] t = new int[n];
            for (int i = 0; i < n; i++)
            {
                t[i] = RI();
                total += t[i];

                if (t[i] < 0)
                {
                    minus += t[i];
                }
            }

            if (n < 6 || minus == 0)
            {
                Console.Write(total);
                return;
            }

            int max = total;
            for (int divider = 2; divider < n / 3 + 1; divider++)
            {
                if (n % divider != 0 || n / divider < 3)
                    continue;

                for (int start = 0; start < divider; start++)
                {
                    int current = 0;
                    for (int j = start; j < n; j += divider)
                    {
                        current += t[j];
                    }

                    if (current > max)
                        max = current;
                }
            }

            Console.Write(max);
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