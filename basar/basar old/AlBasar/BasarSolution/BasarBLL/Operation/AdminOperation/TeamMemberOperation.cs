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

namespace BasarBLL.Operation.AdminOperation
{
    public class TeamMemberOperation : IDisposable, ITeamMember
    {
        ~TeamMemberOperation() { }

        public int AddTeamMember(TeamMember teamMember)
        {
            using (DbaOperationClass dbOperation = new DbaOperationClass())
            {
                List<SqlParameter> sqlparm = new List<SqlParameter>()
                {
                    new SqlParameter("@AddBy", teamMember.AddBy),
                     new SqlParameter("@DateOfBirth",teamMember.DateOfBirth),
                    new SqlParameter("@DateOfIssue",teamMember.DateOfIssue),
                    new SqlParameter("@ExpiryDate",teamMember.ExpiryDate),
                    new SqlParameter("@IssuerPlaceAr",teamMember.IssuerPlaceAr),
                    new SqlParameter("@IssuerPlaceEn", teamMember.IssuerPlaceEn),
                    new SqlParameter("@PassportNumber", teamMember.PassportNumber),
                    new SqlParameter("@SpecializationId", teamMember.SpecializationId),
                    new SqlParameter("@TeamCategoryId", teamMember.TeamCategoryId),
                    new SqlParameter("@TeamId", teamMember.TeamId),
                    new SqlParameter("@NationalityId", teamMember.NationalityId),
                    new SqlParameter("@TeamMemberId", teamMember.TeamMemberId),
                    new SqlParameter("@TeamMemberNameAr", teamMember.TeamMemberNameAr),
                    new SqlParameter("@TeamMemberNameEn", teamMember.TeamMemberNameEn),
                    new SqlParameter("@UpdatedBy", teamMember.UpdatedBy),
                    new SqlParameter("@TeamMemberStatus", teamMember.TeamMemberStatus)
                };
                SqlParameter teamMemberIdOut = new SqlParameter();
                teamMemberIdOut.ParameterName = "@TeamMemberIdOut";
                teamMemberIdOut.SqlDbType = SqlDbType.Int;
                teamMemberIdOut.Direction = ParameterDirection.Output;
                sqlparm.Add(teamMemberIdOut);
                SqlParameter msgOut = new SqlParameter();
                msgOut.ParameterName = "@MsgOut";
                msgOut.SqlDbType = SqlDbType.NVarChar;
                msgOut.Size = 100;
                msgOut.Direction = ParameterDirection.Output;
                sqlparm.Add(msgOut);
                int row = dbOperation.SaveData("spAddTeamMember", sqlparm);
                teamMember.TeamMemberIdOut = (int)teamMemberIdOut.Value;
                teamMember.MsgOut = (string)msgOut.Value;
                return row;
            }
        }

        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }

        public void GetTeamMember(GridView gvTeamMember)
        {

            using (DbaOperationClass dbOperation = new DbaOperationClass())
            {
                DataTable dt = dbOperation.GetDataTable("spGetTeamMember");
                gvTeamMember.DataSource = dt;
                gvTeamMember.DataBind();
            };
        }

        public void GetTeamMemberByTeam(CheckBoxList cblTeamMember, short teamId)
        {
            List<SqlParameter> sqlparm = new List<SqlParameter>()
                {
                    new SqlParameter("@TeamId", teamId)
            };
            using (DbaOperationClass dbOperation = new DbaOperationClass())
            {
                DataTable dt = dbOperation.GetDataTable("spGetTeamMemberByTeam", sqlparm);
                cblTeamMember.DataSource = dt;
                cblTeamMember.DataBind();
            };
        }

        public TeamMember GetTeamMemberById(int teamMemberId)
        {
            using (DbaOperationClass dbOperation = new DbaOperationClass())
            {
                List<SqlParameter> sqlparm = new List<SqlParameter>()
                {
                    new SqlParameter("@TeamMemberId",teamMemberId)
                };
                TeamMember teamMember = null;
                using (teamMember = new TeamMember())
                {
                    using (SqlDataReader reader = dbOperation.GetDataReader("spGetTeamMemberById", sqlparm))
                    {

                        while (reader.Read())
                        {
                            teamMember.DateOfBirthStr = reader["DateOfBirthStr"].ToString();
                            teamMember.DateOfIssueStr = reader["DateOfIssueStr"].ToString();
                            teamMember.ExpiryDateStr = reader["ExpiryDateStr"].ToString();
                            teamMember.IssuerPlaceAr = reader["IssuerPlaceAr"].ToString();
                            teamMember.IssuerPlaceEn = reader["IssuerPlaceEn"].ToString();
                            teamMember.NationalityId = reader["NationalityId"] != DBNull.Value
                                ? teamMember.NationalityId = Convert.ToByte(reader["NationalityId"].ToString()) : null;
                            teamMember.TeamClassId = reader["TeamClassId"] != DBNull.Value
                               ? teamMember.TeamClassId = Convert.ToByte(reader["TeamClassId"].ToString()) : null;
                            teamMember.PassportNumber = reader["PassportNumber"].ToString();
                            teamMember.SpecializationId = reader["SpecializationId"] != DBNull.Value
                                ? teamMember.SpecializationId = Convert.ToInt16(reader["SpecializationId"].ToString()) : null;
                            teamMember.TeamCategoryId = reader["TeamCategoryId"] != DBNull.Value
                               ? teamMember.TeamCategoryId = Convert.ToInt16(reader["TeamCategoryId"].ToString()) : null;
                            teamMember.TeamId = reader["TeamId"] != DBNull.Value
                               ? teamMember.TeamId = Convert.ToInt16(reader["TeamId"].ToString()) : null;
                            teamMember.TeamMemberNameAr = reader["TeamMemberNameAr"].ToString();
                            teamMember.TeamMemberNameEn = reader["TeamMemberNameEn"].ToString();
                            teamMember.TeamMemberStatus = reader["TeamMemberStatus"] != DBNull.Value
                               ? teamMember.TeamMemberStatus = Convert.ToBoolean(reader["TeamMemberStatus"].ToString()) : null;
                        }
                    }
                    return teamMember;
                }
            }
        }
    }
}
