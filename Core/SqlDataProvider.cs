using System.Data;
using Microsoft.ApplicationBlocks.Data;
using System.Configuration;
using System;
using System.Data.SqlClient;

namespace Core
{
    class SqlDataProvider : DataProvider
    {
        private string connectionString;

        public SqlDataProvider(string connectionString)
        {
            this.connectionString = ConfigurationManager.ConnectionStrings[connectionString].ConnectionString;
        }

        private void AssignParameterValues(SqlParameter[] parameters,object[] values)
        {
            if (parameters == null || values == null)
                return;
            if (parameters.Length != values.Length)
                throw new AggregateException("Parameters count do not match values count");
            for (int i = 0, j = parameters.Length; i < j; i++)
                parameters[i].Value = values[i];
        }

        public override DataSet ExecuteDataset(string spName, params object[] parameterValues)
        {
            return SqlHelper.ExecuteDataset(connectionString, spName, parameterValues);
        }

        public override int ExecuteNonQuery(string spName, params object[] paramaterValues)
        {
            return SqlHelper.ExecuteNonQuery(connectionString, spName, paramaterValues);
        }

        public override object ExecuteNonQueryWithOutput(string outputParam, string spName, params object[] parameterValues)
        {
            if (string.IsNullOrEmpty(outputParam))
                throw new ArgumentException("Output params is null or empty");

            SqlParameter[] parameters = SqlHelperParameterCache.GetSpParameterSet(connectionString, spName);
            SqlParameter sqlParameter = null;
            foreach (SqlParameter item in parameters)
                if(String.Compare(item.ParameterName,outputParam,true) == 0)
                {
                    sqlParameter = item;
                    break;
                }
            if (parameters == null) throw new ArgumentException("parameter not found");
            AssignParameterValues(parameters, parameterValues);
            int result = SqlHelper.ExecuteNonQuery(connectionString, CommandType.StoredProcedure, spName, parameters);
            return result > 0 ? sqlParameter.Value : null;
        }

        public override object ExecuteScalar(string spName, params object[] parameterValues)
        {
            return SqlHelper.ExecuteScalar(connectionString, spName, parameterValues);
        }

        public override IDataReader ExecuteReader(string spName, params object[] parameterValues)
        {
            return SqlHelper.ExecuteReader(connectionString, spName, parameterValues);
        }
    }
}
