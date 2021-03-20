using BasarBLL.Operation.AdminOperation;
using BasarBLL.Operation.PlanOperation;
using BasarBLL.Operation.SharedOperation;
using BasarBO.AdminBO;
using BasarBO.PlanBO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Basar.PreparationForm
{
    public partial class frmPreliminary : System.Web.UI.Page
    {
        #region indicator operation
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
                sharedOp.MyMessege(upThird, msg);
            }
        }
        int AddPreliminary(Preliminary preliminary)
        {
            using (PreliminaryOperation preliminaryOperation = new PreliminaryOperation())
            {
                return preliminaryOperation.AddPreliminary(preliminary);
            };
        }
        void GetCampsPreliminary()
        {
            if (!string.IsNullOrEmpty(ddlCountries.SelectedValue)
                && !string.IsNullOrEmpty(ddlYear.SelectedValue))
            {
                byte countryId = Convert.ToByte(ddlCountries.SelectedValue);
                byte yearId = Convert.ToByte(ddlYear.SelectedValue);
                using (CampOperation campOperation = new CampOperation())
                {
                    campOperation.GetCampsPreliminary(ddlCamps, countryId, yearId);
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

        void getCountries()
        {
            using (CountryOperation countryOperation = new CountryOperation())
            {
                countryOperation.GetCountries(ddlCountries);
            };
        }
        void getIndicator()
        {
            if (string.IsNullOrEmpty(ddlSurveyCategory.SelectedValue)
                || string.Equals(ddlSurveyCategory.SelectedValue, "-1")
                || rblIndicatorDivider.SelectedIndex == -1)
            {
                MsgBox("الفئة والمؤشر");
            }
            else
            {
                byte surveyCategoryId = Convert.ToByte(ddlSurveyCategory.SelectedValue);
                bool indicatorDivider = Convert.ToBoolean(rblIndicatorDivider.SelectedValue);
                byte? yearId = !ddlYear.SelectedValue.Equals(string.Empty)
                    && !ddlYear.SelectedValue.Equals("-1") ? yearId = Convert.ToByte(ddlYear.SelectedValue):null;
                byte? campId = !ddlCamps.SelectedValue.Equals(string.Empty)
                    && !ddlCamps.SelectedValue.Equals("-1") ? campId = Convert.ToByte(ddlCamps.SelectedValue) : null;
                byte? countryId = !ddlCountries.SelectedValue.Equals(string.Empty)
                    && !ddlCountries.SelectedValue.Equals("-1") ? countryId = Convert.ToByte(ddlCountries.SelectedValue) : null;
                using (IndicatorOperation indicatorOperation = new IndicatorOperation())
                {
                    indicatorOperation.GetIndicator(gvIndicator, surveyCategoryId, indicatorDivider,yearId,campId,countryId);
                }
            }
        }
        void getSurveyCategory()
        {
            using (SurveyCategoryOperation surveyCategoryOperation = new SurveyCategoryOperation())
            {
                surveyCategoryOperation.GetSurveyCategory(ddlSurveyCategory);
            }
        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getCountries();
                getYears();
                getSurveyCategory();
            }
        }
        protected void ddlCountries_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetCampsPreliminary();
        }

        protected void btnFind_Click(object sender, EventArgs e)
        {
            getIndicator();
        }

        protected void btnNew_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect(Request.Url.PathAndQuery, true);
        }

        protected void btnSave_ServerClick(object sender, EventArgs e)
        {
            if (ddlCamps.SelectedValue.Equals(string.Empty) || ddlCamps.SelectedValue.Equals("-1"))
            {
                MsgBox("المخيم");
            }
            else if (ddlCountries.SelectedValue.Equals(string.Empty) || ddlCountries.SelectedValue.Equals("-1"))
            {
                MsgBox("الدولة");
            }
            else if (ddlSurveyCategory.SelectedValue.Equals(string.Empty) || ddlSurveyCategory.SelectedValue.Equals("-1"))
            {
                MsgBox("المؤشر");
            }
            else if (ddlYear.SelectedValue.Equals(string.Empty) || ddlYear.SelectedValue.Equals("-1"))
            {
                MsgBox("عام الخطة");
            }
            else if (rblIndicatorDivider.SelectedValue.Equals(string.Empty))
            {
                MsgBox("الفئة");
            }
            else
            {
                foreach (GridViewRow grdRow in gvIndicator.Rows)
                {
                    TextBox txtMissingNumber = (TextBox)grdRow.FindControl("txtMissingNumber");
                    TextBox txtAvailableNumber = (TextBox)grdRow.FindControl("txtAvailableNumber");
                    TextBox txtCampIndicatorMemo = (TextBox)grdRow.FindControl("txtCampIndicatorMemo");
                    Label lblIndicatorNumber = (Label)grdRow.FindControl("lblIndicatorNumber");
                    Label lblIndicatorId = (Label)grdRow.FindControl("lblIndicatorId");
                    RadioButtonList rblCampIndicatorStatus = (RadioButtonList)grdRow.FindControl("rblCampIndicatorStatus");
                    using (Preliminary preliminary = new Preliminary())
                    {
                        preliminary.AddBy = getUserId();
                        preliminary.AvailableNumber = !txtAvailableNumber.Text.Trim().Equals(string.Empty) ?
                            Convert.ToInt16(txtAvailableNumber.Text.Trim()) : Convert.ToInt16(0);
                        preliminary.CampId = Convert.ToInt16(ddlCamps.SelectedValue);
                        preliminary.CampIndicatorMemo = txtCampIndicatorMemo.Text.Trim();
                        preliminary.CampIndicatorStatus = rblCampIndicatorStatus.SelectedValue;
                        preliminary.CountryId = Convert.ToByte(ddlCountries.SelectedValue);
                        preliminary.IndicatorId = Convert.ToInt16(lblIndicatorId.Text);
                        preliminary.IndicatorDivider = Convert.ToBoolean(rblIndicatorDivider.SelectedValue);
                        preliminary.MissingNumber = !txtMissingNumber.Text.Trim().Equals(string.Empty) ?
                              Convert.ToInt16(txtMissingNumber.Text.Trim()) : Convert.ToInt16(0);
                        preliminary.RequiredNumber = !lblIndicatorNumber.Text.Trim().Equals(string.Empty) ?
                           Convert.ToInt16(lblIndicatorNumber.Text.Trim()) : Convert.ToInt16(0);
                        preliminary.SurveyCategoryId = Convert.ToByte(ddlSurveyCategory.SelectedValue);
                        preliminary.UpdatedBy = getUserId();
                        preliminary.YearId = Convert.ToByte(ddlYear.SelectedValue);
                        int row =AddPreliminary(preliminary);
                        if (row>0)
                        {
                            MsgBox("تم الحفظ");
                        }
                    }

                }
            }
        }
    }
}