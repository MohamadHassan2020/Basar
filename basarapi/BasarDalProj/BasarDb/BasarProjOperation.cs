using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace BasarDalProj.BasarDb
{
    public class BasarProjOperation : IBasarProj, IDisposable
    {

        //const string Conn= "Data Source=184.168.194.77;User ID=bssuser;Initial Catalog=Basar; Password=Basar@123; Connect Timeout=15;Encrypt=False;Packet Size=4096";

        const string Conn= @"Data Source =.;User ID = sa; Initial Catalog = Basar; Password=M0h35; Connect Timeout = 15; Encrypt=False;Packet Size = 4096";

        public static string DbConn {
            get {
                return Conn;
            }
        }

        #region singleton
        private readonly static object mutex = new object();
        //1
        private static BasarProjOperation instance;
        BasarDbContext dbContext;
        private BasarProjOperation()
        {
            dbContext = BasarDbContext.GetInstance(Conn);
        }
        public static BasarProjOperation GetInstance()
        {
            //onle single by threading
            lock (mutex)
            {
                if (instance == null)
                {
                    instance = new BasarProjOperation();
                }
                return instance;
            }

        }
        #endregion
        public int SaveData([Optional] string procedureName, [Optional] List<SqlParameter> sqlparameter)
        {
            int row = dbContext.SaveData(procedureName, sqlparameter);
            return row;
        }

        public SqlDataReader GetDataReader([Optional] string procedureName, [Optional] List<SqlParameter> sqlparameter)
        {
            return dbContext.GetDataReader(procedureName, sqlparameter);
        }

        public DataTable GetDataTable([Optional] string procedureName, [Optional] List<SqlParameter> sqlparameter)
        {
            DataTable dt = dbContext.GetDataTable(procedureName, sqlparameter);
            return dt;
        }

        #region Date time


        public DateTime GetDateByFormat(string strDate, string dateFormat)
        {
            CultureInfo enUs = new CultureInfo("en-GB");
            return DateTime.ParseExact(strDate, dateFormat, enUs);
        }

        public string GetUmAlQuraFromGregorian(string gregorianDate, string dateFormat, string seprateChar)
        {
            if (!string.IsNullOrEmpty(gregorianDate))
            {
                //try
                //{
                UmAlQuraCalendar cal = new UmAlQuraCalendar();
                int day = cal.GetDayOfMonth(GetDateByFormat(gregorianDate, "yyyy-MM-dd"));
                int month = cal.GetMonth(GetDateByFormat(gregorianDate, "yyyy-MM-dd"));
                int year = cal.GetYear(GetDateByFormat(gregorianDate, "yyyy-MM-dd"));
                string newDay = day > 9 ? day.ToString() : "0" + day.ToString();
                string newMonth = month > 9 ? month.ToString() : "0" + month.ToString();
                string Hij_Date;
                if (dateFormat == "dd" + seprateChar + "MM" + seprateChar + "yyyy")
                {
                    Hij_Date = newDay + seprateChar + newMonth + seprateChar + year.ToString();
                }
                else if (dateFormat == "yyyy" + seprateChar + "MM" + seprateChar + "dd")
                {
                    Hij_Date = year.ToString() + seprateChar + newMonth + seprateChar + newDay;
                }
                else
                {
                    Hij_Date = year.ToString() + seprateChar + newMonth + seprateChar + newDay;
                }
                return Hij_Date;
                //}
                //catch (Exception)
                //{
                //    return string.Empty;
                //}
            }
            else
            {
                return string.Empty;
            }
        }

        public string GetUmAlQuraFromGregorian(DateTime gregorianDate, string dateFormat)
        {
            if (gregorianDate != null)
            {
                UmAlQuraCalendar cal = new UmAlQuraCalendar();
                int day = cal.GetDayOfMonth(gregorianDate);
                int month = cal.GetMonth(gregorianDate);
                int year = cal.GetYear(gregorianDate);
                string newDay = day > 9 ? day.ToString() : "0" + day.ToString();
                string newMonth = month > 9 ? month.ToString() : "0" + month.ToString();
                string Hij_Date;
                if (dateFormat == "dd/MM/yyyy")
                {
                    Hij_Date = newDay + "/" + newMonth + "/" + year.ToString();
                }
                else if (dateFormat == "yyyy/MM/dd")
                {
                    Hij_Date = year.ToString() + "/" + newMonth + "/" + newDay;
                }
                else if (dateFormat == "yyyy-MM-dd")
                {
                    Hij_Date = year.ToString() + "-" + newMonth + "-" + newDay;
                }
                else if (dateFormat == "dd-MM-yyyy")
                {
                    Hij_Date = newDay + "-" + newMonth + "-" + year.ToString();
                }
                else
                {
                    Hij_Date = year.ToString() + "/" + newMonth + "/" + newDay;
                }
                return Hij_Date;
            }

            else
            {
                return "";
            }
        }

        public string GregorianFromUmAlQura(string UmAlQuraDate, string dateFormat)
        {
            string ss = "";

            string[] allFormats ={"yyyy/MM/dd","yyyy/M/d",
                "dd/MM/yyyy","d/M/yyyy",
                "dd/M/yyyy","d/MM/yyyy","yyyy-MM-dd",
                "yyyy-M-d","dd-MM-yyyy","d-M-yyyy",
                "dd-M-yyyy","d-MM-yyyy","yyyy MM dd",
                "yyyy M d","dd MM yyyy","d M yyyy",
                "dd M yyyy","d MM yyyy","dd/MM/yyyy HH:mm"};
            CultureInfo arCul = new CultureInfo("ar-SA");
            CultureInfo enCul = new CultureInfo("en-US");
            UmAlQuraCalendar h = new UmAlQuraCalendar();
            GregorianCalendar g = new GregorianCalendar(GregorianCalendarTypes.USEnglish);
            arCul.DateTimeFormat.Calendar = h;
            //------------ 
            if (UmAlQuraDate.Length <= 0)
            {

                ss = "لا يوجد إدخال";

            }
            try
            {
                DateTime tempDate = DateTime.ParseExact(UmAlQuraDate,
                   allFormats, arCul.DateTimeFormat, DateTimeStyles.AllowWhiteSpaces);
                //ss = tempDate.ToString("dd/MM/yyyy HH:mm", enCul.DateTimeFormat);
                ss = tempDate.ToString(dateFormat, enCul.DateTimeFormat);
            }
            catch
            {
                ss = "";// "التحويل :" + UmAlQuraDate.ToString() + "\n" + ex.Message;
            }
            return ss;
        }
        #endregion
        ~BasarProjOperation() { }
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }
    }
}
