using System;

namespace com.codeforces._4
{
    public static class A
    {
        static void solve()
        {
            int w = RI();

            Console.Write(w % 2 == 0 && w != 2 ? "YES" : "NO");
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