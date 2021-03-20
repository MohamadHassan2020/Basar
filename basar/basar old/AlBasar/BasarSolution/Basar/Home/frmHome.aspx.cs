using Basar.BasarClass;
using BasarBLL.Operation;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Basar.Home
{
    public partial class frmHome : System.Web.UI.Page
    {
        #region MyRegion
        void SearchMul()
        {


            using (var civilsysOp = HelperOperation.GetInstance())
            {

                byte? yearId = 2; //!string.IsNullOrEmpty(ddlYear.SelectedValue) &&
                                  //!ddlYear.SelectedValue.Equals("-1") ? yearId = Convert.ToByte(ddlYear.SelectedValue) : null;
                                  /*
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
                                    */

                List<SqlParameter> sqlparm = new List<SqlParameter>()
                    {
                        new SqlParameter("@YearId", yearId),
                        new SqlParameter("@TourId", null),
                        new SqlParameter("@TeamId", null),
                        new SqlParameter("@CountryId", null),
                        new SqlParameter("@CampId", null),
                        new SqlParameter("@SponsorId", null),
                         new SqlParameter("@CampStatusId", null)

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
                using (SharedClass sharedClass = new SharedClass())
                {
                    if (sharedClass.GetIsHome())
                    {
                        SearchMul();
                        GetCampStatusInfo();
                    }
                    
                }
                    
            }


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