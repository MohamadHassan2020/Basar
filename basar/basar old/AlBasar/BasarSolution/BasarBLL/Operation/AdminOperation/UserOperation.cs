using BasarBLL.Helper.AdminHelper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BasarBO.AdminBO;
using BasarDAL.DbaOperation;
using System.Data.SqlClient;
using System.Web.Security;

namespace BasarBLL.Operation.AdminOperation
{
    public class UserOperation : IDisposable, IUsers
    {
        ~UserOperation() { }

        public int AddUser(User user)
        {
            using (DbaOperationClass dbOperation = new DbaOperationClass())
            {
                List<SqlParameter> sqlparm = new List<SqlParameter>()
                {
                    new SqlParameter("@CreationBy", user.CreationBy),
                    new SqlParameter("@UpdatedBy",user.UpdatedBy),
                    new SqlParameter("@UserCode",user.UserCode),
                    new SqlParameter("@UserPassword",FormsAuthentication.HashPasswordForStoringInConfigFile(user.UserPassword, "SHA1")),
                    new SqlParameter("@UserEmail",user.UserEmail),
                    new SqlParameter("@UserId", user.UserId),
                    new SqlParameter("@UserName", user.UserName)
                };
                int row = dbOperation.GetScalarValue("spAddUsers", sqlparm);
                return row;
            }
        }

        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }

        public LoginAuthentication GetLoginAuthentication(User user)
        {
            using (DbaOperationClass dbOperation = new DbaOperationClass())
            {
                List<SqlParameter> sqlparm = new List<SqlParameter>()
                {
                    new SqlParameter("@UserCode",user.UserCode),
                    new SqlParameter("@UserPassword", FormsAuthentication.HashPasswordForStoringInConfigFile(user.UserPassword, "SHA1"))
                };
                LoginAuthentication loginAuthentication = new LoginAuthentication();
                using (UserOperation userOperation = new UserOperation())
                {
                    using (SqlDataReader reader = dbOperation.GetDataReader("spGetLoginAuthentication", sqlparm))
                    {
                        while (reader.Read())
                        {
                            loginAuthentication.Authenticated = Convert.ToBoolean(reader["Authenticated"]);
                            loginAuthentication.UserId = Convert.ToInt16(reader["UserId"]);
                            loginAuthentication.CreationBy = Convert.ToInt16(reader["CreationBy"]);
                            loginAuthentication.UserEmail = reader["UserEmail"].ToString();
                            loginAuthentication.UserName = reader["UserName"].ToString();
                            loginAuthentication.UserPassword = reader["UserPassword"].ToString();
                            loginAuthentication.IsAdminStatus = Convert.ToBoolean (reader["IsAdminStatus"].ToString());
                            loginAuthentication.IsOutlineStatus = Convert.ToBoolean(reader["IsOutlineStatus"].ToString());
                            loginAuthentication.IsTeamStatus = Convert.ToBoolean(reader["IsTeamStatus"].ToString());
                            loginAuthentication.IsHome = Convert.ToBoolean(reader["IsHome"].ToString());
                            loginAuthentication.IsArchive = Convert.ToBoolean(reader["IsArchive"].ToString());
                            loginAuthentication.IsReported = Convert.ToBoolean(reader["IsReported"].ToString());
                        }
                    }
                }
                return loginAuthentication;
            }
        }

        public UserInfo GetUserById(short userId)
        {
            using (DbaOperationClass dbOperation = new DbaOperationClass())
            {
                List<SqlParameter> sqlparm = new List<SqlParameter>()
                {
                    new SqlParameter("@UserId",userId)
                };
                UserInfo userInfo = new UserInfo();
                using (UserOperation userOperation = new UserOperation())
                {
                    using (SqlDataReader reader = dbOperation.GetDataReader("spGetUserById", sqlparm))
                    {
                        while (reader.Read())
                        {
                            userInfo.UserId = Convert.ToInt16(reader["UserId"].ToString());
                            userInfo.UserName = reader["UserName"].ToString();
                        }
                    }
                }
                return userInfo;
            }
        }
    }
}
