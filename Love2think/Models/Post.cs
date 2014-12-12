namespace Love2think.Controllers
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Post
    {
        public int Post_id { get; set; }

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int User_id { get; set; }

        [StringLength(140)]
        public string Tags { get; set; }

        public virtual User User { get; set; }
    }
}
