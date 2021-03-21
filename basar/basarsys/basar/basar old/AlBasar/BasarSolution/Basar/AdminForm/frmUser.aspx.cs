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
    public partial class frmUser : System.Web.UI.Page
    {
        #region add new users
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
        void addNewUser()
        {
            if (txtUserName.Text.Trim().Length < 6)
            {
                MsgBox(" إسم المستخدم لا يقل عن 6 أحرف");
            }
            else if (string.IsNullOrEmpty(txtUserCode.Text.Trim()))
            {
                MsgBox(" رمز المستخدم");
            }
            else if (string.IsNullOrEmpty(txtUserPassword.Text.Trim()))
            {
                MsgBox(" كلمة المرور");
            }
            else if (!txtUserPassword.Text.Trim().Equals (txtUserPasswordConfirm.Text.Trim()))
            {
                MsgBox("كلمة المرور غير متطابقة");
            }
            else if (txtUserPassword.Text.Trim().Length < 6)
            {
                MsgBox(" كلمة المرور لا تقل عن 6 أحرف");
            }
            else if (string.IsNullOrEmpty(txtUserName.Text.Trim()))
            {
                MsgBox(" إسم المستخدم");
            }
            //else if (string.IsNullOrEmpty(txtUserNameShortCut.Text.Trim()))
            //{
            //    MsgBox(" الاسم المختصر");
            //}
            //else if (string.IsNullOrEmpty(txtUserNationalId.Text.Trim()))
            //{
            //    MsgBox("رقم الاثبات");
            //}
            //else if (string.IsNullOrEmpty(txtUserMobileNumber.Text.Trim()))
            //{
            //    MsgBox("رقم الجوال");
            //}
            else if (string.IsNullOrEmpty(txtUserPassword.Text.Trim()))
            {
                MsgBox("كلمة المرور");
            }
            else if (string.IsNullOrEmpty(txtUserPasswordConfirm.Text.Trim()))
            {
                MsgBox("تأكيد كلمة المرور");
            }
            else if (string.IsNullOrEmpty(txtUserEmail.Text.Trim()))
            {
                MsgBox("البريد الإلكتروني");
            }
            //else if (rblUserStatus.SelectedIndex == -1)
            //{
            //    MsgBox("نشط أو غير نشط");
            //}

            else
            {
                using (User user = new User())
                {
                    user.UserEmail = txtUserEmail.Text.Trim();
                    user.CreationBy = getUserId();
                    user.UpdatedBy = getUserId();
                    user.UserCode = txtUserCode.Text.Trim();
                    user.UserEmail = txtUserEmail.Text.Trim();
                    user.UserName = txtUserName.Text.Trim();
                    user.UserPassword = txtUserPassword.Text;

                    using (UserOperation userOperation = new UserOperation())
                    {
                        int row = userOperation.AddUser(user);
                        //getUsersExists();
                        if (int.Equals(row, 1))
                        {
                            MsgBox("تم إضافة مستخدم");
                        }
                        else if (int.Equals(row, -1))
                        {
                            MsgBox("مستخدم موجود سابقا");
                        }
                        else
                        {

                        }
                    }
                }
            }
        }
        
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            addNewUser();
        }
    }
}