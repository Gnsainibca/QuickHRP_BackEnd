using System.Linq.Expressions;

namespace QuickHRP.DataAccess.Contract
{
    public interface IRepository<T> : IDisposable where T : class
    {
        T GetSingleOrDefault(Expression<Func<T, bool>>? filter = null);
        void Insert(T entity);
        void Update(T entity);
        void Delete(T entity);
        void DeleteAll(IEnumerable<T> entity);
        IQueryable<T> All();
    }
}
