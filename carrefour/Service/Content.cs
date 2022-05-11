using Carrefour.Service.Model;
using Microsoft.EntityFrameworkCore;

namespace Carrefour.Service
{
    public class Content : DbContext
    {
        public Content(DbContextOptions<Content> options) : base(options)
        {
        }

        public DbSet<Item> Items { get; set; }

        public DbSet<User> Users { get; set; }

        public DbSet<Bingo> Bingos { get; set; }

        public DbSet<BingoPlayer> BingoPlayers { get; set; }

        public DbSet<Order> Orders { get; set; }

        public DbSet<Product> Products { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<User>().HasData(
                new User { Id = 1, Name = "Domon" },
                new User { Id = 2, Name = "Timmy" },
                new User { Id = 3, Name = "Sunny" },
                new User { Id = 4, Name = "Addison" });

            modelBuilder.Entity<Item>().HasData(
                new Item { Id = 1, Name = "義美牛奶小泡芙(三入)", UserId = 2, Url = "https://online.carrefour.com.tw/tw/1411200700101", Quantity = 2 });

            modelBuilder.Entity<BingoPlayer>()
                .HasOne(p => p.Bingo)
                .WithMany(b => b.Players);

            modelBuilder.Entity<Order>()
                .HasKey(x => new { x.UserId, x.ProductId });

            modelBuilder.Entity<Order>()
                .HasOne(p => p.User)
                .WithMany(b => b.Orders)
                .HasForeignKey(x => x.UserId);

            modelBuilder.Entity<Order>()
                .HasOne(p => p.Product)
                .WithMany(b => b.Orders)
                .HasForeignKey(x => x.ProductId);
        }
    }
}
