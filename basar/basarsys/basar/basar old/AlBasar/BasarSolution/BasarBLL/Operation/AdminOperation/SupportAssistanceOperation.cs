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
    public class SupportAssistanceOperation : ISupportAssistance, IDisposable
    {
        ~SupportAssistanceOperation() { }
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }

        public void GetSupportAssistance(DropDownList ddlSupportAssistance)
        {
            using (SharedOp sharedOp = new SharedOp())
            {
                using (DbaOperationClass dbOperation = new DbaOperationClass())
                {
                    DataTable dt = dbOperation.GetDataTable("spGetSupportAssistance");
                    ddlSupportAssistance.DataSource = dt;
                    ddlSupportAssistance.DataBind();
                    sharedOp.DefaultValueDropDownList("مسؤلية", ddlSupportAssistance);
                };
            }
        }
    }
}
