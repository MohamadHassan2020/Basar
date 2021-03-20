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
    interface IBasarProj
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="procedureName"></param>
        /// <param name="sqlparameter"></param>
        /// <returns></returns>
        DataTable GetDataTable([Optional] string procedureName, [Optional] List<SqlParameter> sqlparameter);
        /// <summary>
        /// 
        /// </summary>
        /// <param name="procedureName"></param>
        /// <param name="sqlparameter"></param>
        /// <returns></returns>
        int SaveData([Optional] string procedureName, [Optional] List<SqlParameter> sqlparameter);
        /// <summary>
        /// 
        /// </summary>
        /// <param name="procedureName"></param>
        /// <param name="sqlparameter"></param>
        /// <returns></returns>
        SqlDataReader GetDataReader([Optional] string procedureName, [Optional] List<SqlParameter> sqlparameter);
        /// <summary>
        /// 
        /// </summary>
        /// <param name="strDate"></param>
        /// <param name="dateFormat"></param>
        /// <returns></returns>
        #region date time
        DateTime GetDateByFormat(string strDate, string dateFormat);
        /// <summary>
        /// 
        /// </summary>
        /// <param name="gregorianDate"></param>
        /// <param name="dateFormat"></param>
        /// <param name="seprateChar"></param>
        /// <returns></returns>
        string GetUmAlQuraFromGregorian(string gregorianDate, string dateFormat, string seprateChar);
        #endregion
    }
}
