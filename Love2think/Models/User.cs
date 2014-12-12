using System.Linq;

namespace Love2think.Controllers
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class User
    {


        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int User_id { get; set; }
        public string User_name { get; set; }

        public virtual ICollection<Post> Posts { get; set; }



        public User(String Username, List<String> tweets)
        {
            User_name = Username ;
            Posts = Posts ?? new List<Post>();

            Posts =   tweets.Select(s=>new Post(){Tags = s}).ToList();
        }
    }
}
