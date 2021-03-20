using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasarBO.AdminBO
{
    public class BannerAttachment : IDisposable
    {
        ~BannerAttachment() { }
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }

        public short CampId { get; set; }
        public byte CountryId { get; set; }
        public short TourId { get; set; }
        public short YearId { get; set; }
        public short AddBy { get; set; }
        public string BannerFileName { get; set; }
        public string BannerFilePath { get; set; }
        public short UpdatedBy { get; set; }

    }
}
