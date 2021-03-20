using BasarBO.AdminBO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace BasarBLL.Helper.AdminHelper
{
    interface ITeamMember
    {
        int AddTeamMember(TeamMember teamMember);
        void GetTeamMember(GridView gvTeamMember);
        void GetTeamMemberByTeam(CheckBoxList cblTeamMember,short teamId);
        TeamMember GetTeamMemberById(int teamMemberId);
    }
}
