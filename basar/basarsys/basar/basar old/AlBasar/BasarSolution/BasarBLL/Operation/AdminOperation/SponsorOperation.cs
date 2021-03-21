using BasarBLL.Helper.AdminHelper;
using BasarBLL.Operation.SharedOperation;
using BasarDAL.DbaOperation;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;
using BasarBO.AdminBO;
using System.Data.SqlClient;

namespace BasarBLL.Operation.AdminOperation
{
    public class SponsorOperation : ISponsor, IDisposable
    {
        ~SponsorOperation() { }

        public int AddSponsor(Sponsor sponsor)
        {
            using (DbaOperationClass dbOperation = new DbaOperationClass())
            {
                List<SqlParameter> sqlparm = new List<SqlParameter>()
                {
                    new SqlParameter("@CreationBy", sponsor.CreationBy),
                    new SqlParameter("@SponsorDsecAr",sponsor.SponsorDsecAr),
                    new SqlParameter("@SponsorDsecEn",sponsor.SponsorDsecEn),
                    new SqlParameter("@SponsorId",sponsor.SponsorId),
                    new SqlParameter("@SponsorOrder", sponsor.SponsorOrder),
                    new SqlParameter("@SponsorStatus", sponsor.SponsorStatus),
                    new SqlParameter("@UpdatedBy", sponsor.UpdatedBy)

                };
                SqlParameter sponsorIdOut = new SqlParameter();
                sponsorIdOut.ParameterName = "@SponsorIdOut";
                sponsorIdOut.SqlDbType = SqlDbType.SmallInt;
                sponsorIdOut.Direction = ParameterDirection.Output;
                sqlparm.Add(sponsorIdOut);
                SqlParameter msgOut = new SqlParameter();
                msgOut.ParameterName = "@MsgOut";
                msgOut.SqlDbType = SqlDbType.NVarChar;
                msgOut.Size = 100;
                msgOut.Direction = ParameterDirection.Output;
                sqlparm.Add(msgOut);
                int row = dbOperation.SaveData("spAddSponsor", sqlparm);
                sponsor.SponsorIdOut = (short)sponsorIdOut.Value;
                sponsor.MsgOut = (string)msgOut.Value;
                return row;
            }
        }

        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }

        public void GetSponsors(DropDownList ddlSponsors)
        {
            using (SharedOp sharedOp = new SharedOp())
            {
                using (DbaOperationClass dbOperation = new DbaOperationClass())
                {
                    DataTable dt = dbOperation.GetDataTable("spGetSponsors");
                    ddlSponsors.DataSource = dt;
                    ddlSponsors.DataBind();
                    sharedOp.DefaultValueDropDownList("الراعي", ddlSponsors);
                };
            };
        }
    }
}
