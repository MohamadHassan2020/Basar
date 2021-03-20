using basarapi.Areas.BasarArea.Db;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;

namespace basarapi.Areas.BasarArea.Controllers.AdminController
{
    [RoutePrefix("basar/upload")]
    [Authorize]
    public class UploadController : ApiController
    {
        readonly BasarLinqDataContext db;

        public UploadController()
        {
            db = new BasarLinqDataContext();
        }

        [Route("")]
        public Task<HttpResponseMessage> Post()
        {
            List<string> saveFilePath = new List<string>();
            if (!Request.Content.IsMimeMultipartContent())
            {
                throw new HttpResponseException(HttpStatusCode.UnsupportedMediaType);
            }

            string rootPath = HttpContext.Current.Server.MapPath("~/uploadfiles");

            var provider = new MultipartFileStreamProvider(rootPath);

            var task = Request.Content.ReadAsMultipartAsync(provider).
                ContinueWith<HttpResponseMessage>(t =>
                {
                    if (t.IsCanceled || t.IsFaulted)
                    {
                        Request.CreateErrorResponse(HttpStatusCode.InternalServerError, t.Exception);
                    }
                    using (db)
                    {
                        foreach (MultipartFileData item in provider.FileData)
                        {
                            try
                            {
                                string name = item.Headers.ContentDisposition.FileName.Replace("\"", "");
                                string newFileName = Guid.NewGuid() + Path.GetExtension(name);
                                File.Move(item.LocalFileName, Path.Combine(rootPath, newFileName));


                                Uri baseuri = new Uri(Request.RequestUri.AbsoluteUri.Replace(Request.RequestUri.PathAndQuery, string.Empty));

                                string fileRelativePath = "~/uploadfiles/" + newFileName;
                                Uri fileFullPath = new Uri(baseuri, VirtualPathUtility.ToAbsolute(fileRelativePath));

                                saveFilePath.Add(fileFullPath.ToString());
                                //AttachmentModel
                                AttachmentModel m = new AttachmentModel();
                                AttachmentModel data = db.AttachmentModels.FirstOrDefault(x => x.AttachmentName == newFileName);
                                if (data == null)
                                {

                                    m.AttachmentAddBy = User.Identity.GetUserId();
                                    m.AttachmentName = newFileName;
                                    m.AttachmentExtension = Path.GetExtension(name);
                                    m.AttachmentDateIn = DateTime.Now;

                                    db.AttachmentModels.InsertOnSubmit(m);
                                    db.SubmitChanges();
                                }
                            }
                            catch (Exception ex)
                            {

                                string message = ex.Message;
                                return Request.CreateResponse(HttpStatusCode.BadRequest, message);
                            }
                        }
                        


                    }
                    return Request.CreateResponse(HttpStatusCode.Created, saveFilePath);
                });
            return task;
        }

        [Route("Get")]
        [HttpPost]
        public IHttpActionResult GetAttachments(AttachmentSearch m)
        {
            using (db)
            {
                IEnumerable<AttachmentModel> result = db.AttachmentModels
                    //.Where(c => c.TeamStatus == tm.TeamStatus || tm.TeamStatus == null)
                    .ToList();

                if (result == null)
                {
                    return Content(HttpStatusCode.NotFound, "no record found");
                }
                else
                    return Ok(result);
            }

        }


        #region 5-6-2020

        [Route("Test")]
        [AllowAnonymous]
        public HttpResponseMessage Post2()
        {
            var httpRequest = HttpContext.Current.Request;
            if (httpRequest.Files.Count < 1)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest);
            }
            string folderPath = HttpContext.Current.Server.MapPath("~/upload/");
            if (!Directory.Exists(folderPath))
            {
                // Try to create the directory.
                DirectoryInfo di = Directory.CreateDirectory(folderPath);
            }
            foreach (string file in httpRequest.Files)
            {
                var postedFile = httpRequest.Files[file];
                //var filePath = HttpContext.Current.Server.MapPath("~/upload/" +  postedFile.FileName);
                var filePath = folderPath + "/" + postedFile.FileName;
                postedFile.SaveAs(filePath);
            }

            return Request.CreateResponse(HttpStatusCode.Created);
        }
        #endregion
    }

    public class UploadDetails
    {
        public string FolderName { get; set; }
    }
    public class AttachmentSearch {
        public bool? AttachmentStatus { get; set; }
    }
}
