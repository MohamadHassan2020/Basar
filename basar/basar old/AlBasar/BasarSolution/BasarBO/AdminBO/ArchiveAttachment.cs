using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasarBO.AdminBO
{
    public class ArchiveAttachment : IDisposable
    {
        ~ArchiveAttachment() { }
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }
        public string DocumentNumberDaily { get; set; }
        public short AddBy { get; set; }
        public string DocumentFileName { get; set; }
        public string DocumentFilePath { get; set; }
    }
}
