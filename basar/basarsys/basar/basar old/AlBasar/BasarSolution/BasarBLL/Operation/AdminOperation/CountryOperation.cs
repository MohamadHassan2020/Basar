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
    public class CountryOperation : ICountry, IDisposable
    {
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }
        ~CountryOperation() { }


        public void GetCountries(DropDownList ddlCountries, short? tourId =null)
        {
            using (SharedOp sharedOp = new SharedOp())
            {
                List<SqlParameter> sqlparm = new List<SqlParameter>()
                {
                    new SqlParameter("@TourId", tourId)
                    };
                using (DbaOperationClass dbOperation = new DbaOperationClass())
                {
                    DataTable dt = dbOperation.GetDataTable("spGetCountries", sqlparm);
                    ddlCountries.DataSource = dt;
                    ddlCountries.DataBind();
                    sharedOp.DefaultValueDropDownList("الدولة", ddlCountries);
                };
            };
        }

        public int AddCountry(Country country)
        {
            using (DbaOperationClass dbOperation = new DbaOperationClass())
            {
                List<SqlParameter> sqlparm = new List<SqlParameter>()
                {
                    new SqlParameter("@CountryDsecAr", country.CountryDsecAr),
                    new SqlParameter("@CountryDsecEn",country.CountryDsecEn),
                    new SqlParameter("@CountryId",country.CountryId),
                    new SqlParameter("@CountryOrder",country.CountryOrder),
                    new SqlParameter("@CountryStatus", country.CountryStatus),
                    new SqlParameter("@CreationBy", country.CreationBy),
                    new SqlParameter("@TourId", country.TourId),
                    new SqlParameter("@UpdatedBy", country.UpdatedBy)
                };
                SqlParameter countryIdOut = new SqlParameter();
                countryIdOut.ParameterName = "@CountryIdOut";
                countryIdOut.SqlDbType = SqlDbType.TinyInt;
                countryIdOut.Direction = ParameterDirection.Output;
                sqlparm.Add(countryIdOut);
                SqlParameter msgOut = new SqlParameter();
                msgOut.ParameterName = "@MsgOut";
                msgOut.SqlDbType = SqlDbType.NVarChar;
                msgOut.Size = 100;
                msgOut.Direction = ParameterDirection.Output;
                sqlparm.Add(msgOut);
                int row = dbOperation.SaveData("spAddCountry", sqlparm);
                country.CountryIdOut = (byte)countryIdOut.Value;
                country.MsgOut = (string)msgOut.Value;
                return row;
            }
        }

        public void GetCountries(CheckBoxList cblCountries)
        {
            using (DbaOperationClass dbOperation = new DbaOperationClass())
            {
                DataTable dt = dbOperation.GetDataTable("spGetCountries");
                cblCountries.DataSource = dt;
                cblCountries.DataBind();
            };
        }

        public int AddTourCountry(TourCountry tourCountry)
        {
            using (DbaOperationClass dbOperation = new DbaOperationClass())
            {
                List<SqlParameter> sqlparm = new List<SqlParameter>()
                {
                    new SqlParameter("@AddBy", tourCountry.AddBy),
                    new SqlParameter("@CountryId",tourCountry.CountryId),
                    new SqlParameter("@TourCountryStatus",tourCountry.TourCountryStatus),
                    new SqlParameter("@TourId",tourCountry.TourId),
                    new SqlParameter("@UpdatedBy", tourCountry.UpdatedBy)
                };
                SqlParameter msgOut = new SqlParameter();
                msgOut.ParameterName = "@MsgOut";
                msgOut.SqlDbType = SqlDbType.NVarChar;
                msgOut.Size = 100;
                msgOut.Direction = ParameterDirection.Output;
                sqlparm.Add(msgOut);
                int row = dbOperation.SaveData("spAddTourCountry", sqlparm);
                tourCountry.MsgOut = (string)msgOut.Value;
                return row;
            }
        }
    }
}
