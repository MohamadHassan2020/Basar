using BasarBLL.Helper.AdminHelper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BasarBO.AdminBO;
using BasarDAL.DbaOperation;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;
using BasarBLL.Operation.SharedOperation;

namespace BasarBLL.Operation.AdminOperation
{
    public class CampMembersOperation : IDisposable, ICampMembers
    {
        ~CampMembersOperation() { }

        public int AddCampMembers(CampMembers campMembers)
        {
            using (DbaOperationClass dbOperation = new DbaOperationClass())
            {
                List<SqlParameter> sqlparm = new List<SqlParameter>()
                {
                    new SqlParameter("@AddBy", campMembers.AddBy),
                    new SqlParameter("@CampId",campMembers.CampId),
                    new SqlParameter("@CountryId",campMembers.CountryId),
                    new SqlParameter("@TeamId",campMembers.TeamId),
                    new SqlParameter("@TeamMemberId", campMembers.TeamMemberId),
                    new SqlParameter("@UpdatedBy", campMembers.UpdatedBy),
                    new SqlParameter("@YearId", campMembers.YearId)
                };

                SqlParameter msgOut = new SqlParameter();
                msgOut.ParameterName = "@MsgOut";
                msgOut.SqlDbType = SqlDbType.NVarChar;
                msgOut.Size = 100;
                msgOut.Direction = ParameterDirection.Output;
                sqlparm.Add(msgOut);
                int row = dbOperation.SaveData("spAddCampMembers", sqlparm);
                campMembers.MsgOut = (string)msgOut.Value;
                return row;
            }
        }

        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }

        public void GetCampMembers(GridView gvCampMembers, CampMembersFilter campMembersFilter)
        {
            List<SqlParameter> sqlparm = new List<SqlParameter>()
                {
                    new SqlParameter("@CampId", campMembersFilter.CampId),
                    new SqlParameter("@TeamId",campMembersFilter.TeamId),
                    new SqlParameter("@YearId",campMembersFilter.YearId)
                };
            using (DbaOperationClass dbOperation = new DbaOperationClass())
            {
                DataTable dt = dbOperation.GetDataTable("spGetCampMembers", sqlparm);
                gvCampMembers.DataSource = dt;
                gvCampMembers.DataBind();
            };
        }
    }
}


