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
    public partial class frmIndicator : System.Web.UI.Page
    {
        #region Indicator 


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
        void getSurveyCategory()
        {
            using (SurveyCategoryOperation surveyCategoryOperation = new SurveyCategoryOperation())
            {
                surveyCategoryOperation.GetSurveyCategory(ddlSurveyCategory);
            }
        }
        void addIndicator()
        {
            if (string.IsNullOrEmpty(txtIndicatorIdDescAr.Text.Trim()))
            {
                MsgBox("إسم البند بالعربي");
            }
            else if (string.IsNullOrEmpty(txtIndicatorIdDescEn.Text.Trim()))
            {
                MsgBox("إسم البند بالانجليزية");
            }
            else if (string.IsNullOrEmpty(txtIndicatorNumber.Text.Trim()))
            {
                MsgBox("العدد المقترح");
            }
            else if (string.Equals(ddlSurveyCategory.SelectedValue, "-1") || string.IsNullOrEmpty(ddlSurveyCategory.SelectedValue))
            {
                MsgBox("فئة البند");
            }
            else if (int.Equals(rblIndicatorStatus.SelectedIndex, -1))
            {
                MsgBox("حالة البند");
            }
            else if (int.Equals(rblIndicatorDivider.SelectedIndex, -1))
            {
                MsgBox("نوع البند");
            }
            else
            {
                using (Indicator indicator = new Indicator())
                {
                    indicator.CreationBy = getUserId();
                    indicator.IndicatorDivider = Convert.ToBoolean(rblIndicatorDivider.SelectedValue.ToLower());
                    indicator.IndicatorDescAr = txtIndicatorIdDescAr.Text.Trim();
                    indicator.IndicatorDescEn = txtIndicatorIdDescEn.Text.Trim();
                    indicator.IndicatorOrder = 1;
                    indicator.IndicatorNumber = Convert.ToInt32(txtIndicatorNumber.Text.Trim());
                    indicator.IndicatorStatus= Convert.ToBoolean(rblIndicatorStatus.SelectedValue.ToLower());
                    indicator.SurveyCategoryId = Convert.ToByte(ddlSurveyCategory.SelectedValue);
                    indicator.UpdatedBy = getUserId();
                    if (!string.IsNullOrEmpty(ViewState["IndicatorId"].ToString()))
                    {
                        indicator.IndicatorId = Convert.ToByte(ViewState["IndicatorId"].ToString());
                    }
                    using (IndicatorOperation indicatorOperation = new IndicatorOperation())
                    {
                        indicatorOperation.AddIndicator(indicator);
                        ViewState["IndicatorId"] = indicator.IndicatorIdOut;
                        MsgBox(indicator.MsgOut);
                    }
                }
            }
        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["IndicatorId"] = string.Empty;
                getSurveyCategory();


            }
        }
        protected void btnNew_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.Url.PathAndQuery, true);
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            addIndicator();
        }
    }
}