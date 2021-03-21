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
    public class NationalityOperation : IDisposable, INationality
    {
        ~NationalityOperation() { }
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }

        public void GetNationalities(DropDownList ddlNationality)
        {
            using (SharedOp sharedOp = new SharedOp())
            {
                using (DbaOperationClass dbOperation = new DbaOperationClass())
                {
                    DataTable dt = dbOperation.GetDataTable("spGetNationalities");
                    ddlNationality.DataSource = dt;
                    ddlNationality.DataBind();
                    sharedOp.DefaultValueDropDownList("الجنسية", ddlNationality);
                };
            };
        }
    }
}
