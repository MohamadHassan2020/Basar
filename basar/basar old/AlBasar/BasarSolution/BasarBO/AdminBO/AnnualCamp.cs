using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasarBO.AdminBO
{
    public class AnnualCamp : IDisposable
    {
        ~AnnualCamp() { }
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }
        public short? CampId { get; set; }
        public byte? CountryId { get; set; }
        public short? TourId { get; set; }
        public short? YearId { get; set; }
    }
}
