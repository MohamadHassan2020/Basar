using BasarBLL.Helper.AdminHelper;
using BasarBLL.Operation.SharedOperation;
using BasarDAL.DbaOperation;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;
using BasarBO.AdminBO;

namespace BasarBLL.Operation.AdminOperation
{
    public class TeamOperation : IDisposable, ITeam
    {
        ~TeamOperation() { }

        public int AddTeam(Team team)
        {
            using (DbaOperationClass dbOperation = new DbaOperationClass())
            {
                List<SqlParameter> sqlparm = new List<SqlParameter>()
                {
                    new SqlParameter("@CreationBy", team.CreationBy),
                    new SqlParameter("@TeamDsecAr",team.TeamDsecAr),
                    new SqlParameter("@TeamDsecEn",team.TeamDsecEn),
                    new SqlParameter("@TeamId",team.TeamId),
                    new SqlParameter("@TeamOrder", team.TeamOrder),
                    new SqlParameter("@TeamStatus", team.TeamStatus),
                    new SqlParameter("@UpdatedBy", team.UpdatedBy)

                };
                SqlParameter teamIdOut = new SqlParameter();
                teamIdOut.ParameterName = "@TeamIdOut";
                teamIdOut.SqlDbType = SqlDbType.SmallInt;
                teamIdOut.Direction = ParameterDirection.Output;
                sqlparm.Add(teamIdOut);
                SqlParameter msgOut = new SqlParameter();
                msgOut.ParameterName = "@MsgOut";
                msgOut.SqlDbType = SqlDbType.NVarChar;
                msgOut.Size = 100;
                msgOut.Direction = ParameterDirection.Output;
                sqlparm.Add(msgOut);
                int row = dbOperation.SaveData("spAddTeam", sqlparm);
                team.TeamIdOut = (short)teamIdOut.Value;
                team.MsgOut = (string)msgOut.Value;
                return row;
            }
        }

        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }
        public void GetTeams(DropDownList ddlTeam, short? tourId = null)
        {
            using (SharedOp sharedOp = new SharedOp())
            {
                using (DbaOperationClass dbOperation = new DbaOperationClass())
                {
                    List<SqlParameter> sqlparm = new List<SqlParameter>()
                {
                    new SqlParameter("@TourId", tourId)
                    };
                    DataTable dt = dbOperation.GetDataTable("spGetTeams", sqlparm);
                    ddlTeam.DataSource = dt;
                    ddlTeam.DataBind();
                    sharedOp.DefaultValueDropDownList("الفريق", ddlTeam);
                };
            };
        }
    }
}
