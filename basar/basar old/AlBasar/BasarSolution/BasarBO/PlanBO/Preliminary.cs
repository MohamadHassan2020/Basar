using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasarBO.PlanBO
{
    public class Preliminary : IDisposable
    {
        ~Preliminary() { }
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }
        public int PreliminaryId { get; set; }
        public byte YearId { get; set; }
        public byte CountryId { get; set; }
        public short CampId { get; set; }
        public byte SurveyCategoryId { get; set; }
        public short IndicatorId { get; set; }
        public short RequiredNumber { get; set; }
        public short AvailableNumber { get; set; }
        public short MissingNumber { get; set; }
        public string CampIndicatorStatus { get; set; }
        public string CampIndicatorMemo { get; set; }
        public bool IndicatorDivider { get; set; }
        public short AddBy { get; set; }
        public short UpdatedBy { get; set; }
    }
}
