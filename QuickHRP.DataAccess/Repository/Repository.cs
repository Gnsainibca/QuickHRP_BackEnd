using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;
using QuickHRP.DataAccess.Contract;
using QuickHRP.DataAccess.SQL;

namespace QuickHRP.DataAccess.Repository
{
    public class Repository<T> : IRepository<T> where T : class
    {
        private readonly QuickHRPDbContext context;
        private readonly DbSet<T> entities;

        public Repository(QuickHRPDbContext context)
        {
            this.context = context;
            entities = context.Set<T>();
        }

        public void Insert(T entity)
        {
            ArgumentNullException.ThrowIfNull(entity);
            entities.Add(entity);
        }

        public void Update(T entity)
        {
            ArgumentNullException.ThrowIfNull(entity);
            entities.Update(entity);
        }

        public void Delete(T entity)
        {
            ArgumentNullException.ThrowIfNull(entity);
            entities.Remove(entity);
        }

        public void DeleteAll(IEnumerable<T> entity)
        {
            ArgumentNullException.ThrowIfNull(entity);
            entities.RemoveRange(entity);
        }

        public IQueryable<T> All()
        {
            return entities.AsQueryable<T>().AsNoTracking();
        }

        public T GetSingleOrDefault(Expression<Func<T, bool>>? filter = null)
        {
            return entities.SingleOrDefault(filter);
        }

        private bool disposed = false;
        protected virtual void Dispose(bool disposing)
        {
            if (!disposed)
            {
                if (disposing)
                {
                    context.Dispose();
                }
            }
            disposed = true;
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}