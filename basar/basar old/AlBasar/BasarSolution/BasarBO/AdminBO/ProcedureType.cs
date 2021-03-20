using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasarBO.AdminBO
{
    public class ProcedureType : IDisposable
    {
        ~ProcedureType() { }
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }

    }
}
