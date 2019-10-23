using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core
{
    public abstract class DataProvider
    {
        public abstract object ExecuteNonQueryWithOutput(string outputParams, string sqName,
            params object[] parameterValues);
        public abstract int ExecuteNonQuery(string spName, params object[] paramaterValues);
        public abstract DataSet ExecuteDataset(string spName, params object[] parameterValues);
        public abstract object ExecuteScalar(string spName, params object[] parameterValues);
        public abstract IDataReader ExecuteReader(string spName, params object[] parameterValues);

        private static DataProvider instance = null;
        public static DataProvider Instance
        {
            get {
                if (instance == null)
                    instance = new SqlDataProvider("connectionString");
                return instance;
            }
        }
    }
}
