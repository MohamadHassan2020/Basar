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
    public class CampOperation : IDisposable, ICamp
    {
        ~CampOperation() { }

        public int AddCamp(Camp camp)
        {
            using (DbaOperationClass dbOperation = new DbaOperationClass())
            {
                List<SqlParameter> sqlparm = new List<SqlParameter>()
                {
                    new SqlParameter("@CampDsecAr", camp.CampDsecAr),
                    new SqlParameter("@CampDsecEn",camp.CampDsecEn),
                    new SqlParameter("@CampId",camp.CampId),
                    new SqlParameter("@CampOrder",camp.CampOrder),
                    new SqlParameter("@CampStatus", camp.CampStatus),
                    new SqlParameter("@CountryId", camp.CountryId),
                    new SqlParameter("@CreationBy", camp.CreationBy),
                    new SqlParameter("@UpdatedBy", camp.UpdatedBy)

                };
                SqlParameter campIdOut = new SqlParameter();
                campIdOut.ParameterName = "@CampIdOut";
                campIdOut.SqlDbType = SqlDbType.SmallInt;
                campIdOut.Direction = ParameterDirection.Output;
                sqlparm.Add(campIdOut);
                SqlParameter msgOut = new SqlParameter();
                msgOut.ParameterName = "@MsgOut";
                msgOut.SqlDbType = SqlDbType.NVarChar;
                msgOut.Size = 100;
                msgOut.Direction = ParameterDirection.Output;
                sqlparm.Add(msgOut);
                int row = dbOperation.SaveData("spAddCamp", sqlparm);
                camp.CampIdOut = (short)campIdOut.Value;
                camp.MsgOut = (string)msgOut.Value;
                return row;
            }
        }

        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }

        public void GetCamps(DropDownList ddlCamps, byte countryId)
        {
            using (SharedOp sharedOp = new SharedOp())
            {
                using (DbaOperationClass dbOperation = new DbaOperationClass())
                {
                    List<SqlParameter> sqlparm = new List<SqlParameter>()
                {
                    new SqlParameter("@CountryId", countryId)
                    };
                    DataTable dt = dbOperation.GetDataTable("spGetCamps", sqlparm);
                    ddlCamps.DataSource = dt;
                    ddlCamps.DataBind();
                    sharedOp.DefaultValueDropDownList("اختر المخيم", ddlCamps);
                };
            };
        }

        public void GetCampsPreliminary(DropDownList ddlCamps, byte countryId, byte yearId)
        {
            using (SharedOp sharedOp = new SharedOp())
            {
                using (DbaOperationClass dbOperation = new DbaOperationClass())
                {
                    List<SqlParameter> sqlparm = new List<SqlParameter>()
                {
                    new SqlParameter("@CountryId", countryId),
                    new SqlParameter("@YearId", yearId)
                    };
                    DataTable dt = dbOperation.GetDataTable("spGetCampsPreliminary", sqlparm);
                    ddlCamps.DataSource = dt;
                    ddlCamps.DataBind();
                    sharedOp.DefaultValueDropDownList("اختر المخيم", ddlCamps);
                };
            };
        }
    }
}
