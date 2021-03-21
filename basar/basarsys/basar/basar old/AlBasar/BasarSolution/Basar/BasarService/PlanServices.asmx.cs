using BasarBLL.Operation;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;

namespace Basar.BasarService
{
    /// <summary>
    /// Summary description for PlanServices
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class PlanServices : System.Web.Services.WebService
    {

        readonly HelperOperation mOperation;
        readonly PlanModelStats planModelStats;

        public PlanServices()
        {
            mOperation = HelperOperation.GetInstance();
            planModelStats = PlanModelStats.GetInstance();
        }
        [WebMethod]
        public void GetPlanModelStatsDT()
        {
            JavaScriptSerializer js = new JavaScriptSerializer();
            js.MaxJsonLength = int.MaxValue;
            Context.Response.Write(js.Serialize(planModelStats.GetPlanModelStats()));
        }
        /*
        [WebMethod(EnableSession = true)]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json)]
        public void AddFeedback(FeedbackModel fm)
        {
            UserLoginInfo user = Session["UserLoginInfo"] as UserLoginInfo;
            fm.AddByFeedback = user.UserLoginId;
            feedbackModel.AddFeedback(fm);
            //JavaScriptSerializer js = new JavaScriptSerializer();
            //Context.Response.Write(js.Serialize(feedbackModel.AddFeedback(fm)));
        }
        */

    }
    public class PlanModelStats : IDisposable
    {

        ~PlanModelStats() { }
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }

        #region singleton
        private static readonly object mutex = new object();
        //1
        private static PlanModelStats instance;
        //3
        public static PlanModelStats GetInstance()
        {
            //onle single by threading
            lock (mutex)
            {
                if (instance == null)
                {
                    instance = new PlanModelStats();
                }
                return instance;
            }

        }
        #endregion

        readonly HelperOperation mOperation;

        public PlanModelStats()
        {
            mOperation = HelperOperation.GetInstance();
        }
        #region feilds   

        public short YearNameEn { get; set; }
        public short TotalCamps { get; set; }
        public byte YearId { get; set; }

        #endregion
        #region    

        #endregion

        public List<PlanModelStats> GetPlanModelStats()
        {
            List<PlanModelStats> regList = new List<PlanModelStats>();
            using (SqlDataReader sqlDataReader = mOperation.GetDataReader("spGetPlanModelStats"))// mOperation.GetDataReader("spGetRegisterTrace"))
            {
                while (sqlDataReader.Read())
                {
                    PlanModelStats regMin = new PlanModelStats
                    {
                        YearId = Convert.ToByte(sqlDataReader["YearId"].ToString()),
                        YearNameEn = Convert.ToInt16(sqlDataReader["YearNameEn"].ToString()),
                        TotalCamps = Convert.ToInt16(sqlDataReader["TotalCamps"].ToString()),
                    };
                    regList.Add(regMin);

                };
                return regList;
            }
        }
        /*
        public List<EmployerModel> GetEmployer()
        {
            List<EmployerModel> employerModelList = new List<EmployerModel>();
            using (SqlDataReader sqlDataReader = mOperation.GetDataReader("spGetEmployer"))
            {
                while (sqlDataReader.Read())
                {
                    using (EmployerModel employer = new EmployerModel())
                    {
                        employer.EmployerId = Convert.ToInt16(sqlDataReader["EmployerId"].ToString());
                        employer.EmployerDesc = sqlDataReader["EmployerDesc"].ToString();
                        employer.EmployerAddBy = sqlDataReader["EmployerAddBy"].ToString();
                        employer.EmployerReportDesc = sqlDataReader["EmployerReportDesc"].ToString();
                        employer.EmployerStatus = Convert.ToBoolean(sqlDataReader["EmployerStatus"].ToString());
                        employerModelList.Add(employer);
                    }
                };
                return employerModelList;
            }
        }
        */
        /*
        public int AddFeedback(FeedbackModel fm)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>()
                {
                    new SqlParameter("@AddByFeedback",fm.AddByFeedback),
                    new SqlParameter("@AppointmentFeedback",fm.AppointmentFeedback),
                    new SqlParameter("@DoctorFeedback",fm.DoctorFeedback),
                    new SqlParameter("@NationalId",fm.NationalId),
                    new SqlParameter("@ReferralId",fm.ReferralId),
                    new SqlParameter("@ReferralRequestId",fm.ReferralRequestId),
                    new SqlParameter("@ReferralSectionId",fm.ReferralSectionId),
                    new SqlParameter("@RegisterId",fm.RegisterId),

                };
            int row = mOperation.SaveData("spAddFeedback", sqlParameters);
            return row;
        }

    }
    */
    }
}
