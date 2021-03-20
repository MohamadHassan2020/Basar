using BasarBLL.Operation;
using BasarBO.AdminBO;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;

namespace Basar.BasarService
{
    /// <summary>
    /// Summary description for ArchiveUpload
    /// </summary>
    public class ArchiveUpload : IHttpHandler, System.Web.SessionState.IRequiresSessionState//error session null
    {

        public void ProcessRequest(HttpContext context)
        {
            if (context.Request.Files.Count > 0)
            {
                LoginAuthentication userLoginInfo = context.Session["loginAuthentication"] as LoginAuthentication;
                if (userLoginInfo.UserId.ToString() == null)
                {

                }
                else
                {
                    //string uploadFile = File.ReadAllText(context.Server.MapPath("../../Uploads/Banners/"), Encoding.UTF8);
                    string uploadFile = context.Server.MapPath("../Uploads/ArchiveFiles/");
                    HttpFileCollection selectedFiles = context.Request.Files;
                    for (int i = 0; i < selectedFiles.Count; i++)
                    {
                        string yearText = HttpContext.Current.Request.QueryString["yearText"].ToString();
                        string dateFolder = HttpContext.Current.Request.QueryString["dateFolder"].ToString();
                        string yearValue = HttpContext.Current.Request.QueryString["yearValue"].ToString();
                        string documentTypeText = HttpContext.Current.Request.QueryString["documentTypeText"].ToString();
                        string documentTypeValue = HttpContext.Current.Request.QueryString["documentTypeValue"].ToString();
                        string docNum = HttpContext.Current.Request.QueryString["docNum"].ToString();

                        //string value = context.Request["value"];
                        HttpPostedFile PostedFile = selectedFiles[i];
                        string vDirectory = "/" + documentTypeText + "/" + yearText + "/" + docNum + "/" + dateFolder + "/";
                        string myDirectory = uploadFile + vDirectory;
                        if (!Directory.Exists(Path.GetDirectoryName(myDirectory)))
                        {
                            Directory.CreateDirectory(Path.GetDirectoryName(myDirectory));
                        }
                        string FileName = myDirectory
                            + Path.GetFileName(selectedFiles[i].FileName);
                        PostedFile.SaveAs(FileName);
                        
                            
                          

                            List<SqlParameter> sqlparm = new List<SqlParameter>()
                                {
                                    new SqlParameter("@AddBy", userLoginInfo.UserId),
                                    new SqlParameter("@DocumentFileName",Path.GetFileName(selectedFiles[i].FileName)),
                                    new SqlParameter("@DocumentFilePath",vDirectory),
                                    new SqlParameter("@DocumentNumberDaily",docNum)

                                };
                            using (HelperOperation helperOperation = HelperOperation.GetInstance())
                            {
                                helperOperation.ChangeModifyed("spAddArchiveAttachment", sqlparm);
                            };
                        }
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