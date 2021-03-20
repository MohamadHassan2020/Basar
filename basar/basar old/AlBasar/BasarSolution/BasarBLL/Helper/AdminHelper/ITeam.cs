using BasarBO.AdminBO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace BasarBLL.Helper.AdminHelper
{
    interface ITeam
    {
        void GetTeams(DropDownList ddlTeam,short? tourId);
        int AddTeam(Team team);
    }
}
