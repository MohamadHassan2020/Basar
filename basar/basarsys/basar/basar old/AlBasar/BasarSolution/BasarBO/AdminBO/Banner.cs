using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasarBO.AdminBO
{
    public class Banner : IDisposable
    {
        ~Banner() { }
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }
        public short CampId { get; set; }
        public byte CountryId { get; set; }
        public short TourId { get; set; }
        public short YearId { get; set; }
        public short AddBy { get; set; }
        public string BannerDesc { get; set; }
        public bool BannerStatus { get; set; }
        public short UpdatedBy { get; set; }
        public string MsgOut { get; set; }
    }
}
