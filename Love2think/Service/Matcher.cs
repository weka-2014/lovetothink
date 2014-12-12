using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
//using Love2think.Models;

namespace Love2think.Controllers
{
    public class Matcher
    {

        public static User UsersPrevPosts(string[] tweets, string name)
        {
            // string uname = name;
            //List<byte> hashes = new List<byte>();
            List<string> Tweets = new List<string>();
            Tweets.AddRange(tweets);
            //foreach (string s in tweets)
            //
            //    string input = s;

            //    //hashes.AddRange(CastToByte(s));
            //    //List<byte> tweethash = castToByte(s).ToList();
            //}
            User uname = new User(name, Tweets);
            PushToDb(uname);
            return uname;
        }

        private static byte[] CastToByte(string s)
        {
            byte[] hashes = Encoding.UTF8.GetBytes(s);
            return hashes;
        }

        public static void PushToDb(User uname)
        {
            string u = uname.User_name;
            using (var context = new DateMatcherDb())
            {
                context.Users.Add(uname);
            }
            //using (var context = new Post())
            //{

            //}
        }
    }

    public class GetMatches
    {

        /// <summary>
        /// Compute the distance between two strings.
        /// </summary>
        public static int LevenshteinDistance(string src, string dest)
        {
            int[,] d = new int[src.Length + 1, dest.Length + 1];
            int i, j, cost;
            char[] str1 = src.ToCharArray();
            char[] str2 = dest.ToCharArray();

            //    // Step 1
            //if (str1.Length == 0)
            //{
            //    return str2;
            //}

            //if (m == 0)
            //{
            //    return n;
            //}


            for (i = 0; i <= str1.Length; i++)
            {
                d[i, 0] = i;
            }
            for (j = 0; j <= str2.Length; j++)
            {
                d[0, j] = j;
            }
            for (i = 1; i <= str1.Length; i++)
            {
                for (j = 1; j <= str2.Length; j++)
                {

                    cost = str1[i - 1] == str2[j - 1] ? 0 : 1;
                    //same as this:
                    //if (str1[i - 1] == str2[j - 1])
                    //    cost = 0;
                    //else
                    //    cost = 1;


                    d[i, j] =
                        Math.Min(
                            d[i - 1, j] + 1, // Deletion
                            Math.Min(
                                d[i, j - 1] + 1, // Insertion
                                d[i - 1, j - 1] + cost)); // Substitution

                    if ((i > 1) && (j > 1) && (str1[i - 1] ==
                                               str2[j - 2]) && (str1[i - 2] == str2[j - 1]))
                    {
                        d[i, j] = Math.Min(d[i, j], d[i - 2, j - 2] + cost);
                    }
                }
            }

            return d[str1.Length, str2.Length];
        }


        public static List<string> Search(
            string word,
            List<string> wordList,
            double fuzzyness)
        {
            // Tests have prove that the !LINQ-variant is about 3 times
            // faster!
            List<string> foundWords =
                (
                    from s in wordList
                    let levenshteinDistance = LevenshteinDistance(word, s)
                    let length = Math.Max(s.Length, word.Length)
                    let score = 1.0 - (double) levenshteinDistance/length
                    where score > fuzzyness
                    select s
                    ).ToList();

            return foundWords;

        }
    }
}