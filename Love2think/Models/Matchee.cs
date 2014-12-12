using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Security.AccessControl;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc.Html;

namespace Love2think.Models
{
    public class Matchee
    {
        public string Username { get; set; }
        public string Tweets { get; set; }

        public Matchee(string uname, string tweets)
        {
        Username = uname;
        Tweets = tweets;
            //List<byte> Tweets = tweets;
        }
    }
}
