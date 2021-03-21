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
    public partial class frmCountry : System.Web.UI.Page
    {
        #region country 
        
        void getTours()
        {
            using (ToursOperation toursOperation = new ToursOperation())
            {
                toursOperation.GetTours(ddlToure);
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
        void addCountry()
        {
            if (string.IsNullOrEmpty(txtCountryDesc.Text.Trim()))
            {
                MsgBox("إسم الدولة بالعربي");
            }
            else if (string.IsNullOrEmpty(txtCountryDescEn.Text.Trim()))
            {
                MsgBox("إسم لدولة بالانجليزية");
            }
            else if (string.Equals(ddlToure.SelectedValue, "-1") || string.IsNullOrEmpty(ddlToure.SelectedValue))
            {
                MsgBox("الرحلة");
            }
            else
            {
                using (Country country = new Country())
                {
                    country.CountryDsecAr = txtCountryDesc.Text.Trim();
                    country.CountryDsecEn = txtCountryDescEn.Text.Trim();
                    country.CountryOrder = 1;
                    country.CountryStatus = true;
                    country.CreationBy = getUserId();
                    country.TourId = Convert.ToInt16(ddlToure.SelectedValue);
                    country.UpdatedBy = getUserId();
                    if (!string.IsNullOrEmpty(ViewState["CountryId"].ToString()))
                    {
                        country.CountryId = Convert.ToByte(ViewState["CountryId"].ToString());
                    }
                    using (CountryOperation countryOperation = new CountryOperation())
                    {
                        countryOperation.AddCountry(country);
                        ViewState["CountryId"] = country.CountryIdOut;
                        MsgBox(country.MsgOut);
                    }
                }
            }
        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["CountryId"] = string.Empty;
                getTours();
            }
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.Url.PathAndQuery, true);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            addCountry();
        }
    }
}