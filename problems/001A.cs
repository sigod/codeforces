using System;
using System.IO;

namespace ru.codeforces._1
{
    public static class A
    {
        public static void Solve()
        {
            //string[] d = Console.ReadLine().Split(' ');
            //int n = Convert.ToInt32(d[0]);
            //int m = Convert.ToInt32(d[1]);
            //int a = Convert.ToInt32(d[2]);
            int n = RI(), m = RI(), a = RI();

            long result = n / a + (n % a > 0 ? 1 : 0);
            result *= m / a + (m % a > 0 ? 1 : 0);

            Console.WriteLine(result);
        }

        public static void Main()
        {
#if !ONLINE_JUDGE
            Console.SetIn(new StreamReader("input.txt"));
            StreamWriter fout = new StreamWriter("output.txt");
            Console.SetOut(fout);
#endif
            Solve();
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