using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasarBO.PlanBO
{
    public class AnnualPlan : IDisposable
    {
        ~AnnualPlan() { }
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }
        public int AnnualPlanId { get; set; }
        public int AnnualPlanIdOut { get; set; }
        public byte YearId { get; set; }
        public short TeamId { get; set; }
        public short TourId { get; set; }
        public byte CountryId { get; set; }
        public short CampId { get; set; }
        public short CampStatusId { get; set; }
        public short SponsorId { get; set; }
        public DateTime AnnualPlanStartDate { get; set; }
        public DateTime AnnualPlanEndDate { get; set; }
        public short AnnualPlanAddBy { get; set; }
        public short AnnualPlanUpdatedBy { get; set; }
        public bool AnnualPlanStatus { get; set; }
        public bool PreliminaryStatus { get; set; }
        public string AnnualPlanRemark { get; set; }
        public string MsgOut { get; set; }
    }
}
