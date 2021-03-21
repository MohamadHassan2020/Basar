using BasarBLL.Helper.SharedHelper;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace BasarBLL.Operation.SharedOperation
{
    public class SharedOp : IShared, IDisposable
    {
        ~SharedOp() { }
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }
        bool checkInvalidDate(string strValue)
        {
            try
            {
                convertToDate(strValue);
                return false;
            }
            catch (Exception)
            {

                return true;
            }
        }
        DateTime convertToDate(string strValue)
        {
            using (SharedOp sharedOperation = new SharedOp())
            {
                return sharedOperation.GetDateByFormat(strValue, "yyyy-MM-dd");
            }
        }
        public void DefaultValueDropDownList(string strText, System.Web.UI.WebControls.DropDownList ddlName)
        {
            ListItem li = new ListItem(strText, "-1");
            ddlName.Items.Insert(0, li);
        }
       


        public bool CheckExistItem(DropDownList ddltarget, string itemvalue)
        {
            bool returnvalue;
            ListItem li = ddltarget.Items.FindByValue(itemvalue);
            if (li != null)
            {
                li.Selected = true;
                returnvalue = true;
            }
            else
            {
                returnvalue = false;
            }
            return returnvalue;
        }
        public void MyMessege(System.Web.UI.UpdatePanel upName, string msg)
        {
            string CloseWindow;
            CloseWindow = "alert('" + msg + "')";
            ScriptManager.RegisterStartupScript(upName, upName.GetType(), "CloseWindow", CloseWindow, true);
        }
        public void CheckExistsInfoStatus(Label lblStatus, System.Web.UI.WebControls.Image imgStatus, string imgNull, string imgTrue, string imgFalse)
        {
            if (string.IsNullOrEmpty(lblStatus.Text.ToLower()))
            {
                imgStatus.ImageUrl = imgNull;
            }
            else if (string.Equals(lblStatus.Text.ToLower(), "false"))
            {
                imgStatus.ImageUrl = imgFalse;
            }
            else if (string.Equals(lblStatus.Text.ToLower(), "true"))
            {
                imgStatus.ImageUrl = imgTrue;
            }
        }


        public short GetLoginUserId(SessionParameter loginSession)
        {
            throw new NotImplementedException();
        }


        public DateTime GetDateByFormat(string strDate, string dateFormat)
        {
            CultureInfo enUs = new CultureInfo("en-Us");
            return DateTime.ParseExact(strDate, dateFormat, enUs);
        }


        public bool CheckExistItem(RadioButtonList rblName, string strValue)
        {
            ListItem li = rblName.Items.FindByValue(strValue);
            if (li != null)
            {
                li.Selected = true;
                return true;
            }
            else
            {
                return false;
            }

        }

        public string EncryptPassword(string clearText)
        {
            string EncryptionKey = "MHMIIA3520103132011";
            byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    clearText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return clearText;
        }

        public string DecryptPassword(string cipherText)
        {
            string EncryptionKey = "MHMIIA3520103132011";
            byte[] cipherBytes = Convert.FromBase64String(cipherText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(cipherBytes, 0, cipherBytes.Length);
                        cs.Close();
                    }
                    cipherText = Encoding.Unicode.GetString(ms.ToArray());
                }
            }
            return cipherText;
        }

        public bool CheckExistsValue(string itemValue, object myControl)
        {
            bool returnvalue = false;
            if (myControl.GetType() == typeof(DropDownList))
            {
                ListItem li = ((DropDownList)myControl).Items.FindByValue(itemValue);
                if (li != null)
                {
                    li.Selected = true;
                    returnvalue = true;
                }
                else
                {
                    returnvalue = false;
                }
            }
            else if (myControl.GetType() == typeof(RadioButtonList))
            {
                ListItem li = ((RadioButtonList)myControl).Items.FindByValue(itemValue);
                if (li != null)
                {
                    li.Selected = true;
                    returnvalue = true;
                }
                else
                {
                    returnvalue = false;
                }
            }
            else if (myControl.GetType() == typeof(CheckBoxList))
            {
                ListItem li = ((CheckBoxList)myControl).Items.FindByValue(itemValue);
                if (li != null)
                {
                    li.Selected = true;
                    returnvalue = true;
                }
                else
                {
                    returnvalue = false;
                }
            }
            return returnvalue;
        }
        public bool CheckExistItemTest(DropDownList ddltarget, string itemvalue)
        {
            bool returnvalue;
            ListItem li = ddltarget.Items.FindByValue(itemvalue);
            if (li != null)
            {
                li.Selected = true;
                returnvalue = true;
            }
            else
            {

                returnvalue = false;
            }
            return returnvalue;
        }

       

        //public string UploadMyFiles(FileUpload fileupload, int filesize, string uploadPath, Attachment attachment)
        //{
        //    string fileName = string.Empty;
        //    if (fileupload.HasFile)
        //    {
        //        if (!Directory.Exists(uploadPath))
        //        {
        //            Directory.CreateDirectory(uploadPath);
        //        }
        //        int fileSizeUpload = fileupload.PostedFile.ContentLength;
        //        if (fileSizeUpload <= filesize)
        //        {
        //            fileName = fileupload.FileName;
        //            AddAttachment(attachment);
        //            fileupload.PostedFile.SaveAs(uploadPath + "\\" + fileName);
        //            return ("تم تحميل الملف بنجاح");
        //        }
        //        else
        //        {
        //            return ("حجم الملف كبير");
        //        }
        //    }
        //    else
        //    {
        //        return ("اختر الملف");
        //    }
        //}

        //public int AddAttachment(Attachment attachment)
        //{
        //    using (DbOperation systemClass = new DbOperation())
        //    {
        //        List<SqlParameter> sqlparm = new List<SqlParameter>()
        //        {
        //            new SqlParameter("@AttachmentDay", attachment.AttachmentDay),
        //            new SqlParameter("@AttachmentFile", attachment.AttachmentFile),
        //            new SqlParameter("@AttachmentMonth", attachment.AttachmentMonth),
        //            new SqlParameter("@AttachmentPath",attachment.AttachmentPath),
        //            new SqlParameter("@AttachmentStatus", attachment.AttachmentStatus),
        //            new SqlParameter("@AttachmentYear",attachment.AttachmentYear ),
        //            new SqlParameter("@CreationBy",attachment.CreationBy ),
        //            new SqlParameter("@BookingId",attachment.BookingId ),
        //            new SqlParameter("@UpdatedBy",attachment.UpdatedBy )
        //        };
        //        int row = systemClass.SaveData("spAddAttachment", sqlparm);
        //        return row;
        //    }
        //}

        public string GetUmAlQuraFromGregorian(string gregorianDate, string dateFormat, string seprateChar)
        {
            if (!string.IsNullOrEmpty(gregorianDate))
            {
                //try
                //{
                UmAlQuraCalendar cal = new UmAlQuraCalendar();
                int day = cal.GetDayOfMonth(convertToDate(gregorianDate));
                int month = cal.GetMonth(convertToDate(gregorianDate));
                int year = cal.GetYear(convertToDate(gregorianDate));
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
            catch (Exception ex)
            {
                ss = "";// "التحويل :" + UmAlQuraDate.ToString() + "\n" + ex.Message;
            }
            return ss;
        }

        public bool CheckFileExists(string fileName, System.Web.UI.WebControls.Image img, string filePath)
        {
            bool imgstatus;

            string file = string.Format(@filePath + @"\{0}.{1}", fileName, "PNG".ToLower());
            if (!File.Exists(file))
            {
                imgstatus = false;
                img.Visible = false;
            }
            else
            {
                imgstatus = true;
                img.ImageUrl = PhotoBase64ImgSrc(file);
                img.Visible = true;


            }
            return imgstatus;
        }

        public string PhotoBase64ImgSrc(string fileNamePath)
        {
            byte[] byteArray = File.ReadAllBytes(fileNamePath);
            string base64 = Convert.ToBase64String(byteArray);
            return string.Format("data:image/gif;base64,{0}", base64);
        }
    }
}
