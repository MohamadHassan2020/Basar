using BasarBLL.Helper.PlanHelper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BasarBO.PlanBO;
using BasarDAL.DbaOperation;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;

namespace BasarBLL.Operation.PlanOperation
{
    public class AnnualPlanOperation : IDisposable, IAnnualPlan
    {
        ~AnnualPlanOperation() { }
        public int AddAnnualPlan(AnnualPlan annualPlan)
        {
            using (DbaOperationClass dbOperation = new DbaOperationClass())
            {
                List<SqlParameter> sqlparm = new List<SqlParameter>()
                {
                    new SqlParameter("@AnnualPlanAddBy", annualPlan.AnnualPlanAddBy),
                    new SqlParameter("@AnnualPlanEndDate",annualPlan.AnnualPlanEndDate),
                    new SqlParameter("@AnnualPlanId",annualPlan.AnnualPlanId),
                    new SqlParameter("@AnnualPlanStartDate",annualPlan.AnnualPlanStartDate),
                    new SqlParameter("@AnnualPlanStatus", annualPlan.AnnualPlanStatus),
                    new SqlParameter("@AnnualPlanRemark", annualPlan.AnnualPlanRemark),
                    new SqlParameter("@AnnualPlanUpdatedBy", annualPlan.AnnualPlanUpdatedBy),
                    new SqlParameter("@CampId", annualPlan.CampId),
                    new SqlParameter("@CountryId", annualPlan.CountryId),
                    new SqlParameter("@SponsorId", annualPlan.SponsorId),
                    new SqlParameter("@TeamId", annualPlan.TeamId),
                    new SqlParameter("@TourId", annualPlan.TourId),
                    new SqlParameter("@YearId", annualPlan.YearId),
                    new SqlParameter("@CampStatusId", annualPlan.CampStatusId),
                    new SqlParameter("@PreliminaryStatus", annualPlan.PreliminaryStatus)
                };
                SqlParameter annualPlanIdOut = new SqlParameter();
                annualPlanIdOut.ParameterName = "@AnnualPlanIdOut";
                annualPlanIdOut.SqlDbType = SqlDbType.Int;
                annualPlanIdOut.Direction = ParameterDirection.Output;
                sqlparm.Add(annualPlanIdOut);
                SqlParameter msgOut = new SqlParameter();
                msgOut.ParameterName = "@MsgOut";
                msgOut.SqlDbType = SqlDbType.NVarChar;
                msgOut.Size = 100;
                msgOut.Direction = ParameterDirection.Output;
                sqlparm.Add(msgOut);
                int row = dbOperation.SaveData("spAddAnnualPlan", sqlparm);
                annualPlan.AnnualPlanIdOut = (int)annualPlanIdOut.Value;
                annualPlan.MsgOut = (string)msgOut.Value;
                return row;
            }
        }

        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }

        public void GetAnnualPlan(GridView gvAnnualPlan, byte yearId)
        {
            List<SqlParameter> sqlparm = new List<SqlParameter>()
                {
                    new SqlParameter("@YearId", yearId)
                    };
            using (DbaOperationClass dbOperation = new DbaOperationClass())
            {
                DataTable dt = dbOperation.GetDataTable("spGetAnnualPlan", sqlparm);
                gvAnnualPlan.DataSource = dt;
                gvAnnualPlan.DataBind();

            };
        }
    }
}
