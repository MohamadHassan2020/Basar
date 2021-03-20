using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasarBO.AdminBO
{
    public class Sponsor : IDisposable
    {
        ~Sponsor() { }
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }
        public short SponsorId { get; set; }
        public short SponsorIdOut { get; set; }
        public string SponsorDsecAr { get; set; }
        public string SponsorDsecEn { get; set; }
        public short CreationBy { get; set; }
        public short UpdatedBy { get; set; }
        public short SponsorOrder { get; set; }
        public bool SponsorStatus { get; set; }
        public string MsgOut { get; set; }
    }
}
