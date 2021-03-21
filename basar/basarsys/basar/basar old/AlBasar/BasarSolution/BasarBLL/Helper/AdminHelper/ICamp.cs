using BasarBO.AdminBO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace BasarBLL.Helper.AdminHelper
{
    interface ICamp
    {
        int AddCamp(Camp camp);
        void GetCamps(DropDownList ddlCamps,byte countryId);
        void GetCampsPreliminary(DropDownList ddlCamps, byte countryId,byte yearId);
        
    }
}
