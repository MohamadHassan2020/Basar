using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasarBO.AdminBO
{
    public class TourCountry : IDisposable
    {
        ~TourCountry() { }
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }

        public short TourId { get; set; }
        public byte CountryId { get; set; }
        public short AddBy { get; set; }
        public short UpdatedBy { get; set; }
        public bool TourCountryStatus { get; set; }
        public string MsgOut { get; set; }

    }
}
