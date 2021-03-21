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
    public partial class frmSponsor : System.Web.UI.Page
    {
        #region Sponsor 
         
        
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
        void addsponsor()
        {
            if (string.IsNullOrEmpty(txtSponsorDsecAr.Text.Trim()))
            {
                MsgBox("إسم الراعي بالعربي");
            }
            else if (string.IsNullOrEmpty(txtSponsorDsecEn.Text.Trim()))
            {
                MsgBox("إسم الراعي بالانجليزية");
            }
            else if (int.Equals(rblSponsorStatus.SelectedIndex, -1))
            {
                MsgBox("حالة الراعي");
            }
            else
            {
                using (Sponsor sponsor = new Sponsor())
                {
                    sponsor.CreationBy = getUserId();
                    sponsor.SponsorDsecAr = txtSponsorDsecAr.Text.Trim();
                    sponsor.SponsorDsecEn = txtSponsorDsecEn.Text.Trim();
                    sponsor.SponsorOrder = 1;
                    sponsor.SponsorStatus = Convert.ToBoolean(rblSponsorStatus.SelectedValue.ToLower());
                    sponsor.UpdatedBy = getUserId();
                    if (!string.IsNullOrEmpty(ViewState["SponsorId"].ToString()))
                    {
                        sponsor.SponsorId = Convert.ToByte(ViewState["SponsorId"].ToString());
                    }
                    using (SponsorOperation sponsorOperation = new SponsorOperation())
                    {
                        sponsorOperation.AddSponsor(sponsor);
                        ViewState["SponsorId"] = sponsor.SponsorIdOut;
                        MsgBox(sponsor.MsgOut);
                    }
                }
            }
        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["SponsorId"] = string.Empty;
            }
        }
        protected void btnNew_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.Url.PathAndQuery, true);
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            addsponsor();
        }
    }
}