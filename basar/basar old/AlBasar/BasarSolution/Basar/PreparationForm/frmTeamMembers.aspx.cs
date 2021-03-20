using BasarBLL.Operation.AdminOperation;
using BasarBLL.Operation.SharedOperation;
using BasarBO.AdminBO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Basar.PreparationForm
{
    public partial class frmTeamMembers : System.Web.UI.Page
    {
        #region Support Assistance 

        void getTeamMember()
        {
            using (TeamMemberOperation teamMemberOperation = new TeamMemberOperation())
            {
                teamMemberOperation.GetTeamMember(gvTeamMember);
            }
        }

        void GetNationalities()
        {
            using (NationalityOperation nationalityOperation = new NationalityOperation())
            {
                nationalityOperation.GetNationalities(ddlNationality);
            }
        }

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
        bool checkInvalidDate(string strValue)
        {
            try
            {
                convertToDate(strValue);
                return false;
            }
            catch (Exception)
            {

                return true;
            }
        }
        DateTime convertToDate(string strValue)
        {
            using (SharedOp sharedOp = new SharedOp())
            {
                return sharedOp.GetDateByFormat(strValue, "yyyy-MM-dd");
            }
        }
        void getTeams()
        {

            using (TeamOperation teamOperation = new TeamOperation())
            {
                teamOperation.GetTeams(ddlTeam);
            };
        }

        void getSpecialization()
        {
            using (SpecializationOperation specializationOperation = new SpecializationOperation())
            {
                specializationOperation.GetSpecialization(ddlSpecialization);
            };
        }
        void getTeamClass()
        {
            using (TeamClassOperation teamClassOperation = new TeamClassOperation())
            {
                teamClassOperation.GetTeamClass(ddlTeamClass);
            };
        }
        void getTeamCategory()
        {
            if (!string.IsNullOrEmpty(ddlTeamClass.SelectedValue))
            {
                byte teamClassId = Convert.ToByte(ddlTeamClass.SelectedValue);
                using (TeamCategoryOperation teamCategoryOperation = new TeamCategoryOperation())
                {
                    teamCategoryOperation.GetTeamCategory(ddlTeamCategory, teamClassId);
                };
            }
        }
        void addTeamMember()
        {
            if (string.IsNullOrEmpty(txtTeamMemberNameAr.Text.Trim()))
            {
                MsgBox("الإسم");
            }
            else if (string.IsNullOrEmpty(txtIssuerPlaceAr.Text.Trim()))
            {
                MsgBox("جهة الإصدار");
            }
            else if (string.IsNullOrEmpty(txtDateOfBirth.Text.Trim()))
            {
                MsgBox("تاريخ الميلاد");
            }
            else if (string.Equals(ddlTeam.SelectedValue, "-1") || string.IsNullOrEmpty(ddlTeam.SelectedValue))
            {
                MsgBox("الفريق");
            }
            else if (string.Equals(ddlTeamCategory.SelectedValue, "-1") || string.IsNullOrEmpty(ddlTeamCategory.SelectedValue))
            {
                MsgBox("الفئه");
            }
            else if (string.Equals(ddlSpecialization.SelectedValue, "-1") || string.IsNullOrEmpty(ddlSpecialization.SelectedValue))
            {
                MsgBox("التخصص");
            }
            else if (string.Equals(ddlTeamClass.SelectedValue, "-1") || string.IsNullOrEmpty(ddlTeamClass.SelectedValue))
            {
                MsgBox("الوظيفة");
            }
            else if (string.Equals(ddlNationality.SelectedValue, "-1") || string.IsNullOrEmpty(ddlNationality.SelectedValue))
            {
                MsgBox("الجنسية");
            }
            else if (int.Equals(rblTeamMemberStatus.SelectedIndex, -1))
            {
                MsgBox("حالة العضو");
            }
            else if (checkInvalidDate(txtDateOfBirth.Text.Trim()))
            {
                MsgBox("خطأ في تاريخ الميلاد");
            }
            else if (checkInvalidDate(txtDateOfIssue.Text.Trim()))
            {
                MsgBox("خطأ في تاريخ الإصدار");
            }
            else if (checkInvalidDate(txtExpiryDate.Text.Trim()))
            {
                MsgBox("خطأ في تاريخ");
            }
            else
            {
                using (TeamMember teamMember = new TeamMember())
                {
                    teamMember.AddBy = getUserId();
                    teamMember.DateOfIssue = convertToDate(txtDateOfIssue.Text.Trim());
                    teamMember.ExpiryDate = convertToDate(txtExpiryDate.Text.Trim());
                    teamMember.DateOfBirth = convertToDate(txtDateOfBirth.Text.Trim());
                    teamMember.IssuerPlaceAr = txtIssuerPlaceAr.Text.Trim();
                    teamMember.PassportNumber = txtPassportNumber.Text.Trim();
                    teamMember.SpecializationId = Convert.ToInt16(ddlSpecialization.SelectedValue);
                    teamMember.TeamCategoryId = Convert.ToInt16(ddlTeamCategory.SelectedValue);
                    teamMember.TeamId = Convert.ToInt16(ddlTeam.SelectedValue);
                    teamMember.NationalityId = Convert.ToByte(ddlNationality.SelectedValue);
                    teamMember.TeamMemberNameAr = txtTeamMemberNameAr.Text.Trim();
                    teamMember.UpdatedBy = getUserId();
                    teamMember.TeamMemberStatus = Convert.ToBoolean(rblTeamMemberStatus.SelectedValue);
                    if (!string.IsNullOrEmpty(ViewState["TeamMemberId"].ToString()))
                    {
                        teamMember.TeamMemberId = Convert.ToInt16(ViewState["TeamMemberId"].ToString());
                    }
                    using (TeamMemberOperation teamMemberOperation = new TeamMemberOperation())
                    {
                        teamMemberOperation.AddTeamMember(teamMember);
                        getTeamMember();
                        ViewState["TeamMemberId"] = teamMember.TeamMemberIdOut;
                        MsgBox(teamMember.MsgOut);
                    }
                }
            }
        }
        void GetTeamMemberById(int teamMemberId)
        {
            using (TeamMemberOperation teamMemberOperation = new TeamMemberOperation())
            {
                using (TeamMember teamMember = teamMemberOperation.GetTeamMemberById(teamMemberId))
                {
                    txtDateOfBirth.Text = teamMember.DateOfBirthStr;
                    txtDateOfIssue.Text = teamMember.DateOfIssueStr;
                    txtExpiryDate.Text = teamMember.ExpiryDateStr;
                    txtIssuerPlaceAr.Text = teamMember.IssuerPlaceAr;
                    txtPassportNumber.Text = teamMember.PassportNumber;
                    txtTeamMemberNameAr.Text = teamMember.TeamMemberNameAr;
                    ViewState["TeamMemberId"] = teamMemberId;
                    getTeamClass();
                    if (teamMember.TeamClassId != null)
                    {
                        ddlTeamClass.SelectedValue = teamMember.TeamClassId.ToString();
                    }
                    getTeamCategory();
                    if (teamMember.TeamCategoryId != null)
                    {
                        ddlTeamCategory.SelectedValue = teamMember.TeamCategoryId.ToString();
                    }
                    GetNationalities();
                    if (teamMember.NationalityId != null)
                    {
                        ddlNationality.SelectedValue = teamMember.NationalityId.ToString();
                    }
                    getSpecialization();
                    if (teamMember.SpecializationId != null)
                    {
                        ddlSpecialization.SelectedValue = teamMember.SpecializationId.ToString();
                    }
                    getTeams();
                    if (teamMember.TeamId != null)
                    {
                        ddlTeam.SelectedValue = teamMember.TeamId.ToString();
                    }
                    if (teamMember.TeamMemberStatus != null)
                    {
                        rblTeamMemberStatus.SelectedValue = teamMember.TeamMemberStatus.ToString().ToLower();
                    }
                }
            };
        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["TeamMemberId"] = string.Empty;
                getSpecialization();
                getTeamClass();
                getTeamMember();
                getTeams();
                GetNationalities();
            }
        }
        protected void btnNew_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.Url.PathAndQuery, true);
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            addTeamMember();
        }

        protected void ddlTeamClass_SelectedIndexChanged(object sender, EventArgs e)
        {
            getTeamCategory();
        }

        protected void gvTeamMember_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTeamMember.PageIndex = e.NewPageIndex;
            getTeamMember();
        }

        protected void gvTeamMember_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cnEdit")
            {
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                Label lblTeamMemberId = (Label)row.FindControl("lblTeamMemberId");
                int teamMemberId = Convert.ToInt32(lblTeamMemberId.Text);
                GetTeamMemberById(teamMemberId);
            }
        }
    }
}