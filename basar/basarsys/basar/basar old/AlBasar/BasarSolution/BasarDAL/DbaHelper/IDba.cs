using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace BasarDAL.DbaHelper
{
    interface IDba
    {
        DataSet GetDataList(string SpName, [Optional] List<SqlParameter> sqlparameter);
        DataTable GetDataTable(string spName, [Optional] List<SqlParameter> sqlparameter);
        int SaveData(string SpName, [Optional] List<SqlParameter> sqlparameter);
        SqlDataReader GetDataReader(string SpName, [OptionalAttribute] List<SqlParameter> sqlparameter);
        int GetScalarValue(string SpName, [OptionalAttribute] List<SqlParameter> sqlparameter);
        T GetScalarValue<T>(string SpName, [OptionalAttribute] List<SqlParameter> sqlparameter);
         
    }
}
