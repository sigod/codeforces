using System;
using System.Collections.Generic;
using System.Linq;

namespace com.codeforces._159
{
    public static class B
    {
        static void solve()
        {
            int N = RI();
            int M = RI();

            Dictionary<int, List<int>> f = new Dictionary<int,List<int>>();
            for (int i = 0; i < N; i++)
            {
                int color = RI();
                int diameter = RI();

                if (!f.ContainsKey(diameter))
                {
                    f.Add(diameter, new List<int>());
                }

                f[diameter].Add(color);
            }

            Dictionary<int, List<int>> k = new Dictionary<int, List<int>>();
            for (int i = 0; i < M; i++)
            {
                int color = RI();
                int diameter = RI();

                if (!k.ContainsKey(diameter))
                {
                    k.Add(diameter, new List<int>());
                }

                k[diameter].Add(color);
            }

            int U = 0, V = 0;
            foreach (var key in f.Keys)
            {
                if (k.ContainsKey(key))
                {
                    A(f[key], k[key], ref U, ref V);
                }
            }

            Console.Write(U.ToString() + " " + V.ToString());
        }

        static void A(List<int> f, List<int> k, ref int U, ref int V)
        {
            f.Sort();
            k.Sort();

            int t = 0;
            for (int i = 0, j = 0; i < f.Count && j < k.Count; )
            {
                if (f[i] == k[j])
                {
                    t++;
                    U++;
                    V++;
                    i++;
                    j++;
                }
                else if (f[i] < k[j])
                {
                    i++;
                }
                else
                {
                    j++;
                }
            }

            U += Math.Max(0, Math.Min(f.Count - t, k.Count - t));
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