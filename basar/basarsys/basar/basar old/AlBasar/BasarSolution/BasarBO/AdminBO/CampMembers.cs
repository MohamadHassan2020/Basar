using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasarBO.AdminBO
{
    public class CampMembers : IDisposable
    {
        ~CampMembers() { }
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }
        public int CampMembersId { get; set; }
        public byte YearId { get; set; }
        public short TeamId { get; set; }
        public int TeamMemberId { get; set; }
        public short CampId { get; set; }
        public byte CountryId { get; set; }
        public short AddBy { get; set; }
        public short UpdatedBy { get; set; }
        public String MsgOut { get; set; }
    }
}
