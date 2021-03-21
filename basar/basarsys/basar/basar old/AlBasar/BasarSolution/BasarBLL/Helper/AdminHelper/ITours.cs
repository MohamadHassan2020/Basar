using BasarBO.AdminBO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace BasarBLL.Helper.AdminHelper
{
    interface ITours
    {
        void GetTours(DropDownList ddlTour);
        void GetTours(CheckBoxList cblTour);
        int AddTour(Tour tour);
    }
}
