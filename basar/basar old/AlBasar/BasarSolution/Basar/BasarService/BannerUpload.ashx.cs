using BasarBLL.Operation.AdminOperation;
using BasarBO.AdminBO;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;

namespace Basar.BasarService
{
    /// <summary>
    /// Summary description for BannerUpload
    /// </summary>
    public class BannerUpload : IHttpHandler, System.Web.SessionState.IRequiresSessionState//error session null
    {


        public void ProcessRequest(HttpContext context)
        {
            if (context.Request.Files.Count > 0)
            {
                LoginAuthentication userLoginInfo = context.Session["loginAuthentication"] as LoginAuthentication;
                //string uploadFile = File.ReadAllText(context.Server.MapPath("../../Uploads/Banners/"), Encoding.UTF8);
                string uploadFile = context.Server.MapPath("../Uploads/Banners/");
                HttpFileCollection selectedFiles = context.Request.Files;
                for (int i = 0; i < selectedFiles.Count; i++)
                {
                    string yearText = HttpContext.Current.Request.QueryString["yearText"].ToString();
                    

                    string dateFolder = HttpContext.Current.Request.QueryString["dateFolder"].ToString();
                    string tour = HttpContext.Current.Request.QueryString["tour"].ToString();
                    string country = HttpContext.Current.Request.QueryString["country"].ToString();
                    string camp = HttpContext.Current.Request.QueryString["camp"].ToString();

                    string yearValue = HttpContext.Current.Request.QueryString["yearValue"].ToString();
                    string tourValue = HttpContext.Current.Request.QueryString["tourValue"].ToString();
                    string countryValue = HttpContext.Current.Request.QueryString["countryValue"].ToString();
                    string campValue = HttpContext.Current.Request.QueryString["campValue"].ToString();


                    //string value = context.Request["value"];
                    HttpPostedFile PostedFile = selectedFiles[i];
                    string vDirectory = "/" + yearText + "/" + tour + "/" + country + "/" + camp + "/" + dateFolder + "/";
                    string myDirectory = uploadFile + vDirectory;
                    if (!Directory.Exists(Path.GetDirectoryName(myDirectory)))
                    {
                        Directory.CreateDirectory(Path.GetDirectoryName(myDirectory));
                    }
                    string FileName = myDirectory
                        + Path.GetFileName(selectedFiles[i].FileName);
                    PostedFile.SaveAs(FileName);
                    using (BannerAttachment bannerAttachment = new BannerAttachment())
                    {
                        bannerAttachment.AddBy = userLoginInfo.UserId;
                        bannerAttachment.BannerFileName = Path.GetFileName(selectedFiles[i].FileName);
                        bannerAttachment.BannerFilePath = vDirectory;
                        bannerAttachment.CampId = Convert.ToInt16(campValue); ;
                        bannerAttachment.CountryId = Convert.ToByte(countryValue);
                        bannerAttachment.TourId = Convert.ToInt16(tourValue);
                        bannerAttachment.YearId = Convert.ToByte(yearValue);
                        using (BannerAttachmentOperation bannerAttachmentOperation = new BannerAttachmentOperation())
                        {
                            bannerAttachmentOperation.AddBannerAttachment(bannerAttachment);
                        }
                    };
                }
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}