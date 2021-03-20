using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasarBO.AdminBO
{
    public class LoginAuthentication : IDisposable
    {
        ~LoginAuthentication() { }
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }
        public short UserId { get; set; }
        public string UserName { get; set; }
        public string UserPassword { get; set; }
        public string UserEmail { get; set; }
        public string UserCode { get; set; }
        public short CreationBy { get; set; }
        public short UpdatedBy { get; set; }
        public bool Authenticated { get; set; }
        public bool IsOutlineStatus { get; set; }
        public bool IsAdminStatus { get; set; }
        public bool IsTeamStatus { get; set; }
        public bool IsHome { get; set; }
        public bool IsArchive { get; set; }
        public bool IsReported { get; set; }
    }
}
