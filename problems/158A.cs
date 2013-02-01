using System;

namespace com.codeforces._158
{
    public static class A
    {
        static void solve()
        {
            int n = RI();
            int k = RI();

            int[] a = new int[n];
            for (int i = 0; i < n; i++)
            {
                a[i] = RI();
            }

            int answer = 0;
            for (int i = 0; i < n; i++)
            {
                if (a[i] < a[k-1] || a[i] < 1)
                {
                    break;
                }

                answer++;
            }

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