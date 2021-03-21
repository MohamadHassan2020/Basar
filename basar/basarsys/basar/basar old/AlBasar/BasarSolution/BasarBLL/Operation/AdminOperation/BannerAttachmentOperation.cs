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
using System.Web.UI.WebControls;

namespace BasarBLL.Operation.AdminOperation
{
    public class BannerAttachmentOperation : IDisposable, IBannerAttachment
    {
        ~BannerAttachmentOperation() { }

        public int AddBannerAttachment(BannerAttachment bannerAttachment)
        {
            using (DbaOperationClass dbOperation = new DbaOperationClass())
            {
                List<SqlParameter> sqlparm = new List<SqlParameter>()
                {
                    new SqlParameter("@AddBy", bannerAttachment.AddBy),
                    new SqlParameter("@BannerFileName",bannerAttachment.BannerFileName),
                    new SqlParameter("@BannerFilePath",bannerAttachment.BannerFilePath),
                    new SqlParameter("@CampId",bannerAttachment.CampId),
                    new SqlParameter("@CountryId", bannerAttachment.CountryId),
                    new SqlParameter("@TourId", bannerAttachment.TourId),
                    new SqlParameter("@YearId", bannerAttachment.YearId)
                };
                int row = dbOperation.SaveData("spAddBannerAttachment", sqlparm);
                return row;
            }
        }

        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }



        public DataTable GetBannerAttachment(AnnualCamp annualCamp)
        {
            List<SqlParameter> sqlparm = new List<SqlParameter>()
                {
                    new SqlParameter("@CampId", annualCamp.CampId),
                    new SqlParameter("@CountryId", annualCamp.CountryId),
                    new SqlParameter("@TourId", annualCamp.TourId),
                    new SqlParameter("@YearId", annualCamp.YearId)
                    };
            using (DbaOperationClass dbOperation = new DbaOperationClass())
            {
                DataTable dt = dbOperation.GetDataTable("spGetBannerAttachment", sqlparm);
                return dt;
            };
        }
    }
}
