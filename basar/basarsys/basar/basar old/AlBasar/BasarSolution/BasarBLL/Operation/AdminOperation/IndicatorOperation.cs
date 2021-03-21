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
    public class IndicatorOperation : IIndicator, IDisposable
    {
        ~IndicatorOperation() { }

        public int AddIndicator(Indicator indicator)
        {
            using (DbaOperationClass dbOperation = new DbaOperationClass())
            {
                List<SqlParameter> sqlparm = new List<SqlParameter>()
                {
                    new SqlParameter("@CreationBy", indicator.CreationBy),
                    new SqlParameter("@IndicatorDivider",indicator.IndicatorDivider),
                    new SqlParameter("@IndicatorId",indicator.IndicatorId),
                    new SqlParameter("@IndicatorDescAr",indicator.IndicatorDescAr),
                    new SqlParameter("@IndicatorDescEn", indicator.IndicatorDescEn),
                    new SqlParameter("@IndicatorNumber", indicator.IndicatorNumber),
                    new SqlParameter("@IndicatorOrder", indicator.IndicatorOrder),
                    new SqlParameter("@IndicatorStatus", indicator.IndicatorStatus),
                    new SqlParameter("@SurveyCategoryId", indicator.SurveyCategoryId),
                    new SqlParameter("@UpdatedBy", indicator.UpdatedBy)
                };
                SqlParameter indicatorIdOut = new SqlParameter();
                indicatorIdOut.ParameterName = "@IndicatorIdOut";
                indicatorIdOut.SqlDbType = SqlDbType.SmallInt;
                indicatorIdOut.Direction = ParameterDirection.Output;
                sqlparm.Add(indicatorIdOut);
                SqlParameter msgOut = new SqlParameter();
                msgOut.ParameterName = "@MsgOut";
                msgOut.SqlDbType = SqlDbType.NVarChar;
                msgOut.Size = 100;
                msgOut.Direction = ParameterDirection.Output;
                sqlparm.Add(msgOut);
                int row = dbOperation.SaveData("spAddIndicator", sqlparm);
                indicator.IndicatorIdOut = (short)indicatorIdOut.Value;
                indicator.MsgOut = (string)msgOut.Value;
                return row;
            }
        }

        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }

        public void GetIndicator(GridView gvIndicator, byte surveyCategoryId, bool indicatorDivider, byte? yearId, byte? campId, byte? countryId)
        {
            using (DbaOperationClass dbOperation = new DbaOperationClass())
            {
                List<SqlParameter> sqlparm = new List<SqlParameter>()
                {
                    new SqlParameter("@SurveyCategoryId", surveyCategoryId),
                    new SqlParameter("@IndicatorDivider", indicatorDivider),
                    new SqlParameter("@YearId", yearId),
                    new SqlParameter("@CampId", campId),
                    new SqlParameter("@CountryId", countryId),
                    };
                DataTable dt = dbOperation.GetDataTable("spGetIndicator", sqlparm);
                gvIndicator.DataSource = dt;
                gvIndicator.DataBind();

            };
        }
    }
}
