using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasarBO.PlanBO
{
    public class CampSupportAssistance : IDisposable
    {
        ~CampSupportAssistance() { }
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }
        public byte YearId { get; set; }
        public byte CountryId { get; set; }
        public short CampId { get; set; }
        public byte PermitId { get; set; }
        public byte VisaId { get; set; }
        public byte AdvertisementId { get; set; }
        public byte AccommodationId { get; set; }
        public byte CustomsClearanceId { get; set; }
        public byte TransportationId { get; set; }
        public string PhysicainRegStatus { get; set; }
        public string TranslatorsRegStatus { get; set; }
        public string VolunteersRegStatus { get; set; }
        public string OrganizationalTeamStatus { get; set; }
        public string TranslatorsRemark { get; set; }
        public string VolunteersRemark { get; set; }
        public string OrganizationalTeamRemark { get; set; }
        public short AddBy { get; set; }
        public short UpdatedBy { get; set; }
    }
}
