using BasarBLL.Helper.AdminHelper;
using BasarBLL.Operation.SharedOperation;
using BasarDAL.DbaOperation;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace BasarBLL.Operation.AdminOperation
{
    public class TeamClassOperation : ITeamClass,IDisposable
    {
        ~TeamClassOperation() { }

        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }

        public void GetTeamClass(DropDownList ddlTeamClass)
        {
            using (SharedOp sharedOp = new SharedOp())
            {
                using (DbaOperationClass dbOperation = new DbaOperationClass())
                {
                    DataTable dt = dbOperation.GetDataTable("spGetTeamClass");
                    ddlTeamClass.DataSource = dt;
                    ddlTeamClass.DataBind();
                    sharedOp.DefaultValueDropDownList("الوظيفه", ddlTeamClass);
                };
            };
        }
    }
}
