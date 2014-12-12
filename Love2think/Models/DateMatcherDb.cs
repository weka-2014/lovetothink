namespace Love2think.Controllers
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class DateMatcherDb : DbContext
    {
        public DateMatcherDb()
            : base("name=DateMatcherDb")
        {
        }

        public virtual DbSet<Post> Posts { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<User> Users { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Post>()
                .Property(e => e.Tags)
                .IsFixedLength();

            modelBuilder.Entity<User>()
                .HasMany(e => e.Posts)
                .WithRequired(e => e.User);
        }
    }
}
