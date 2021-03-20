using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasarBO.AdminBO
{
    public class CampMembersFilter : IDisposable
    {
        ~CampMembersFilter() { }
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }
        public byte YearId { get; set; }
        public short? TeamId { get; set; }
        public short CampId { get; set; }
    }
}
