using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasarBO.AdminBO
{
    public class Country : IDisposable
    {
        ~Country() { }
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }
        public byte CountryId { get; set; }
        public byte CountryIdOut { get; set; }
        public short TeamId { get; set; }
        public short TourId { get; set; }
        public string CountryDsecAr { get; set; }
        public string CountryDsecEn { get; set; }
        public short CreationBy { get; set; }
        public short UpdatedBy { get; set; }
        public byte CountryOrder { get; set; }
        public bool CountryStatus { get; set; }
        public string MsgOut { get; set; }

    }
}
