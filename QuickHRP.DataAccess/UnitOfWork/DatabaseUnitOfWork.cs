using System.Data;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using QuickHRP.DataAccess.Contract;
using QuickHRP.DataAccess.Repository;
using QuickHRP.DataAccess.SQL;
using QuickHRP.Utility;

namespace QuickHRP.DataAccess.UnitOfWork
{
    public class DatabaseUnitOfWork(QuickHRPDbContext context) : IDatabaseUnitOfWork
    {
        private readonly QuickHRPDbContext _context = context;
        private readonly Dictionary<Type, object> repositories = [];

        public IRepository<T> Repository<T>() where T : class
        {
            if (repositories.Keys.Contains(typeof(T)) == true)
            {
                return repositories[typeof(T)] as IRepository<T>;
            }
            IRepository<T> repo = new Repository<T>(_context);
            repositories.Add(typeof(T), repo);
            return repo;
        }

        public async Task<int> SaveChangesAsync()
        {
            return await _context.SaveChangesAsync();
        }

        public int SaveChanges()
        {
            return _context.SaveChanges();
        }

        public DatabaseFacade Database
        {
            get
            {
                return _context.Database;
            }
        }

        public QuickHRPDbContext Context
        {
            get
            {
                return _context;
            }
        }

        /// <summary>
        /// Execute sp.
        /// </summary>
        /// <param name="storedProcName"></param>
        /// <param name="parameters"></param>
        /// <returns></returns>
        public async Task<int> ExecuteSQLRaw(string storedProcName, SqlParameter[] parameters)
        {
            return await Database.ExecuteSqlRawAsync($"EXEC {storedProcName}", parameters).ConfigureAwait(false);
        }

        /// <summary>
        /// Get data in data set using ado.net
        /// </summary>
        /// <param name="storedProcName"></param>
        /// <param name="loadTables"></param>
        /// <param name="params"></param> 
        /// <returns></returns>
        public async Task<DataSet> ExecuteReaderAsync(string storedProcName, int loadTables, Dictionary<string, object> parameters)
        {
            var connection = Database.GetDbConnection();
            if (connection.State == ConnectionState.Closed) connection.Open();
            try
            {
                using var command = connection.CreateCommand();
                command.CommandText = storedProcName;
                command.CommandType = CommandType.StoredProcedure;

                foreach (var item in parameters)
                {
                    var parameter = command.CreateParameter();
                    parameter.ParameterName = item.Key;
                    parameter.Value = item.Value ?? DBNull.Value;
                    command.Parameters.Add(parameter);
                }

                DataSet dataSet = new();
                using var reader = await command.ExecuteReaderAsync();
                dataSet.Tables.Add();
                dataSet.Tables[0].Load(reader);

                for (int tableCount = 1; tableCount < loadTables; tableCount++)
                {
                    dataSet.Tables.Add();
                    dataSet.Tables[tableCount].Load(reader);
                }
                return dataSet;
            }
            catch { throw; }
            finally
            {
                if (connection.State != ConnectionState.Closed) connection.Close();
            }
        }

        /// <summary>
        /// Get data in data set using ado.net
        /// </summary>
        /// <param name="storedProcName"></param>
        /// <param name="loadTables"></param>
        /// <param name="params"></param> 
        /// <returns></returns>
        public async Task<(bool, DataSet)> ExecuteSPAsync(string storedProcName, int loadTables, Dictionary<string, object> parameters)
        {
            var connection = Database.GetDbConnection();
            if (connection.State == ConnectionState.Closed) connection.Open();
            try
            {
                using var command = connection.CreateCommand();
                command.CommandTimeout = 0;
                command.CommandText = storedProcName;
                command.CommandType = CommandType.StoredProcedure;

                foreach (var item in parameters)
                {
                    var parameter = command.CreateParameter();
                    parameter.ParameterName = item.Key;
                    parameter.Value = item.Value ?? DBNull.Value;
                    command.Parameters.Add(parameter);
                }

                var outputParameter = command.CreateParameter();
                outputParameter.ParameterName = Constant.Database.Param.Status;
                outputParameter.Direction = ParameterDirection.Output;
                outputParameter.DbType = DbType.Boolean;
                command.Parameters.Add(outputParameter);

                DataSet dataSet = new();
                using var reader = await command.ExecuteReaderAsync();
                dataSet.Tables.Add();
                dataSet.Tables[0].Load(reader);

                for (int tableCount = 1; tableCount < loadTables; tableCount++)
                {
                    dataSet.Tables.Add();
                    dataSet.Tables[tableCount].Load(reader);
                }
                return (Convert.ToBoolean(command.Parameters["@status"].Value), dataSet);
            }
            catch { throw; }
            finally
            {
                if (connection.State != ConnectionState.Closed) connection.Close();
            }
        }

        /// <summary>
        /// Execute the SP to DB using ado.net.
        /// </summary>
        /// <param name="storedProcName"></param>
        /// <param name="parameters"></param>
        /// <returns></returns>
        public async Task<bool> ExecuteNonQueryAsync(string storedProcName, Dictionary<string, object> parameters)
        {
            var connection = Database.GetDbConnection();
            if (connection.State == ConnectionState.Closed) connection.Open();
            try
            {
                using var command = connection.CreateCommand();
                command.CommandText = storedProcName;
                command.CommandType = CommandType.StoredProcedure;

                foreach (var item in parameters)
                {
                    var parameter = command.CreateParameter();
                    parameter.ParameterName = item.Key;
                    parameter.Value = item.Value;
                    command.Parameters.Add(parameter);
                }

                var outputParameter = command.CreateParameter();
                outputParameter.ParameterName = Constant.Database.Param.Status;
                outputParameter.Direction = ParameterDirection.Output;
                outputParameter.DbType = DbType.Boolean;
                command.Parameters.Add(outputParameter);

                var result = await command.ExecuteNonQueryAsync();

                return Convert.ToBoolean(command.Parameters["@status"].Value);
            }
            catch { throw; }
            finally
            {
                if (connection.State != ConnectionState.Closed) connection.Close();
            }
        }

        private bool disposed = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!disposed)
            {
                if (disposing)
                {
                    _context.Dispose();
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

