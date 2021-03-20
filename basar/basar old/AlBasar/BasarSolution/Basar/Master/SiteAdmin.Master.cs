using Basar.BasarClass;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Basar.Master
{
    public partial class SiteAdmin : System.Web.UI.MasterPage
    {
        void CheckRights()
        {
            using (SharedClass sharedClass = new SharedClass())
            {
                linkAdmin.Visible = sharedClass.GetIsAdminStatus();
                linkOutline.Visible = sharedClass.GetIsOutlineStatus();
                linkTeam.Visible = sharedClass.GetIsTeamStatus();
                liArchive.Visible= sharedClass.GetIsArchive();
                liReported.Visible = sharedClass.GetIsReported();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["loginAuthentication"] ==null)
            {
                Response.Redirect("../frmLogin.aspx");
            }
            CheckRights();
        }
    }
}