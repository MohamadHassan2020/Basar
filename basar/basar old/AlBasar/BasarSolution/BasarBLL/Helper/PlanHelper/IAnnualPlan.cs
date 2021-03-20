using BasarBO.PlanBO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace BasarBLL.Helper.PlanHelper
{
    interface IAnnualPlan
    {
        int AddAnnualPlan(AnnualPlan annualPlan);
        void GetAnnualPlan(GridView gvAnnualPlan, byte yearId);
    }
}
