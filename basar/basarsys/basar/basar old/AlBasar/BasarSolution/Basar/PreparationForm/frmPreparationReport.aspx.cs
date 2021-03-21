using BasarBLL.Operation;
using BasarBLL.Operation.AdminOperation;
using BasarBLL.Operation.PlanOperation;
using BasarBLL.Operation.SharedOperation;
using BasarBO.AdminBO;
using BasarBO.PlanBO;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Basar.PreparationForm
{
    public partial class frmPreparationReport : System.Web.UI.Page
    {
        HelperOperation helperOperation = HelperOperation.GetInstance();
        #region preparation
        #region New 

        void GetCampStatus()
        {
            using (helperOperation)
            {
                ddlCampStatus.DataSource = helperOperation.GetDataTable("spGetCampStatus");
                ddlCampStatus.DataBind();
            }
        }
        #endregion
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
        void checkExistValue(DropDownList ddlName, string strValue)
        {
            using (SharedOp sharedOp = new SharedOp())
            {
                sharedOp.CheckExistItem(ddlName, strValue);
            }
        }
        void getSponsors()
        {
            using (helperOperation)
            {
                ddlSponosr.DataSource = helperOperation.GetDataTable("spGetSponsors");
                ddlSponosr.DataBind();
            }
            
        }
        void getYears()
        {
            using (helperOperation)
            {
                ddlYear.DataSource = helperOperation.GetDataTable("spGetYears");
                ddlYear.DataBind();
            }
        }
        void getTours()
        {
            using (helperOperation)
            {
                ddlToure.DataSource = helperOperation.GetDataTable("spGetTours");
                ddlToure.DataBind();
            }
        }
        void getCountries()
        {
            using (helperOperation)
            {
                ddlCountries.DataSource = helperOperation.GetDataTable("spGetAllCountries");
                ddlCountries.DataBind();
            }
        }
        void getCamps()
        {
            ddlCamps.DataSource = helperOperation.GetDataTable("spGetAllCamps");
            ddlCamps.DataBind();
        }
        void getTeams()
        {
            ddlTeam.DataSource = helperOperation.GetDataTable("spGetAllTeams");
            ddlTeam.DataBind();
        }
        void GetCampStatusInfo()
        {
            using (helperOperation)
            {
                gvCampStatus.DataSource = helperOperation.GetDataTable("spGetCampStatus");
                gvCampStatus.DataBind();
            }
        }

        void SearchMul()
        {
            using (helperOperation)
            {
                byte? yearId = !string.IsNullOrEmpty(ddlYear.SelectedValue) &&
                    !ddlYear.SelectedValue.Equals("-1") ? yearId = Convert.ToByte(ddlYear.SelectedValue) : null;

                byte? countryId = !string.IsNullOrEmpty(ddlCountries.SelectedValue) &&
                   !ddlCountries.SelectedValue.Equals("-1") ? countryId = Convert.ToByte(ddlCountries.SelectedValue) : null;

                short? tourId = !string.IsNullOrEmpty(ddlToure.SelectedValue) &&
                    !ddlToure.SelectedValue.Equals("-1") ? tourId = Convert.ToInt16(ddlToure.SelectedValue) : null;

                short? teamId = !string.IsNullOrEmpty(ddlTeam.SelectedValue) &&
                   !ddlTeam.SelectedValue.Equals("-1") ? teamId = Convert.ToInt16(ddlTeam.SelectedValue) : null;

                short? campId = !string.IsNullOrEmpty(ddlCamps.SelectedValue) &&
                   !ddlCamps.SelectedValue.Equals("-1") ? campId = Convert.ToInt16(ddlCamps.SelectedValue) : null;

                short? sponsorId = !string.IsNullOrEmpty(ddlSponosr.SelectedValue) &&
                   !ddlSponosr.SelectedValue.Equals("-1") ? sponsorId = Convert.ToInt16(ddlSponosr.SelectedValue) : null;
                short? campStatusId = !string.IsNullOrEmpty(ddlCampStatus.SelectedValue) &&
                   !ddlCampStatus.SelectedValue.Equals("-1") ? campStatusId = Convert.ToInt16(ddlCampStatus.SelectedValue) : null;

                List<SqlParameter> sqlparm = new List<SqlParameter>()
                    {
                        new SqlParameter("@YearId", yearId),
                        new SqlParameter("@TourId", tourId),
                        new SqlParameter("@TeamId", teamId),
                        new SqlParameter("@CountryId", countryId),
                        new SqlParameter("@CampId", campId),
                        new SqlParameter("@SponsorId", sponsorId),
                        new SqlParameter("@CampStatusId", campStatusId)



                    };
                gvAnnualPlan.DataSource = helperOperation.GetDataTable("spGetAnnualPlan", sqlparm);
                gvAnnualPlan.DataBind();
            }

        }


        #endregion


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["AnnualPlanId"] = string.Empty;
                getSponsors();
                getCountries();
                getYears();
                getTours();
                getCamps();
                getTeams();
                GetCampStatus();
                GetCampStatusInfo();
            }
        }
        protected void btnNew_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.Url.PathAndQuery, true);
        }
        protected void ddlCountries_SelectedIndexChanged(object sender, EventArgs e)
        {
            getCamps();
        }
        protected void ddlToure_SelectedIndexChanged(object sender, EventArgs e)
        {
            getCountries();
            getTeams();
            getCamps();
        }
        protected void lbtnSearch_Click(object sender, EventArgs e)
        {
            SearchMul();
        }
        protected void gvAnnualPlan_DataBound(object sender, EventArgs e)
        {
            foreach (GridViewRow grdRow in gvAnnualPlan.Rows)
            {
                Label lblCampStatusImage = (Label)grdRow.FindControl("lblCampStatusImage");
                HiddenField hfCampStatusDescAR = (HiddenField)grdRow.FindControl("hfCampStatusDescAR");
                Image imgStatus = (Image)grdRow.FindControl("imgStatus");
                if (!string.IsNullOrEmpty(lblCampStatusImage.Text))
                {
                    imgStatus.ImageUrl = "../images/" + lblCampStatusImage.Text;
                    imgStatus.ToolTip = hfCampStatusDescAR.Value;
                }
                else
                {
                    imgStatus.ImageUrl = "../images/progress.gif";
                    imgStatus.ToolTip = "غير محدده";
                }
            }
        }
        protected void gvAnnualPlan_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvAnnualPlan.PageIndex = e.NewPageIndex;
            SearchMul();
        }
        protected void gvAnnualPlan_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            /*
            if (e.CommandName == "cnEdit")
            {
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);

                Label lblAnnualPlanId = (Label)row.FindControl("lblAnnualPlanId");
            }
            */
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            SearchMul();
        }

        protected void gvCampStatus_DataBound(object sender, EventArgs e)
        {
            foreach (GridViewRow grdRow in gvCampStatus.Rows)
            {
                HiddenField hfImageStatus_gv = (HiddenField)grdRow.FindControl("hfImageStatus_gv");
                Image imgStatus_gv = (Image)grdRow.FindControl("imgStatus_gv");
                if (!string.IsNullOrEmpty(hfImageStatus_gv.Value))
                {
                    imgStatus_gv.ImageUrl = "../images/" + hfImageStatus_gv.Value;
                }
                else
                {
                    imgStatus_gv.ImageUrl = "../images/progress.gif";
                }
            }
        }

        
    }
}