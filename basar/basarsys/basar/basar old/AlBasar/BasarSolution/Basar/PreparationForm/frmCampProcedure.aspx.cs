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
    public partial class frmCampProcedure : System.Web.UI.Page
    {
        #region indicator operation
        void getCamps()
        {
            if (!string.IsNullOrEmpty(ddlCountries.SelectedValue))
            {
                byte countryId = Convert.ToByte(ddlCountries.SelectedValue);
                using (CampOperation campOperation = new CampOperation())
                {
                    campOperation.GetCamps(ddlCamps, countryId);
                };
            }
        }
        void getYears()
        {
            using (YearsOperation yearsOperation = new YearsOperation())
            {
                yearsOperation.GetYears(ddlYear);
            }
        }
        void getTeams()
        {
            using (TeamOperation teamOperation = new TeamOperation())
            {
                teamOperation.GetTeams(ddlTeam);
            };
        }
        void getCampMembers()
        {
            using (CampMembersFilter campMembersFilter = new CampMembersFilter())
            {
                campMembersFilter.CampId = Convert.ToInt16(ddlCamps.SelectedValue);
                campMembersFilter.TeamId =!ddlTeam.SelectedValue.Equals("-1") && !ddlTeam.SelectedValue.Equals(string.Empty) ?
                   campMembersFilter.TeamId = Convert.ToInt16(ddlTeam.SelectedValue):null;
                campMembersFilter.YearId = Convert.ToByte(ddlYear.SelectedValue);
                using (CampMembersOperation campMembersOperation = new CampMembersOperation())
                {
                    campMembersOperation.GetCampMembers(gvCampMembers, campMembersFilter);
                };
            }
        }

        void getTeamMemberByTeam()
        {
            if (string.IsNullOrEmpty(ddlTeam.SelectedValue) || string.Equals(ddlTeam.SelectedValue, "-1"))
            {

            }
            else
            {
                short teamId = Convert.ToInt16(ddlTeam.SelectedValue);
                using (TeamMemberOperation teamMemberOperation = new TeamMemberOperation())
                {
                    teamMemberOperation.GetTeamMemberByTeam(cblTeamMembers, teamId);
                };
            }
        }
        void getCountries()
        {
            using (CountryOperation countryOperation = new CountryOperation())
            {
                countryOperation.GetCountries(ddlCountries);
            };
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
        void addCampMembers()
        {
            using (CampMembers campMembers = new CampMembers())
            {
                campMembers.AddBy = getUserId();
                campMembers.CampId = Convert.ToInt16(ddlCamps.SelectedValue);
                campMembers.CountryId = Convert.ToByte(ddlCountries.SelectedValue);
                campMembers.TeamId = Convert.ToInt16(ddlTeam.SelectedValue);
                campMembers.UpdatedBy = getUserId();
                campMembers.YearId = Convert.ToByte(ddlYear.SelectedValue);
                foreach (ListItem iTeamMemberId in cblTeamMembers.Items)
                {
                    campMembers.TeamMemberId = Convert.ToInt16(iTeamMemberId.Value);
                    using (CampMembersOperation campMembersOperation = new CampMembersOperation())
                    {
                        campMembersOperation.AddCampMembers(campMembers);
                    }
                }
                MsgBox(campMembers.MsgOut);
            }
        }
        void getProcedureType(DropDownList ddlProcedureType, string procedureTypeDivider)
        {
            using (ProcedureTypeOperation procedureTypeOperation = new ProcedureTypeOperation())
            {
                procedureTypeOperation.GetProcedureType(ddlProcedureType, procedureTypeDivider);
            };
        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getCountries();
                getTeams();
                getYears();
            }
        }
        protected void ddlCountries_SelectedIndexChanged(object sender, EventArgs e)
        {
            getCamps();
        }

        //protected void ddlTeam_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    getCampMembers();
        //}

        protected void btnSave_Click(object sender, EventArgs e)
        {
            addCampMembers();
        }

        protected void gvCampMembers_DataBound(object sender, EventArgs e)
        {
            foreach (GridViewRow grdRow in gvCampMembers.Rows)
            {
                DropDownList ddlVisa = (DropDownList)grdRow.FindControl("ddlVisa");
                DropDownList ddlPermits = (DropDownList)grdRow.FindControl("ddlPermits");
                DropDownList ddlTickets = (DropDownList)grdRow.FindControl("ddlTickets");
                getProcedureType(ddlVisa, "1");
                getProcedureType(ddlPermits, "2");
                getProcedureType(ddlTickets, "3");
            }
        }

        protected void lbtnFind_Click(object sender, EventArgs e)
        {
            getCampMembers();
        }
    }
}