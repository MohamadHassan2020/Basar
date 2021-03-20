using BasarBO.AdminBO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace BasarBLL.Helper.AdminHelper
{
    interface ICountry
    {
        int AddCountry(Country country);
        int AddTourCountry(TourCountry tourCountry);
        void GetCountries(DropDownList ddlCountries, short? tourId);
        void GetCountries(CheckBoxList cblCountries);
    }
}
