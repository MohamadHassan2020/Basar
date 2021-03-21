using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasarBO.AdminBO
{
    public class ISupportAssistance : IDisposable
    {
        ~ISupportAssistance() { }
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }
        public short SupportAssistanceId { get; set; }
        public short SupportAssistanceIdOut { get; set; }
        public string SupportAssistanceDsecAr { get; set; }
        public string SupportAssistanceDsecEn { get; set; }
        public short CreationBy { get; set; }
        public short UpdatedBy { get; set; }
        public short SupportAssistanceOrder { get; set; }
        public bool SupportAssistanceStatus { get; set; }
    }
}
