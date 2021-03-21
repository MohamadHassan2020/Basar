using BasarBLL.Helper.AdminHelper;
using BasarBLL.Operation.SharedOperation;
using BasarDAL.DbaOperation;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace BasarBLL.Operation.AdminOperation
{
    public class ProcedureTypeOperation : IDisposable, IProcedureType
    {
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }

        public void GetProcedureType(DropDownList ddlProcedureType, string procedureTypeDivider)
        {
            List<SqlParameter> sqlparm = new List<SqlParameter>()
                {
                    new SqlParameter("@ProcedureTypeDivider", procedureTypeDivider)
                };
            using (SharedOp sharedOp = new SharedOp())
            {
                using (DbaOperationClass dbOperation = new DbaOperationClass())
                {
                    DataTable dt = dbOperation.GetDataTable("spGetProcedureType", sqlparm);
                    ddlProcedureType.DataSource = dt;
                    ddlProcedureType.DataBind();
                    sharedOp.DefaultValueDropDownList("------", ddlProcedureType);
                };
            }
        }
    }
}
