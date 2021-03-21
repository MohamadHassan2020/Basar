using BasarBLL.Helper.AdminHelper;
using BasarBO.AdminBO;
using BasarDAL.DbaOperation;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasarBLL.Operation.AdminOperation
{
    public class BannerOperation : IDisposable, IBanner
    {
        ~BannerOperation() { }

        public int AddBanner(Banner banner)
        {
            using (DbaOperationClass dbOperation = new DbaOperationClass())
            {
                List<SqlParameter> sqlparm = new List<SqlParameter>()
                {
                    new SqlParameter("@AddBy", banner.AddBy),
                    new SqlParameter("@BannerDesc",banner.BannerDesc),
                    new SqlParameter("@BannerStatus",banner.BannerStatus),
                    new SqlParameter("@CampId",banner.CampId),
                    new SqlParameter("@CountryId", banner.CountryId),
                    new SqlParameter("@TourId", banner.TourId),
                    new SqlParameter("@YearId", banner.YearId)
                };
                SqlParameter msgOut = new SqlParameter();
                msgOut.ParameterName = "@MsgOut";
                msgOut.SqlDbType = SqlDbType.NVarChar;
                msgOut.Size = 100;
                msgOut.Direction = ParameterDirection.Output;
                sqlparm.Add(msgOut);
                int row = dbOperation.SaveData("spAddBanner", sqlparm);
                banner.MsgOut = (string)msgOut.Value;
                return row;
            };
        }

        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }
    }
}
