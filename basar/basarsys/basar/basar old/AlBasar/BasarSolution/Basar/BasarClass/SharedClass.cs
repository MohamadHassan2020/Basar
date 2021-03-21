using BasarBO.AdminBO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Basar.BasarClass
{
    public class SharedClass : IDisposable
    {
        short _UserId;
        public SharedClass()
        {
        }
        public SharedClass(short userId)
        {
            this._UserId = userId;
        }
        ~SharedClass() { }
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }

        public bool GetIsOutlineStatus()
        {
            using (LoginAuthentication loginAuthentication = HttpContext.Current.Session["loginAuthentication"] as LoginAuthentication)
            {
                return loginAuthentication.IsOutlineStatus;
            }
        }
        public bool GetIsAdminStatus()
        {
            using (LoginAuthentication loginAuthentication = HttpContext.Current.Session["loginAuthentication"] as LoginAuthentication)
            {
                return loginAuthentication.IsAdminStatus;
            }
        }
        public bool GetIsTeamStatus()
        {
            using (LoginAuthentication loginAuthentication = HttpContext.Current.Session["loginAuthentication"] as LoginAuthentication)
            {
                return loginAuthentication.IsTeamStatus;
            }
        }
        public bool GetIsHome()
        {
            using (LoginAuthentication loginAuthentication = HttpContext.Current.Session["loginAuthentication"] as LoginAuthentication)
            {
                return loginAuthentication.IsHome;
            }
        }
        public bool GetIsArchive()
        {
            using (LoginAuthentication loginAuthentication = HttpContext.Current.Session["loginAuthentication"] as LoginAuthentication)
            {
                return loginAuthentication.IsArchive;
            }
        }
        public bool GetIsReported()
        {
            using (LoginAuthentication loginAuthentication = HttpContext.Current.Session["loginAuthentication"] as LoginAuthentication)
            {
                return loginAuthentication.IsReported;
            }
        }
    }
}