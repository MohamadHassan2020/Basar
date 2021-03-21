using BasarBO.AdminBO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace BasarBLL.Helper.AdminHelper
{
    interface IBannerAttachment
    {
        int AddBannerAttachment(BannerAttachment bannerAttachment);

        DataTable GetBannerAttachment(AnnualCamp annualCamp);
    }
}
