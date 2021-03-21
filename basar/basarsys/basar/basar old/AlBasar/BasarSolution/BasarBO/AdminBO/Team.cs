using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasarBO.AdminBO
{
    public class Team : IDisposable
    {
        ~Team() { }
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }

        public short TeamId { get; set; }
        public short TeamIdOut { get; set; }
        public string TeamDsecAr { get; set; }
        public string TeamDsecEn { get; set; }
        public short CreationBy { get; set; }
        public short UpdatedBy { get; set; }
        public short TeamOrder { get; set; }
        public bool TeamStatus { get; set; }
        public string MsgOut { get; set; }
    }
}
