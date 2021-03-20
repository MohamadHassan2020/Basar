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
    public class CampSupportAssistanceOperation : IDisposable, ICampSupportAssistance
    {
        ~CampSupportAssistanceOperation() { }

        public int AddCampSupportAssistance(CampSupportAssistance campSupportAssistance)
        {
            using (DbaOperationClass dbOperation = new DbaOperationClass())
            {
                List<SqlParameter> sqlparm = new List<SqlParameter>()
                {
                    new SqlParameter("@AccommodationId", campSupportAssistance.AccommodationId),
                    new SqlParameter("@AddBy",campSupportAssistance.AddBy),
                    new SqlParameter("@AdvertisementId",campSupportAssistance.AdvertisementId),
                    new SqlParameter("@CampId",campSupportAssistance.CampId),
                    new SqlParameter("@CountryId", campSupportAssistance.CountryId),
                    new SqlParameter("@CustomsClearanceId", campSupportAssistance.CustomsClearanceId),
                    new SqlParameter("@OrganizationalTeamRemark", campSupportAssistance.OrganizationalTeamRemark),
                    new SqlParameter("@OrganizationalTeamStatus", campSupportAssistance.OrganizationalTeamStatus),
                    new SqlParameter("@PermitId", campSupportAssistance.PermitId),
                    new SqlParameter("@PhysicainRegStatus", campSupportAssistance.PhysicainRegStatus),
                    new SqlParameter("@TranslatorsRegStatus", campSupportAssistance.TranslatorsRegStatus),
                    new SqlParameter("@TranslatorsRemark", campSupportAssistance.TranslatorsRemark),
                    new SqlParameter("@TransportationId", campSupportAssistance.TransportationId),
                    new SqlParameter("@UpdatedBy", campSupportAssistance.UpdatedBy),
                    new SqlParameter("@VisaId", campSupportAssistance.VisaId),
                    new SqlParameter("@VolunteersRegStatus", campSupportAssistance.VolunteersRegStatus),
                    new SqlParameter("@VolunteersRemark", campSupportAssistance.VolunteersRemark),
                    new SqlParameter("@YearId", campSupportAssistance.YearId)
                };
                int row = dbOperation.SaveData("spAddCampSupportAssistance", sqlparm);
                return row;
            }
        }

        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }
    }
}
