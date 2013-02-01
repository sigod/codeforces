using System;

namespace com.codeforces._71
{
    public static class A
    {
        static void solve()
        {
            int n = Convert.ToInt32(RL());

            for (int i = 0; i < n; i++)
            {
                string word = RL();
                Console.WriteLine(word.Length > 10 ? abbr(word) : word);
            }
        }

        static string abbr(string word)
        {
            return word[0] + (word.Length - 2).ToString() + word[word.Length - 1];
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