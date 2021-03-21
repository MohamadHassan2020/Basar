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
    public class SurveyCategoryOperation : IDisposable, ISurveyCategory
    {
        ~SurveyCategoryOperation() { }

        public int AddSurveyCategory(SurveyCategory surveyCategory)
        {
            using (DbaOperationClass dbOperation = new DbaOperationClass())
            {
                List<SqlParameter> sqlparm = new List<SqlParameter>()
                {
                    new SqlParameter("@CreationBy", surveyCategory.CreationBy),
                    new SqlParameter("@SurveyCategoryDescAr",surveyCategory.SurveyCategoryDescAr),
                    new SqlParameter("@SurveyCategoryDescEn",surveyCategory.SurveyCategoryDescEn),
                    new SqlParameter("@SurveyCategoryId",surveyCategory.SurveyCategoryId),
                    new SqlParameter("@SurveyCategoryOrder", surveyCategory.SurveyCategoryOrder),
                    new SqlParameter("@SurveyCategoryStatus", surveyCategory.SurveyCategoryStatus),
                    new SqlParameter("@UpdatedBy", surveyCategory.UpdatedBy)
               

                };
                SqlParameter surveyCategoryIdOut = new SqlParameter();
                surveyCategoryIdOut.ParameterName = "@SurveyCategoryIdOut";
                surveyCategoryIdOut.SqlDbType = SqlDbType.TinyInt;
                surveyCategoryIdOut.Direction = ParameterDirection.Output;
                sqlparm.Add(surveyCategoryIdOut);
                SqlParameter msgOut = new SqlParameter();
                msgOut.ParameterName = "@MsgOut";
                msgOut.SqlDbType = SqlDbType.NVarChar;
                msgOut.Size = 100;
                msgOut.Direction = ParameterDirection.Output;
                sqlparm.Add(msgOut);
                int row = dbOperation.SaveData("spAddSurveyCategory", sqlparm);
                surveyCategory.SurveyCategoryIdOut = (byte)surveyCategoryIdOut.Value;
                surveyCategory.MsgOut = (string)msgOut.Value;
                return row;
            }
        }

        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }

        public void GetSurveyCategory(DropDownList ddlGetSurveyCategory)
        {
            using (SharedOp sharedOp = new SharedOp())
            {
                using (DbaOperationClass dbOperation = new DbaOperationClass())
                {
                    DataTable dt = dbOperation.GetDataTable("spGetSurveyCategory");
                    ddlGetSurveyCategory.DataSource = dt;
                    ddlGetSurveyCategory.DataBind();
                    sharedOp.DefaultValueDropDownList("الفئه", ddlGetSurveyCategory);
                };
            };
        }
    }
}
