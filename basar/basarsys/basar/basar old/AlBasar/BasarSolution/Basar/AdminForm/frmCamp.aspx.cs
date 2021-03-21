using BasarBLL.Operation;
using BasarBLL.Operation.AdminOperation;
using BasarBLL.Operation.SharedOperation;
using BasarBO.AdminBO;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Basar.AdminForm
{
    public partial class frmCamp : System.Web.UI.Page
    {
        HelperOperation helperOperation = HelperOperation.GetInstance();
        #region new 18-12-2018

        void GetCampsExists()
        {
            using (helperOperation)
            {
                byte? countryId = !string.IsNullOrEmpty(ddlCountry.SelectedValue)
                    && !ddlCountry.SelectedValue.Equals("-1") ? countryId = Convert.ToByte(ddlCountry.SelectedValue) : null;
                List<SqlParameter> sqlparm = new List<SqlParameter>()
                    {
                        new SqlParameter("@CountryId", countryId)
                };
                gvExists.DataSource = helperOperation.GetDataTable("spGetCampsExists", sqlparm);
                gvExists.DataBind();
            }
        }
        #endregion
        #region camp 


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
        void getCountries()
        {
                using (CountryOperation countryOperation = new CountryOperation())
                {
                    countryOperation.GetCountries(ddlCountry);
                };
        }
        void addCamp()
        {
            if (string.IsNullOrEmpty(txtCampDsecAr.Text.Trim()))
            {
                MsgBox("إسم المخيم بالعربي");
            }
            else if (string.IsNullOrEmpty(txtCampDsecEn.Text.Trim()))
            {
                MsgBox("إسم المخيم بالانجليزية");
            }
            else if (int.Equals(rblCampStatus.SelectedIndex, -1))
            {
                MsgBox("حالة المخيم");
            }
            else if (string.Equals(ddlCountry.SelectedValue, "-1" )|| string.IsNullOrEmpty(ddlCountry.SelectedValue))
            {
                MsgBox("دولة المخيم");
            }
            else
            {
                using (Camp camp = new Camp())
                {
                    camp.CampDsecAr = txtCampDsecAr.Text.Trim();
                    camp.CampDsecEn = txtCampDsecEn.Text.Trim();
                    camp.CampOrder = 1;
                    camp.CampStatus = Convert.ToBoolean(rblCampStatus.SelectedValue.ToLower());
                    camp.CreationBy = getUserId();
                    camp.CountryId = Convert.ToByte(ddlCountry.SelectedValue);
                    camp.UpdatedBy = getUserId();
                    if (!string.IsNullOrEmpty(ViewState["CampId"].ToString()))
                    {
                        camp.CampId = Convert.ToByte(ViewState["CampId"].ToString());
                    }
                    using (CampOperation campOperation = new CampOperation())
                    {
                        campOperation.AddCamp(camp);
                        ViewState["CampId"] = camp.CampIdOut;
                        MsgBox(camp.MsgOut);
                    }
                }
            }
        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["CampId"] = string.Empty;
                getCountries();
                GetCampsExists();
            }
        }

        protected void btnNew_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.Url.PathAndQuery, true);
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            addCamp();
            GetCampsExists();
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            GetCampsExists();
        }
        protected void gvExists_DataBound(object sender, EventArgs e)
        {
           
            foreach (GridViewRow grdRow in gvExists.Rows)
            {
                HiddenField hfCampStatus = (HiddenField)grdRow.FindControl("hfCampStatus");
                Image imgStatus = (Image)grdRow.FindControl("imgStatus");
                CheckExistDocument(hfCampStatus.Value, imgStatus, "../images/yes.png", "../images/nosm.png");
            }
            
        }

        public void CheckExistDocument(string value, System.Web.UI.WebControls.Image imgStatus, string imgTrue, string imgFalse)
        {
            if (value.Equals(string.Empty))
            {
                imgStatus.ImageUrl = imgFalse;
            }
            else
            {
                if (value.ToLower().Equals("true"))
                {
                    imgStatus.ImageUrl = imgTrue;
                }
                else
                {
                    imgStatus.ImageUrl = imgFalse;
                }
            }
        }

        protected void gvExists_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            try
            {
                if (e.CommandName == "cnEdit")
                {
                    
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    HiddenField hfCampStatus = (HiddenField)row.FindControl("hfCampStatus");
                    HiddenField hfCampId = (HiddenField)row.FindControl("hfCampId");
                    HiddenField hfCountryId = (HiddenField)row.FindControl("hfCountryId");
                    Label lblCampDsecAr = (Label)row.FindControl("lblCampDsecAr");
                    Label lblCampDsecEn = (Label)row.FindControl("lblCampDsecEn");
                    ViewState["CampId"] = hfCampId.Value;
                    rblCampStatus.SelectedValue = Convert.ToBoolean(hfCampStatus.Value).ToString().ToLower();
                    ddlCountry.SelectedValue = hfCountryId.Value;
                    txtCampDsecAr.Text = lblCampDsecAr.Text;
                    txtCampDsecEn.Text = lblCampDsecAr.Text;
                }
            }
            catch
            {


            }

        }

        protected void gvExists_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

            try
            {
                gvExists.PageIndex = e.NewPageIndex;
                GetCampsExists();
            }
            catch
            { }
        }
    }
}