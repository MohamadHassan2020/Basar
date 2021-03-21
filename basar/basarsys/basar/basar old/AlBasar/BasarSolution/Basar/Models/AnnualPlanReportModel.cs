using BasarBLL.Operation;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Basar.Models
{
    public class AnnualPlanReportModel : IDisposable
    {
        ~AnnualPlanReportModel() { }
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }

        #region singleton
        private static readonly object mutex = new object();
        //1
        private static AnnualPlanReportModel instance;
        //3
        public static AnnualPlanReportModel GetInstance()
        {
            //onle single by threading
            lock (mutex)
            {
                if (instance == null)
                {
                    instance = new AnnualPlanReportModel();
                }
                return instance;
            }

        }
        #endregion
        #region fields  

        public byte? YearId { get; set; }
        public byte? CountryId { get; set; }
        public short? TourId { get; set; }
        public short? TeamId { get; set; }
        public short? CampId { get; set; }
        public short? SponsorId { get; set; }
        public short? CampStatusId { get; set; }
        public string CampDsecAr { get; set; }
        public string TourDsecAr { get; set; }
        public string SponsorDsecAr { get; set; }
        public string AnnualPlanStartDateFormat { get; set; }
        public string AnnualPlanEndDateFormat { get; set; }
        public string CountryDsecAr { get; set; }
        public string AnnualPlanRemark { get; set; }
        public bool PreliminaryStatus { get; set; }
        public string CampStatusDescAR { get; set; }
        public string YearNameAr { get; set; }
        public string ReportName { get; set; }
        #endregion
        #region actions
        readonly HelperOperation helperOperation;

        public AnnualPlanReportModel()
        {
            helperOperation = HelperOperation.GetInstance();
        }
        public List<AnnualPlanReportModel> GetAnnualPlanReport(AnnualPlanReportModel aprm)
        {
            List<AnnualPlanReportModel> annualPlanReports = new List<AnnualPlanReportModel>();
            List<SqlParameter> sqlParameters = new List<SqlParameter>()
                {
                    new SqlParameter("@CampId",aprm.CampId),
                    new SqlParameter("@CampStatusId",aprm.CampStatusId),
                    new SqlParameter("@CountryId",aprm.CountryId),
                    new SqlParameter("@SponsorId",aprm.SponsorId),
                    new SqlParameter("@TeamId",aprm.TeamId),
                    new SqlParameter("@TourId",aprm.TourId),
                    new SqlParameter("@YearId",aprm.YearId)
                };
            using (SqlDataReader sqlDataReader = helperOperation.GetDataReader("spGetAnnualPlanReport", sqlParameters))
            {
                while (sqlDataReader.Read())
                {
                    using (AnnualPlanReportModel annualPlanRpt = new AnnualPlanReportModel())
                    {
                        annualPlanRpt.CampDsecAr = sqlDataReader["CampDsecAr"].ToString();
                        annualPlanReports.Add(annualPlanRpt);
                    }
                };
                return annualPlanReports;
            }
        }
        public DataTable GetAnnualPlanReportDT(AnnualPlanReportModel aprm)
        {
            List<AnnualPlanReportModel> annualPlanReports = new List<AnnualPlanReportModel>();
            List<SqlParameter> sqlParameters = new List<SqlParameter>()
                {
                    new SqlParameter("@CampId",aprm.CampId),
                    new SqlParameter("@CampStatusId",aprm.CampStatusId),
                    new SqlParameter("@CountryId",aprm.CountryId),
                    new SqlParameter("@SponsorId",aprm.SponsorId),
                    new SqlParameter("@TeamId",aprm.TeamId),
                    new SqlParameter("@TourId",aprm.TourId),
                    new SqlParameter("@YearId",aprm.YearId)
                };
            using (DataTable dt = helperOperation.GetDataTable("spGetAnnualPlanReport", sqlParameters))
            {
                return dt;
            }
        }
        /*
        public int AddCarModel(CarModel cm)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>()
                {
                    new SqlParameter("@ModelId",cm.ModelId),
                    new SqlParameter("@CategoryId",cm.CategoryId),
                    new SqlParameter("@ModelName",cm.ModelName),
                    new SqlParameter("@ModelNameEN",cm.ModelNameEN),
                    new SqlParameter("@IsActived",cm.IsActived)
                };
            int row = mOperation.SaveData("spAddCarModel", sqlParameters);
            return row;
        }
        */
        #endregion
    }
}