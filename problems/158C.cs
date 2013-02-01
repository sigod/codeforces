using System;
using System.Collections.Generic;

namespace com.codeforces._158
{
    public static class C
    {
        static List<string> dir = new List<string>();

        static void solve()
        {
            int n = Convert.ToInt32(RL());
            
            for (int i = 0; i < n; i++)
            {
                string command = RL();

                if (command == "pwd")
                {
                    pwd();
                }
                else
                {
                    cd(command.Split(' ')[1]);
                }
            }
        }

        static void pwd()
        {
            Console.Write('/');

            for (int i = 0; i < dir.Count; i++)
            {
                Console.Write(dir[i] + "/");
            }

            Console.WriteLine();
        }

        static void cd(string path)
        {
            string[] folders = path.Split('/');

            // absolute path: /...
            int startIndex = 0;
            if (folders[0] == "")
            {
                dir.Clear();
                startIndex = 1;

                // path: /
                if (folders[1] == "")
                {
                    return;
                }
            }

            for (int i = startIndex; i < folders.Length; i++)
            {
                if (folders[i] == "..")
                {
                    dir.RemoveAt(dir.Count - 1);
                }
                else
                {
                    dir.Add(folders[i]);
                }
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