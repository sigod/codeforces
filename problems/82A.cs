using System;

namespace com.codeforces._82
{
    public static class A
    {
        static void solve()
        {
            int n = RI();

            int[] array = { 1, 1, 1, 1, 1 };
            int i = 0;
            for (; ; )
            {
                if (n <= array[i])
                {
                    break;
                }

                n -= array[i];
                array[i] *= 2;
                
                i++;
                if (i > 4)
                {
                    i = 0;
                }
            }

            string[] names = { "Sheldon", "Leonard", "Penny", "Rajesh", "Howard" };
            Console.Write(names[i]);
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