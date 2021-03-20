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
    public class ToursOperation : IDisposable, ITours
    {
        public int AddTour(Tour tour)
        {
            using (DbaOperationClass dbOperation = new DbaOperationClass())
            {
                List<SqlParameter> sqlparm = new List<SqlParameter>()
                {
                    new SqlParameter("@CreationBy", tour.CreationBy),
                    new SqlParameter("@TeamId", tour.TeamId),
                    new SqlParameter("@TourDsecAr",tour.TourDsecAr),
                    new SqlParameter("@TourDsecEn",tour.TourDsecEn),
                    new SqlParameter("@TourId",tour.TourId),
                    new SqlParameter("@TourOrder", tour.TourOrder),
                    new SqlParameter("@TourStatus", tour.TourStatus),
                    new SqlParameter("@UpdatedBy", tour.UpdatedBy)
                };
                SqlParameter tourIdOut = new SqlParameter();
                tourIdOut.ParameterName = "@TourIdOut";
                tourIdOut.SqlDbType = SqlDbType.SmallInt;
                tourIdOut.Direction = ParameterDirection.Output;
                sqlparm.Add(tourIdOut);
                SqlParameter msgOut = new SqlParameter();
                msgOut.ParameterName = "@MsgOut";
                msgOut.SqlDbType = SqlDbType.NVarChar;
                msgOut.Size = 100;
                msgOut.Direction = ParameterDirection.Output;
                sqlparm.Add(msgOut);
                int row = dbOperation.SaveData("spAddTour", sqlparm);
                tour.TourIdOut = (short)tourIdOut.Value;
                tour.MsgOut = (string)msgOut.Value;
                return row;
            }
        }

        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }

        public void GetTours(DropDownList ddlTour)
        {
            using (SharedOp sharedOp = new SharedOp())
            {
                using (DbaOperationClass dbOperation = new DbaOperationClass())
                {
                    DataTable dt = dbOperation.GetDataTable("spGetTours");
                    ddlTour.DataSource = dt;
                    ddlTour.DataBind();
                    sharedOp.DefaultValueDropDownList("الجولة", ddlTour);
                };
            };
        }

        public void GetTours(CheckBoxList cblTour)
        {
            using (DbaOperationClass dbOperation = new DbaOperationClass())
            {
                DataTable dt = dbOperation.GetDataTable("spGetTours");
                cblTour.DataSource = dt;
                cblTour.DataBind();
            };
        }
    }
}
