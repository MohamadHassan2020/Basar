using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace BasarDalProj.BasarDb
{
    interface IBasarDb
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="SpName"></param>
        /// <param name="sqlparameter"></param>
        /// <returns></returns>
        DataSet GetDataList(string SpName, [Optional] List<SqlParameter> sqlparameter);
        /// <summary>
        /// 
        /// </summary>
        /// <param name="spName"></param>
        /// <param name="sqlparameter"></param>
        /// <returns></returns>
        DataTable GetDataTable(string spName, [Optional] List<SqlParameter> sqlparameter);
        /// <summary>
        /// 
        /// </summary>
        /// <param name="SpName"></param>
        /// <param name="sqlparameter"></param>
        /// <returns></returns>
        int SaveData(string SpName, [Optional] List<SqlParameter> sqlparameter);
        /// <summary>
        /// 
        /// </summary>
        /// <param name="SpName"></param>
        /// <param name="sqlparameter"></param>
        /// <returns></returns>
        SqlDataReader GetDataReader(string SpName, [Optional] List<SqlParameter> sqlparameter);
        /// <summary>
        /// 
        /// </summary>
        /// <param name="SpName"></param>
        /// <param name="sqlparameter"></param>
        /// <returns></returns>
        int GetScalarValue(string SpName, [Optional] List<SqlParameter> sqlparameter);
        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="SpName"></param>
        /// <param name="sqlparameter"></param>
        /// <returns></returns>
        T GetScalarValue<T>(string SpName, [Optional] List<SqlParameter> sqlparameter);
        
    }
}
