using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BasarBO.AdminBO
{
    public class SurveyCategory : IDisposable
    {
        ~SurveyCategory() { }
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }
        public byte SurveyCategoryId { get; set; }
        public byte SurveyCategoryIdOut { get; set; }
        public string SurveyCategoryDescAr { get; set; }
        public string SurveyCategoryDescEn { get; set; }
        public bool SurveyCategoryStatus { get; set; }
        public byte SurveyCategoryOrder { get; set; }
        public short CreationBy { get; set; }
        public short UpdatedBy { get; set; }
        public string MsgOut { get; set; }

    }
}
