using BasarBO.AdminBO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasarBLL.Helper.AdminHelper
{
    interface IUsers
    {
        int AddUser(User user);
        LoginAuthentication GetLoginAuthentication(User user);
        UserInfo GetUserById(short userId);
    }
}
