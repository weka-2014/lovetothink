namespace Love2think.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class init : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Posts",
                c => new
                    {
                        User_id = c.Int(nullable: false),
                        Post_id = c.Int(nullable: false),
                        Tags = c.String(maxLength: 140, fixedLength: true),
                        User_User_id = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.User_id)
                .ForeignKey("dbo.Users", t => t.User_User_id, cascadeDelete: true)
                .Index(t => t.User_User_id);
            
            CreateTable(
                "dbo.Users",
                c => new
                    {
                        User_id = c.Int(nullable: false),
                        User_name = c.String(),
                    })
                .PrimaryKey(t => t.User_id);
            
            CreateTable(
                "dbo.sysdiagrams",
                c => new
                    {
                        diagram_id = c.Int(nullable: false, identity: true),
                        name = c.String(nullable: false, maxLength: 128),
                        principal_id = c.Int(nullable: false),
                        version = c.Int(),
                        definition = c.Binary(),
                    })
                .PrimaryKey(t => t.diagram_id);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Posts", "User_User_id", "dbo.Users");
            DropIndex("dbo.Posts", new[] { "User_User_id" });
            DropTable("dbo.sysdiagrams");
            DropTable("dbo.Users");
            DropTable("dbo.Posts");
        }
    }
}
