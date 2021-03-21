using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasarBO.AdminBO
{
    public class Tour : IDisposable
    {
        ~Tour() { }
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }
        public short TourId { get; set; }
        public short TeamId { get; set; }
        public short TourIdOut { get; set; }
        public string TourDsecAr { get; set; }
        public string TourDsecEn { get; set; }
        public short CreationBy { get; set; }
        public short UpdatedBy { get; set; }
        public short TourOrder { get; set; }
        public bool TourStatus { get; set; }
        public string MsgOut { get; set; }
    }
}
