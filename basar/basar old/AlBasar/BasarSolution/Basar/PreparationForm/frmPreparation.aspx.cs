using Basar.Models;
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
    public partial class frmPreparation : System.Web.UI.Page
    {
        #region preparation
        #region New 

        void GetCampStatus()
        {
            using (var civilsysOp = HelperOperation.GetInstance())
            {
                ddlCampStatus.DataSource = civilsysOp.GetDataTable("spGetCampStatus");
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
            using (SponsorOperation sponsorOperation = new SponsorOperation())
            {
                sponsorOperation.GetSponsors(ddlSponosr);
            }
        }
        void getYears()
        {
            using (YearsOperation yearsOperation = new YearsOperation())
            {
                yearsOperation.GetYears(ddlYear);
            }
        }
        void getTours()
        {
            using (ToursOperation toursOperation = new ToursOperation())
            {
                toursOperation.GetTours(ddlToure);
            }
        }
        void getCountries()
        {
            if (!string.IsNullOrEmpty(ddlToure.SelectedValue) && !string.Equals(ddlToure.SelectedValue, "-1"))
            {
                short tourId = Convert.ToInt16(ddlToure.SelectedValue);
                using (CountryOperation countryOperation = new CountryOperation())
                {
                    countryOperation.GetCountries(ddlCountries, tourId);
                };
            }
        }
        void getCamps()
        {
            if (!string.IsNullOrEmpty(ddlCountries.SelectedValue) && !ddlCountries.SelectedValue.Equals("-1"))
            {
                byte countryId = Convert.ToByte(ddlCountries.SelectedValue);
                using (CampOperation campOperation = new CampOperation())
                {
                    campOperation.GetCamps(ddlCamps, countryId);
                };
            }
        }
        void getTeams()
        {
            if (string.IsNullOrEmpty(ddlToure.SelectedValue) ||
               string.Equals(ddlToure.SelectedValue, "-1"))
            {

            }
            else
            {
                using (TeamOperation teamOperation = new TeamOperation())
                {
                    short tourId = Convert.ToByte(ddlToure.SelectedValue);
                    teamOperation.GetTeams(ddlTeam, tourId);
                };
            }
        }
        void addAnnualPlan()
        {
            if (string.IsNullOrEmpty(ddlYear.SelectedValue) ||
                string.Equals(ddlYear.SelectedValue, "-1"))
            {
                MsgBox("عام الخطه");
            }
            else if (string.IsNullOrEmpty(ddlCountries.SelectedValue) ||
               string.Equals(ddlCountries.SelectedValue, "-1"))
            {
                MsgBox("الدولة");
            }
            else if (string.IsNullOrEmpty(ddlToure.SelectedValue) ||
              string.Equals(ddlToure.SelectedValue, "-1"))
            {
                MsgBox("الرحلة");
            }
            else if (string.IsNullOrEmpty(ddlTeam.SelectedValue) ||
             string.Equals(ddlTeam.SelectedValue, "-1"))
            {
                MsgBox("الفريق");
            }
            else if (string.IsNullOrEmpty(ddlSponosr.SelectedValue) ||
            string.Equals(ddlSponosr.SelectedValue, "-1"))
            {
                MsgBox("الرعاه");
            }
            else if (string.IsNullOrEmpty(txtStartDate.Text.Trim()) ||
            checkInvalidDate(txtStartDate.Text.Trim()))
            {
                MsgBox("تاريخ بداية المخيم");
            }
            else if (string.IsNullOrEmpty(txtEndDate.Text.Trim()) ||
            checkInvalidDate(txtEndDate.Text.Trim()))
            {
                MsgBox("تاريخ نهاية المخيم");
            }
            else if (string.IsNullOrEmpty(ddlCamps.SelectedValue) ||
               string.Equals(ddlCamps.SelectedValue, "-1"))
            {
                MsgBox("المخيم");
            }
            else if (string.IsNullOrEmpty(ddlCampStatus.SelectedValue) ||
               string.Equals(ddlCampStatus.SelectedValue, "-1"))
            {
                MsgBox("حالة المخيم");
            }
            else if (int.Equals(rblPreliminaryStatus.SelectedIndex, -1))
            {
                MsgBox("الزيارة التحضيرية");
            }
            else
            {
                using (AnnualPlan annualPlan = new AnnualPlan())
                {
                    annualPlan.AnnualPlanAddBy = getUserId();
                    annualPlan.AnnualPlanEndDate = convertToDate(txtEndDate.Text.Trim());
                    if (!string.IsNullOrEmpty(ViewState["AnnualPlanId"].ToString()))
                    {
                        annualPlan.AnnualPlanId = Convert.ToInt32(ViewState["AnnualPlanId"].ToString());
                    }
                    annualPlan.AnnualPlanStartDate = convertToDate(txtStartDate.Text.Trim());
                    annualPlan.AnnualPlanStatus = true;
                    annualPlan.AnnualPlanUpdatedBy = getUserId();
                    annualPlan.CampId = Convert.ToInt16(ddlCamps.SelectedValue);
                    annualPlan.CampStatusId = Convert.ToInt16(ddlCampStatus.SelectedValue);
                    annualPlan.CountryId = Convert.ToByte(ddlCountries.SelectedValue);
                    annualPlan.SponsorId = Convert.ToInt16(ddlSponosr.SelectedValue);
                    annualPlan.TeamId = Convert.ToInt16(ddlTeam.SelectedValue);
                    annualPlan.TourId = Convert.ToInt16(ddlToure.SelectedValue);
                    annualPlan.YearId = Convert.ToByte(ddlYear.SelectedValue);
                    annualPlan.AnnualPlanRemark = txtPreparationRemark.Text.Trim();
                    annualPlan.PreliminaryStatus = Convert.ToBoolean(rblPreliminaryStatus.SelectedValue.ToLower());
                    using (AnnualPlanOperation annualPlanOperation = new AnnualPlanOperation())
                    {
                        int row = annualPlanOperation.AddAnnualPlan(annualPlan);
                        ViewState["AnnualPlanId"] = annualPlan.AnnualPlanIdOut;
                        SearchMul();
                        MsgBox(annualPlan.MsgOut);
                    }
                }
            }
        }
        [Obsolete]
        void getAnnualPlan()
        {
            if (string.IsNullOrEmpty(ddlYear.SelectedValue) ||
                string.Equals(ddlYear.SelectedValue, "-1"))
            {
                MsgBox("عام الخطه");
            }
            else
            {
                byte yearId = Convert.ToByte(ddlYear.SelectedValue);
                using (AnnualPlanOperation annualPlanOperation = new AnnualPlanOperation())
                {
                    annualPlanOperation.GetAnnualPlan(gvAnnualPlan, yearId);
                };
            }
        }

        void SearchMul()
        {


            using (var civilsysOp = HelperOperation.GetInstance())
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
                gvAnnualPlan.DataSource = civilsysOp.GetDataTable("spGetAnnualPlan", sqlparm);
                gvAnnualPlan.DataBind();
            }

        }
        void GetCampStatusInfo()
        {
            using (var civilsysOp = HelperOperation.GetInstance())
            {
                gvCampStatus.DataSource = civilsysOp.GetDataTable("spGetCampStatus");
                gvCampStatus.DataBind();
            }
        }

        #endregion


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["AnnualPlanId"] = string.Empty;
                getSponsors();
                getYears();
                getTours();
                GetCampStatus();
                GetCampStatusInfo();

            }
        }
        protected void btnNew_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.Url.PathAndQuery, true);
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            addAnnualPlan();
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
        }


        protected void gvAnnualPlan_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvAnnualPlan.PageIndex = e.NewPageIndex;
            SearchMul();
        }
        protected void gvAnnualPlan_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cnEdit")
            {
                GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);

                Label lblAnnualPlanId = (Label)row.FindControl("lblAnnualPlanId");
                Label lblYearId = (Label)row.FindControl("lblYearId");
                Label lblTeamId = (Label)row.FindControl("lblTeamId");
                Label lblTourId = (Label)row.FindControl("lblTourId");
                Label lblCountryId = (Label)row.FindControl("lblCountryId");
                Label lblCampId = (Label)row.FindControl("lblCampId");
                Label lblSponsorId = (Label)row.FindControl("lblSponsorId");
                Label lblAnnualPlanRemark = (Label)row.FindControl("lblAnnualPlanRemark");
                Label lblAnnualPlanStartDate = (Label)row.FindControl("lblAnnualPlanStartDate");
                Label lblAnnualPlanEndDate = (Label)row.FindControl("lblAnnualPlanEndDate");
                Label lblPreliminaryStatus = (Label)row.FindControl("lblPreliminaryStatus");
                HiddenField hfCampStatusId = (HiddenField)row.FindControl("hfCampStatusId");

                //checkExistValue(ddlCampStatus, hfCampStatusId.Value);
                if (!string.IsNullOrEmpty(hfCampStatusId.Value))
                {
                    ddlCampStatus.SelectedValue = hfCampStatusId.Value;
                }
                else
                {
                    ddlCampStatus.SelectedValue = "-1";
                }
                getYears();
                checkExistValue(ddlYear, lblYearId.Text.Trim());
                getTours();
                checkExistValue(ddlToure, lblTourId.Text.Trim());
                getCountries();
                checkExistValue(ddlCountries, lblCountryId.Text.Trim());
                getTeams();
                checkExistValue(ddlTeam, lblTeamId.Text.Trim());
                getCamps();
                checkExistValue(ddlCamps, lblCampId.Text.Trim());
                getSponsors();
                checkExistValue(ddlSponosr, lblSponsorId.Text.Trim());
                txtPreparationRemark.Text = lblAnnualPlanRemark.Text.Trim();
                txtStartDate.Text = lblAnnualPlanStartDate.Text.Trim();
                txtEndDate.Text = lblAnnualPlanEndDate.Text.Trim();
                rblPreliminaryStatus.SelectedValue = lblPreliminaryStatus.Text.ToLower();

                ViewState["AnnualPlanId"] = lblAnnualPlanId.Text.Trim();
            }
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

        protected void btnPrint_Click(object sender, EventArgs e)
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

            using (AnnualPlanReportModel annualPlanRepor = AnnualPlanReportModel.GetInstance())
            {
                annualPlanRepor.CampId = campId;
                annualPlanRepor.CampStatusId = campStatusId;
                annualPlanRepor.CountryId = countryId;
                annualPlanRepor.SponsorId = sponsorId;
                annualPlanRepor.TeamId = teamId;
                annualPlanRepor.TourId = tourId;
                annualPlanRepor.YearId = yearId;
                annualPlanRepor.ReportName = "annualreport";

                Session["ANNUALPLAN"] = null;
                Session["ANNUALPLAN"] = annualPlanRepor;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "popup", "window.open('" + "../RPT/frmViewReports.aspx" + "','_blank')", true);

            }
        }

        protected void btnPrintSponsor_Click(object sender, EventArgs e)
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

            using (AnnualPlanReportModel annualPlanRepor = AnnualPlanReportModel.GetInstance())
            {
                annualPlanRepor.CampId = campId;
                annualPlanRepor.CampStatusId = campStatusId;
                annualPlanRepor.CountryId = countryId;
                annualPlanRepor.SponsorId = sponsorId;
                annualPlanRepor.TeamId = teamId;
                annualPlanRepor.TourId = tourId;
                annualPlanRepor.YearId = yearId;
                annualPlanRepor.ReportName = "annualplansponsor";
                Session["ANNUALPLAN"] = null;
                Session["ANNUALPLAN"] = annualPlanRepor;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "popup", "window.open('" + "../RPT/frmViewReports.aspx" + "','_blank')", true);

            }
        }
    }
}