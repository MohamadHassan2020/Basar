using BasarBLL.Helper.PlanHelper;
using BasarBO.PlanBO;
using BasarDAL.DbaOperation;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasarBLL.Operation.PlanOperation
{
    public class CampEquipmentOperation : IDisposable, ICampEquipment
    {
        #region Camp Equipment

        #endregion
        ~CampEquipmentOperation() { }

        public int AddCampEquipment(CampEquipment campEquipment)
        {
            using (DbaOperationClass dbOperation = new DbaOperationClass())
            {
                List<SqlParameter> sqlparm = new List<SqlParameter>()
                {
                    new SqlParameter("@AddBy", campEquipment.AddBy),
                    new SqlParameter("@AvailableNumber",campEquipment.AvailableNumber),
                    new SqlParameter("@CampId",campEquipment.CampId),
                    new SqlParameter("@CampEquipmentMemo",campEquipment.CampEquipmentMemo),
                    new SqlParameter("@CampEquipmentStatus", campEquipment.CampEquipmentStatus),
                    new SqlParameter("@CountryId", campEquipment.CountryId),
                    new SqlParameter("@EquipmentId", campEquipment.EquipmentId),
                    new SqlParameter("@RequiredNumber", campEquipment.RequiredNumber),
                    new SqlParameter("@UpdatedBy", campEquipment.UpdatedBy),
                    new SqlParameter("@YearId", campEquipment.YearId)
                  
                };
                int row = dbOperation.SaveData("spAddCampEquipment", sqlparm);
                return row;
            };
        }

        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }
    }
}
