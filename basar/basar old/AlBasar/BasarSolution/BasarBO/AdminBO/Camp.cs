using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasarBO.AdminBO
{
    public class Camp : IDisposable
    {
        ~Camp() { }
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }
        public short CampId { get; set; }
        public short CampIdOut { get; set; }
        public byte CountryId { get; set; }
        public string CampDsecAr { get; set; }
        public string CampDsecEn { get; set; }
        public short CreationBy { get; set; }
        public short UpdatedBy { get; set; }
        public short CampOrder { get; set; }
        public bool CampStatus { get; set; }
        public string MsgOut { get; set; }
    }
}
