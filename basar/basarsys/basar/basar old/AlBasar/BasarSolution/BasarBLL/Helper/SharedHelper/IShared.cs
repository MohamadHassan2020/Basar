using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BasarBLL.Helper.SharedHelper
{
    interface IShared
    {
        string GetUmAlQuraFromGregorian(string gregorianDate, string dateFormat, string seprateChar);
        string GetUmAlQuraFromGregorian(DateTime gregorianDate, string dateFormat);
        string GregorianFromUmAlQura(string UmAlQuraDate, string dateFormat);
        bool CheckExistsValue(string itemValue, Object myControl);
        void DefaultValueDropDownList(string strText, DropDownList ddlName);
        bool CheckExistItem(DropDownList ddltarget, string itemvalue);
        bool CheckExistItem(RadioButtonList rblName, string strValue);
        void MyMessege(UpdatePanel upName, string msg);
        void CheckExistsInfoStatus(Label lblStatus, Image imgStatus, string imgNull, string imgTrue, string imgFalse);
        short GetLoginUserId(SessionParameter loginSession);
        /// <summary>
        /// 
        /// </summary>
        /// <param name="strDate"></param>
        /// <param name="dateFormat"></param>
        /// <returns></returns>
        DateTime GetDateByFormat(string strDate, string dateFormat);
        string EncryptPassword(string clearText);
        string DecryptPassword(string cipherText);
        //string SendSMSMessege(string messege, string mobilenumber);
        bool CheckExistItemTest(DropDownList ddltarget, string itemvalue);
        //string UploadMyFiles(FileUpload fileupload, int filesize, string uploadPath, Attachment attachment);
        //int AddAttachment(Attachment attachment);
        bool CheckFileExists(string fileName, Image img, string filePath);
        string PhotoBase64ImgSrc(string fileNamePath);
    }
}
