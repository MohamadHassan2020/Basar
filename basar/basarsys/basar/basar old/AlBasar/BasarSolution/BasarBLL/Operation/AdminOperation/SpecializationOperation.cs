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
    public class SpecializationOperation : IDisposable, ISpecialization
    {
        ~SpecializationOperation() { }
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }
        public void GetSpecialization(DropDownList ddlSpecialization)
        {
            using (SharedOp sharedOp = new SharedOp())
            {
                using (DbaOperationClass dbOperation = new DbaOperationClass())
                {
                    DataTable dt = dbOperation.GetDataTable("spGetSpecialization");
                    ddlSpecialization.DataSource = dt;
                    ddlSpecialization.DataBind();
                    sharedOp.DefaultValueDropDownList("التخصص", ddlSpecialization);
                };
            };
        }
    }
}
