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
    public class TeamCategoryOperation : IDisposable, ITeamCategory
    {
        ~TeamCategoryOperation() { }
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }

        public void GetTeamCategory(DropDownList ddlTeamCategory, byte teamClassId)
        {
            using (SharedOp sharedOp = new SharedOp())
            {
                using (DbaOperationClass dbOperation = new DbaOperationClass())
                {
                    List<SqlParameter> sqlparm = new List<SqlParameter>()
                {
                    new SqlParameter("@TeamClassId", teamClassId)
                    };
                    DataTable dt = dbOperation.GetDataTable("spGetTeamCategory", sqlparm);
                    ddlTeamCategory.DataSource = dt;
                    ddlTeamCategory.DataBind();
                    sharedOp.DefaultValueDropDownList("الفئه", ddlTeamCategory);
                };
            };
        }
    }
}
