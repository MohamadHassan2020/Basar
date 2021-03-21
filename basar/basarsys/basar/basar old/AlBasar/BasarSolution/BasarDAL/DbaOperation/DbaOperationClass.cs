using BasarDAL.DbaHelper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace BasarDAL.DbaOperation
{
   public class DbaOperationClass :IDisposable, IDba
    {
         readonly string connectionString = "Data Source=184.168.194.77;User ID=bssuser;Initial Catalog=Basar2; Password=Basar@123; Connect Timeout=15;Encrypt=False;Packet Size=4096";
        /*readonly string connectionString = @"Data Source=.\SQLEXPRESS;User ID=sa;Initial Catalog=Basar; Password=Mohamad; Connect Timeout=15;Encrypt=False;Packet Size=4096";*/
        // "Persist Security Info=False;User ID=bssuser;Initial Catalog=Basar;Data Source=184.168.194.77";
        //File.ReadAllText(@"C:\Windows\basar.txt", Encoding.UTF8);
        #region Return DataSet (Stroed Procedure Name,[optional] SQL Parameter)
        /// <summary>
        ///Return DataSet (Stroed Procedure Name,[optional] SQL Parameter) 
        /// </summary>
        /// <param name="SpName"></param>
        /// <param name="sqlparameter" Option></param>
        /// <returns></returns>
        public DataSet GetDataList(string SpName, [Optional] List<SqlParameter> sqlparameter)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(SpName, conn))
                {
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    if (sqlparameter != null)
                    {
                        foreach (SqlParameter sqlparam in sqlparameter)
                        {
                            if (sqlparam != null)
                            {
                                da.SelectCommand.Parameters.Add(sqlparam);
                            }
                        }

                    }
                    using (DataSet ds = new DataSet())
                    {
                        da.Fill(ds);
                        return ds;
                    }
                }
            }
        }
        #endregion
        #region Return DataTable (Stroed Procedure Name,[optional] SQL Parameter)
        public DataTable GetDataTable(string spName, [Optional] List<SqlParameter> sqlparameter)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                using (SqlDataAdapter da = new SqlDataAdapter(spName, conn))
                {
                    da.SelectCommand.CommandType = CommandType.StoredProcedure;
                    if (sqlparameter != null)
                    {
                        foreach (SqlParameter sqlparam in sqlparameter)
                        {
                            if (sqlparam != null)
                            {
                                da.SelectCommand.Parameters.Add(sqlparam);
                            }
                        }
                    }

                    using (DataSet ds = new DataSet())
                    {
                        da.Fill(ds);
                        return ds.Tables[0];
                    }
                }
            }
        }

        #endregion
        #region int (Stroed Procedure Name,[optional] SQL Parameter) ExecuteNonQuery
        /// <summary>
        /// Return int (Stroed Procedure Name,[optional] SQL Parameter) ExecuteNonQuery
        /// </summary>
        /// <param name="SpName"></param>
        /// <param name="sqlparameter" option></param>
        /// <returns></returns>
        public int SaveData(string SpName, [Optional] List<SqlParameter> sqlparameter)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(SpName, conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandTimeout = 0;
                if (sqlparameter != null)
                {
                    foreach (SqlParameter sqlparam in sqlparameter)
                    {
                        if (sqlparam != null)
                        {
                            cmd.Parameters.Add(sqlparam);
                        }
                    }
                }
                conn.Open();
                int rowAffected = cmd.ExecuteNonQuery();
                return rowAffected;
            }
        }
        #endregion

        #region SqlDataReader (Stroed Procedure Name,[optional] SQL Parameter) ExecuteReader
        /// <summary>
        /// SqlDataReader (Stroed Procedure Name,[optional] SQL Parameter) ExecuteReader
        /// </summary>
        /// <param name="SpName"></param>
        /// <param name="sqlparameter"></param>
        /// <returns></returns>
        public SqlDataReader GetDataReader(string SpName, [OptionalAttribute] List<SqlParameter> sqlparameter)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            using (SqlCommand cmd = new SqlCommand(SpName, conn))
            {
                cmd.CommandType = CommandType.StoredProcedure;
                if (sqlparameter != null)
                {
                    foreach (SqlParameter sqlparam in sqlparameter)
                    {
                        if (sqlparam != null)
                        {
                            cmd.Parameters.Add(sqlparam);
                        }
                    }
                }
                conn.Open();
                SqlDataReader Reader = cmd.ExecuteReader(CommandBehavior.CloseConnection | CommandBehavior.SingleResult);
                return Reader;
            }
        }
        #endregion
        #region ExecuteScalar (Stroed Procedure Name,[optional] SQL Parameter) ExecuteScalar
        /// <summary>
        /// SqlDataReader (Stroed Procedure Name,[optional] SQL Parameter) ExecuteScalar
        /// </summary>
        /// <param name="SpName"></param>
        /// <param name="sqlparameter"></param>
        /// <returns></returns>
        public int GetScalarValue(string SpName, [OptionalAttribute] List<SqlParameter> sqlparameter)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(SpName, conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (sqlparameter != null)
            {
                foreach (SqlParameter sqlparam in sqlparameter)
                {
                    if (sqlparam != null)
                    {
                        cmd.Parameters.Add(sqlparam);
                    }
                }
            }
            conn.Open();
            int returnCode = (int)cmd.ExecuteScalar();
            return returnCode;
        }

        #endregion
        public T GetScalarValue<T>(string SpName, [OptionalAttribute] List<SqlParameter> sqlparameter)
        {
            SqlConnection conn = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand(SpName, conn);
            cmd.CommandType = CommandType.StoredProcedure;
            if (sqlparameter != null)
            {
                foreach (SqlParameter sqlparam in sqlparameter)
                {
                    if (sqlparam != null)
                    {
                        cmd.Parameters.Add(sqlparam);
                    }
                }
            }
            conn.Open();
            var result = cmd.ExecuteScalar();
            if (Convert.IsDBNull(result))
                return default(T);
            if (result is T) // just unbox
                return (T)result;
            else            // convert
                return (T)Convert.ChangeType(result, typeof(T));
        }

        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }

        ~DbaOperationClass() { }
        
    }
}
