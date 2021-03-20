using BasarBLL.Operation.AdminOperation;
using BasarBLL.Operation.SharedOperation;
using BasarBO.AdminBO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Basar.AdminForm
{
    public partial class frmTeam : System.Web.UI.Page
    {
        #region Team 
         
        
        short getUserId()
        {
            using (LoginAuthentication loginAuthentication = Session["loginAuthentication"] as LoginAuthentication)
            {
                return loginAuthentication.UserId;
            }
        }
        void MsgBox(string msg)
        {
            using (SharedOp sharedOp = new SharedOp())
            {
                sharedOp.MyMessege(upMain, msg);
            }
        }
        void addTeam()
        {
            if (string.IsNullOrEmpty(txtTeamDsecAr.Text.Trim()))
            {
                MsgBox("إسم الفريق بالعربي");
            }
            else if (string.IsNullOrEmpty(txtTeamDsecEn.Text.Trim()))
            {
                MsgBox("إسم الفريق بالانجليزية");
            }
            else if (int.Equals(rblTeamStatus.SelectedIndex, -1))
            {
                MsgBox("حالة الفريق");
            }
            else
            {
                using (Team team = new Team())
                {
                    team.CreationBy = getUserId();
                    team.TeamDsecAr = txtTeamDsecAr.Text.Trim();
                    team.TeamDsecEn = txtTeamDsecEn.Text.Trim();
                    team.TeamOrder = 1;
                    team.TeamStatus = Convert.ToBoolean(rblTeamStatus.SelectedValue.ToLower());
                    team.UpdatedBy = getUserId();
                    if (!string.IsNullOrEmpty(ViewState["TeamId"].ToString()))
                    {
                        team.TeamId = Convert.ToByte(ViewState["TeamId"].ToString());
                    }
                    using (TeamOperation teamOperation = new TeamOperation())
                    {
                        teamOperation.AddTeam(team);
                        ViewState["TeamId"] = team.TeamIdOut;
                        MsgBox(team.MsgOut);
                    }
                }
            }
        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["TeamId"] = string.Empty;
            }
        }
        protected void btnNew_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.Url.PathAndQuery, true);
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            addTeam();
        }
    }
}