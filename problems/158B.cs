using System;

namespace com.codeforces._158
{
    public static class B
    {
        static void solve()
        {
            int n = RI();

            int[] s = new int[4];
            for (int i = 0; i < n; i++)
            {
                s[RI()-1]++;
            }

            int answer = s[4 - 1];

            answer += s[3 - 1];
            s[1 - 1] -= s[3 - 1];
            if (s[1 - 1] < 0)
                s[1 - 1] = 0;

            answer += (int)(s[2 - 1] / 2);
            s[2 - 1] = s[2 - 1] % 2;
            if (s[2 - 1] > 0)
            {
                answer += 1;

                s[1 - 1] -= 2;
                if (s[1 - 1] < 0)
                    s[1 - 1] = 0;
            }

            answer += (int)(s[1 - 1] / 4);
            if (s[1 - 1] % 4 > 0)
                answer += 1;

            Console.Write(answer);
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

        public static int RI()
        {
            int c;
            do
            {
                c = Console.Read();
            }
            while (c < '0' || c > '9');

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