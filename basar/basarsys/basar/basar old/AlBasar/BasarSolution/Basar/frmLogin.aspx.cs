using BasarBLL.Operation.AdminOperation;
using BasarBO.AdminBO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Basar
{
    public partial class frmLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnlogin_Click(object sender, EventArgs e)
        {
            using (User user = new User())
            {
                user.UserCode = txtUser.Text.Trim();
                user.UserPassword = txtPassword.Text.Trim();
                using (UserOperation userOperation = new UserOperation())
                {
                    using (LoginAuthentication loginAuthentication = userOperation.GetLoginAuthentication(user))
                    {
                        if (loginAuthentication.Authenticated)
                        {
                           // ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + loginAuthentication.UserId.ToString() + "')", true);
                            Session["loginAuthentication"] = loginAuthentication;
                            FormsAuthentication.RedirectFromLoginPage(txtUser.Text, false);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('خطأ في تسجيل الدخول')", true);
                        }
                    }
                }
            }

        }
    }
}