using System.Data.Entity;

namespace WebApplication5
{
    public class MyDbContext:DbContext // класс enty framework
    {
        public MyDbContext():base ("DbConnection")// название подключения
        { }
        public DbSet<Client> Clients { get; set; }// таблица клиенты
        public DbSet<Founder> Founders { get; set; }// таблица учредители
    }
}