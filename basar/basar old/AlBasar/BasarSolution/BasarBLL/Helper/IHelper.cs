using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace BasarBLL.Helper
{
    interface IHelper
    {
        DataTable GetDataTable([OptionalAttribute] string procedureName, [OptionalAttribute] List<SqlParameter> sqlparameter);
        int ChangeModifyed([Optional] string procedureName, [Optional] List<SqlParameter> sqlparameter);
        SqlDataReader GetDataReader([OptionalAttribute] string procedureName, [OptionalAttribute] List<SqlParameter> sqlparameter);

        
    }
}
