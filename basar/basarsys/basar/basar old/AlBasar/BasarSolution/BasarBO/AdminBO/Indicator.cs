using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasarBO.AdminBO
{
    public class Indicator : IDisposable
    {
        ~Indicator() { }
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }
        public short IndicatorId { get; set; }
        public int IndicatorNumber { get; set; }
        public byte SurveyCategoryId { get; set; }
        public string IndicatorDescAr { get; set; }
        public string IndicatorDescEn { get; set; }
        public bool IndicatorStatus { get; set; }
        public short IndicatorOrder { get; set; }
        public bool IndicatorDivider { get; set; }
        public short CreationBy { get; set; }
        public short UpdatedBy { get; set; }
        public short IndicatorIdOut { get; set; }
        public string MsgOut { get; set; }



    }
}
