using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasarBO.PlanBO
{
    public class CampEquipment : IDisposable
    {
        ~CampEquipment() { }
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }
        public int CampEquipmentId { get; set; }
        public byte YearId { get; set; }
        public byte CountryId { get; set; }
        public short CampId { get; set; }
        public short EquipmentId { get; set; }
        public short RequiredNumber { get; set; }
        public short AvailableNumber { get; set; }
        public string CampEquipmentStatus { get; set; }
        public string CampEquipmentMemo { get; set; }
        public short AddBy { get; set; }
        public short UpdatedBy { get; set; }

    }
}
