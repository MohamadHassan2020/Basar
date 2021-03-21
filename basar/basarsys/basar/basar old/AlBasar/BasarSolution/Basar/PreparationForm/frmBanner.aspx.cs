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
    public partial class frmBanner : System.Web.UI.Page
    {
        #region banner
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

        void GetBannerAttachment()
        {
            using (AnnualCamp annualCamp = new AnnualCamp())
            {
                annualCamp.CampId = !ddlCamps.SelectedValue.Equals(string.Empty) && !ddlCamps.SelectedValue.Equals("-1") ? annualCamp.CampId = Convert.ToInt16(ddlCamps.SelectedValue) : null;
                annualCamp.CountryId = !ddlCountries.SelectedValue.Equals(string.Empty) && !ddlCountries.SelectedValue.Equals("-1") ? annualCamp.CountryId = Convert.ToByte(ddlCountries.SelectedValue) : null;
                annualCamp.TourId = !ddlYear.SelectedValue.Equals(string.Empty) && !ddlToure.SelectedValue.Equals("-1") ? annualCamp.TourId = Convert.ToInt16(ddlToure.SelectedValue) : null;
                annualCamp.YearId = !ddlYear.SelectedValue.Equals(string.Empty) && !ddlYear.SelectedValue.Equals("-1")? annualCamp.YearId=Convert.ToByte(ddlYear.SelectedValue) : null;
                using (BannerAttachmentOperation bannerAttachmentOperation = new BannerAttachmentOperation())
                {
                    gvBannerAttachment.DataSource= bannerAttachmentOperation.GetBannerAttachment(annualCamp);
                    gvBannerAttachment.DataBind();
                }
            };
        }
        void AddBanner()
        {
            if (ddlYear.SelectedValue.Equals(string.Empty) || ddlYear.SelectedValue.Equals("-1"))
            {
                MsgBox("عام الخطة");
            }
            else if (ddlToure.SelectedValue.Equals(string.Empty) || ddlToure.SelectedValue.Equals("-1"))
            {
                MsgBox("الجولة");
            }
            else if (ddlCountries.SelectedValue.Equals(string.Empty) || ddlCountries.SelectedValue.Equals("-1"))
            {
                MsgBox("الدولة");
            }
            else if (ddlCamps.SelectedValue.Equals(string.Empty) || ddlCamps.SelectedValue.Equals("-1"))
            {
                MsgBox("المخيم");
            }
            else
            {
                using (Banner banner = new Banner())
                {
                    banner.AddBy = getUserId();
                    banner.BannerDesc = txtBannerDesc.Text.Trim();
                    banner.BannerStatus = cbBannerStatus.Checked;
                    banner.CampId = Convert.ToInt16(ddlCamps.SelectedValue);
                    banner.CountryId = Convert.ToByte(ddlCountries.SelectedValue);
                    banner.TourId = Convert.ToInt16(ddlToure.SelectedValue);
                    banner.YearId = Convert.ToByte(ddlYear.SelectedValue);
                    using (BannerOperation bannerOperation = new BannerOperation())
                    {
                        bannerOperation.AddBanner(banner);
                        MsgBox(banner.MsgOut);
                    }
                };
            }
        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["AnnualPlanId"] = string.Empty;
                getYears();
                getTours();
            }
        }
        protected void ddlToure_SelectedIndexChanged(object sender, EventArgs e)
        {
            getCountries();
            getCamps();
        }
        protected void ddlCountries_SelectedIndexChanged(object sender, EventArgs e)
        {
            getCamps();
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            AddBanner();
        }

        protected void lbtnSearch_Click(object sender, EventArgs e)
        {
            GetBannerAttachment();
        }

        protected void gvBannerAttachment_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void lbtnClear_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.Url.PathAndQuery, true);
        }
    }
}