using BasarBLL.Helper;
using BasarDAL.DbaOperation;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace BasarBLL.Operation
{
    public class HelperOperation : IHelper,IDisposable
    {

        #region SingleTon
        // 1-private member class 
        private  static HelperOperation instance;
        //2 constraucro private disabled new instance object
        private HelperOperation() { }
        //3 function get instance 
        public static HelperOperation GetInstance() {
            // lock only single instance from class
            lock (mutex)
            {
                // if instance new
                if (instance==null)
                {
                    // make new instance
                    instance = new HelperOperation();
                }
                // exists instance
                return instance;
            }
        }
        //4 threading lock single class instance after threading finish
        private static object mutex = new object();
        #endregion

        ~HelperOperation() { }

        public int ChangeModifyed([Optional] string procedureName, [Optional] List<SqlParameter> sqlparameter)
        {
            using (DbaOperationClass dbOperation = new DbaOperationClass())
            {
                int row = dbOperation.SaveData(procedureName, sqlparameter);
                return row;
            };
        }

        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }
        public DataTable GetDataTable([Optional] string procedureName, [Optional] List<SqlParameter> sqlparameter)
        {
            using (DbaOperationClass dbOperation = new DbaOperationClass())
            {
                DataTable dt = dbOperation.GetDataTable(procedureName, sqlparameter);
                return dt;
            };
        }

        public SqlDataReader GetDataReader([Optional] string procedureName, [Optional] List<SqlParameter> sqlparameter)
        {
            using (DbaOperationClass dbOperation = new DbaOperationClass())
            {
                return dbOperation.GetDataReader(procedureName, sqlparameter);
            };
        }
    }
}
