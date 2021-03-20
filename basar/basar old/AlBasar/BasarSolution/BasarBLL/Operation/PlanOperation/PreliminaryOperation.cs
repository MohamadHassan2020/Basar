using BasarBLL.Helper.PlanHelper;
using BasarBO.PlanBO;
using BasarDAL.DbaOperation;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace BasarBLL.Operation.PlanOperation
{
    public class PreliminaryOperation : IDisposable, IPreliminary
    {
        #region Preliminary Operation
        ~PreliminaryOperation() { }
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }
        #endregion


        public int AddPreliminary(Preliminary preliminary)
        {
            using (DbaOperationClass dbOperation = new DbaOperationClass())
            {
                List<SqlParameter> sqlparm = new List<SqlParameter>()
                {
                    new SqlParameter("@AddBy", preliminary.AddBy),
                    new SqlParameter("@AvailableNumber",preliminary.AvailableNumber),
                    new SqlParameter("@CampId",preliminary.CampId),
                    new SqlParameter("@CampIndicatorMemo",preliminary.CampIndicatorMemo),
                    new SqlParameter("@CampIndicatorStatus", preliminary.CampIndicatorStatus),
                    new SqlParameter("@CountryId", preliminary.CountryId),
                    new SqlParameter("@IndicatorDivider", preliminary.IndicatorDivider),
                    new SqlParameter("@IndicatorId", preliminary.IndicatorId),
                    new SqlParameter("@MissingNumber", preliminary.MissingNumber),
                    new SqlParameter("@RequiredNumber", preliminary.RequiredNumber),
                    new SqlParameter("@SurveyCategoryId", preliminary.SurveyCategoryId),
                    new SqlParameter("@UpdatedBy", preliminary.UpdatedBy),
                    new SqlParameter("@YearId", preliminary.YearId)
                };
                int row = dbOperation.SaveData("spAddPreliminary", sqlparm);
                return row;
            };
        }
       


    }
}
