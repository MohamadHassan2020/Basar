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
    public partial class frmSurveyCategory : System.Web.UI.Page
    {
        #region Survey Category 
         
        
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
        void addSurveyCategory()
        {
            if (string.IsNullOrEmpty(txtSurveyCategoryDescAr.Text.Trim()))
            {
                MsgBox("إسم الفئه بالعربي");
            }
            else if (string.IsNullOrEmpty(txtSurveyCategoryDescEn.Text.Trim()))
            {
                MsgBox("إسم الفئه بالانجليزية");
            }
            else if (int.Equals(rblSurveyCategoryStatus.SelectedIndex, -1))
            {
                MsgBox("حالة الفئه");
            }
            else
            {
                using (SurveyCategory surveyCategory = new SurveyCategory())
                {
                    surveyCategory.CreationBy = getUserId();
                    surveyCategory.SurveyCategoryDescAr = txtSurveyCategoryDescAr.Text.Trim();
                    surveyCategory.SurveyCategoryDescEn = txtSurveyCategoryDescEn.Text.Trim();
                    surveyCategory.SurveyCategoryOrder = 1;
                    surveyCategory.SurveyCategoryStatus = Convert.ToBoolean(rblSurveyCategoryStatus.SelectedValue.ToLower());
                    surveyCategory.UpdatedBy = getUserId();
                    if (!string.IsNullOrEmpty(ViewState["SurveyCategoryId"].ToString()))
                    {
                        surveyCategory.SurveyCategoryId = Convert.ToByte(ViewState["SurveyCategoryId"].ToString());
                    }
                    using (SurveyCategoryOperation surveyCategoryOperation = new SurveyCategoryOperation())
                    {
                        surveyCategoryOperation.AddSurveyCategory(surveyCategory);
                        ViewState["SurveyCategoryId"] = surveyCategory.SurveyCategoryIdOut;
                        MsgBox(surveyCategory.MsgOut);
                    }
                }
            }
        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["SurveyCategoryId"] = string.Empty;
            }
        }
        protected void btnNew_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.Url.PathAndQuery, true);
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            addSurveyCategory();
        }
    }
}