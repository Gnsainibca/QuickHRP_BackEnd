using Microsoft.EntityFrameworkCore;
using QuickHRP.Entities;
using QuickHRP.Entities.Hospital;
using QuickHRP.Entities.Master;

namespace QuickHRP.DataAccess.SQL
{
    public class QuickHRPDbContext : DbContext
    {
        public QuickHRPDbContext(DbContextOptions<QuickHRPDbContext> options) : base(options)
        {
        }

        public DbSet<MasterData> MasterData { get; set; }
        public DbSet<MasterType> MasterType { get; set; }
        public DbSet<HospitalRegistration> HospitalRegistration { get; set; }
    }
}
