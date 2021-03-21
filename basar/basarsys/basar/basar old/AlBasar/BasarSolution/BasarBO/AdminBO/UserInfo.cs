using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasarBO.AdminBO
{
    public class UserInfo : IDisposable
    {
        ~UserInfo() { }
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }
        public short UserId { get; set; }
        public string UserName { get; set; }
    }
}
