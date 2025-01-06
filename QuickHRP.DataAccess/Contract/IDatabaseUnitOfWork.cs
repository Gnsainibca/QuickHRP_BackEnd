using System.Data;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore.Infrastructure;
using QuickHRP.DataAccess.SQL;

namespace QuickHRP.DataAccess.Contract
{
    public interface IDatabaseUnitOfWork : IDisposable
    {
        IRepository<T> Repository<T>() where T : class;

        Task<int> SaveChangesAsync();

        int SaveChanges();

        DatabaseFacade Database { get; }

        QuickHRPDbContext Context { get; }

        /// <summary>
        /// Execute sp.
        /// </summary>
        /// <param name="storedProcName"></param>
        /// <param name="parameters"></param>
        /// <returns></returns>
        Task<int> ExecuteSQLRaw(string storedProcName, SqlParameter[] parameters);

        /// <summary>
        /// Execute the SP to DB using ado.net
        /// </summary>
        /// <param name="storedProcName"></param>
        /// <param name="loadTables"></param>
        /// <param name="parameters"></param>
        /// <returns></returns>
        Task<DataSet> ExecuteReaderAsync(string storedProcName, int loadTables, Dictionary<string, object> parameters);

        /// <summary>
        /// Get data in data set using ado.net
        /// </summary>
        /// <param name="storedProcName"></param>
        /// <param name="loadTables"></param>
        /// <param name="params"></param> 
        /// <returns></returns>
        Task<(bool, DataSet)> ExecuteSPAsync(string storedProcName, int loadTables, Dictionary<string, object> parameters);

        /// <summary>
        /// Execute the SP to DB using ado.net
        /// </summary>
        /// <param name="storedProcName"></param>
        /// <param name="parameters"></param>
        /// <returns></returns>
        Task<bool> ExecuteNonQueryAsync(string storedProcName, Dictionary<string, object> parameters);
    }
}
