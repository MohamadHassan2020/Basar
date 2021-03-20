using BasarBO.AdminBO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace BasarBLL.Helper.AdminHelper
{
    interface IIndicator
    {
        void GetIndicator(GridView gvIndicator, byte surveyCategoryId, bool indicatorDivider, byte? yearId, byte? campId, byte? countryId);
        int AddIndicator(Indicator indicator);
    }
}
