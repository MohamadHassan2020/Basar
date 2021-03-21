using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;

namespace basar.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult UserRoles()
        {
            return View();
        }
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult NewUser()
        {
            return View();
        }
        public ActionResult Roles()
        {
            return View();
        }
        public ActionResult RolesGroup()
        {
            return View();
        }
        public ActionResult RoleDivider()
        {
            return View();
        }
        public ActionResult SignIn()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        #region common Msg
        public ActionResult ErrorMsg()
        {
            return PartialView("Common/_ErrorMsg2");
        }
        public ActionResult SuccessMsg()
        {
            return PartialView("Common/_SuccessMsg");
        }
        #endregion

        [HttpPost]
        public JsonResult About(HttpPostedFileBase file)
        {

            using (var client=new HttpClient())
            {
                using (var content = new MultipartFormDataContent())
                {
                    MemoryStream target = new MemoryStream();
                    file.InputStream.CopyTo(target);
                    byte[] Bytes = target.ToArray();

                    file.InputStream.Read(Bytes, 0, Bytes.Length);
                    var fileContent = new ByteArrayContent(Bytes);
                    fileContent.Headers.ContentDisposition = new System.Net.Http.Headers.ContentDispositionHeaderValue("attachment")
                    { };
                    content.Add(fileContent);
                    var requestUri = "http://localhost/basarapi/basar/upload/Test"; 
                    var result = client.PostAsync(requestUri, content).Result;
                    if (result.StatusCode==System.Net.HttpStatusCode.Created)
                    {
                        ViewBag.Success =result.ReasonPhrase;
                    }
                    else
                    {
                        ViewBag.Failed = "Failed !" + result.Content.ToString();
                     
                    }
                }
                return Json("File Uploaded Successfully!", JsonRequestBehavior.AllowGet);
            }
            
        }

        //test2 now it working 

        [HttpPost]
        public ActionResult UploadFiles()
        {
            // Checking no of files injected in Request object  
            if (Request.Files.Count > 0)
            {
                try
                {
                    //  Get all files from Request object  
                    HttpFileCollectionBase files = Request.Files;
                    for (int i = 0; i < files.Count; i++)
                    {
                        //string path = AppDomain.CurrentDomain.BaseDirectory + "Uploads/";  
                        //string filename = Path.GetFileName(Request.Files[i].FileName);  

                        HttpPostedFileBase file = files[i];
                        string fname;

                        // Checking for Internet Explorer  
                        if (Request.Browser.Browser.ToUpper() == "IE" || Request.Browser.Browser.ToUpper() == "INTERNETEXPLORER")
                        {
                            string[] testfiles = file.FileName.Split(new char[] { '\\' });
                            fname = testfiles[testfiles.Length - 1];
                        }
                        else
                        {
                            fname = file.FileName;
                           
                        }

                        // Get the complete folder path and store the file inside it.  
                        fname = Path.Combine(Server.MapPath("~/Uploads/"), fname);
                        file.SaveAs(fname);
                    }
                    // Returns message that successfully uploaded  
                    return Json("File Uploaded Successfully!");
                }
                catch (Exception ex)
                {
                    return Json("Error occurred. Error details: " + ex.Message);
                }
            }
            else
            {
                return Json("No files selected.");
            }
        }



        /* punc project
        public JsonResult UploadBasarFiles(string id, string complaintNumber)
        {
            // Checking no of files injected in Request object
            if (Request.Files.Count > 0)
            {
                //try
                //{
                    // Get all files from Request object
                    HttpFileCollectionBase files = Request.Files;
                    for (int i = 0; i < files.Count; i++)
                    {
                        //string path = AppDomain.CurrentDomain.BaseDirectory + “Uploads/”;
                        //string filename = Path.GetFileName(Request.Files[i].FileName);
                        //ComplaintAttachmentModel cam = ComplaintAttachmentModel.GetInstance();
                        HttpPostedFileBase file = files[i];
                        string fname;
                        // Checking for Internet Explorer
                        if (Request.Browser.Browser.ToUpper() == "IE" || Request.Browser.Browser.ToUpper() == "INTERNETEXPLORER")
                        {
                            string[] testfiles = file.FileName.Split(new char[] { '\\' });
                            fname = testfiles[testfiles.Length - 1];
                        }
                        else
                        {
                            fname = file.FileName;
                        }
                        // Get the complete folder path and store the file inside it.
                        var FolderPath = Server.MapPath("~/Uploads/" + id + "/" + complaintNumber);
                        if (!Directory.Exists(FolderPath))
                        {
                            // Try to create the directory.
                            DirectoryInfo di = Directory.CreateDirectory(FolderPath);
                        }
                        string extension = Path.GetExtension(file.FileName);
                        var myUniqueFileName = string.Format(@"{0}{1}", Guid.NewGuid(), extension);
                        fname = myUniqueFileName;
                        //cam.AttachmentExt = extension;
                        //cam.AttachmentName = fname;
                        //cam.ComplaintNumber = complaintNumber;
                        //cam.IsAccess = false;
                        //cam.UploadBy = User.Identity.GetUserId();
                        //complaintAttachmentModel.AddComplaintAttachment(cam);
                        fname = Path.Combine(FolderPath, fname);
                        file.SaveAs(fname);
                    }
                    // Returns message that successfully uploaded
                    return Json("File Uploaded Successfully!", JsonRequestBehavior.AllowGet);
                //}
                //catch (Exception ex)
                //{
                //    return Json("Error occurred.Error details: " + ex.Message, JsonRequestBehavior.AllowGet);
                //}
            }
            else
            {
                return Json("No files selected.", JsonRequestBehavior.AllowGet);
            }
        }
        */
    }
}