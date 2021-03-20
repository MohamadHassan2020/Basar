using basarapi.Areas.BasarArea.Db;
using basarapi.Models;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace basarapi.Areas.BasarArea.Controllers.PlanController
{
    [RoutePrefix("basar/CampFollowUpMedia")]
    [Authorize]
    public class CampFollowUpMediaController : ApiController
    {
        readonly BasarLinqDataContext db;
        readonly ApplicationDbContext userDb;
        public CampFollowUpMediaController()
        {
            db = new BasarLinqDataContext();
            userDb = new ApplicationDbContext();
        }

        #region 14-5-2020
        [Route("new")]
        public IHttpActionResult AddCampFollowUpMedia(CampFollowUpMediaModel m)
        {
            using (db)
            {
                if (ModelState.IsValid)
                {
                    //check camp exists in plan
                    var result = db.PlanConfigModels.ToList().FirstOrDefault(p => p.PlanConfigId == m.PlanConfigId);
                    if (result != null)
                    {

                        var resultData = db.CampFollowUpMediaModels.ToList().FirstOrDefault(p => p.PlanConfigId == m.PlanConfigId
                        && p.FollowUpStatusId == m.FollowUpStatusId
                        && p.CampFollowUpMediaNote == m.CampFollowUpMediaNote
                        && p.CampFollowUpMediaDate == m.CampFollowUpMediaDate);

                        if (resultData == null)
                        {
                            m.CampId = result.CampId;
                            m.CampFollowUpMediaAddBy = User.Identity.GetUserId();
                            m.CampStatusId = result.CampStatusId;
                            m.CountryId = result.CountryId;
                            m.PlanConfigYear = result.PlanConfigYear;
                            m.SponsorId = result.SponsorId;
                            m.TeamId = result.TeamId;
                            m.TourId = result.TourId;
                            m.CampFollowUpMediaDateIn = DateTime.Now;

                            db.CampFollowUpMediaModels.InsertOnSubmit(m);
                            db.SubmitChanges();
                            return Ok(m);
                        }
                        else
                        {
                            CampFollowUpMediaModel rowUpdate = db.CampFollowUpMediaModels.ToList().FirstOrDefault(p => p.PlanConfigId == m.PlanConfigId);

                            rowUpdate.CampId = resultData.CampId;
                            rowUpdate.CampStatusId = resultData.CampStatusId;
                            rowUpdate.CountryId = resultData.CountryId;
                            rowUpdate.PlanConfigYear = resultData.PlanConfigYear;
                            rowUpdate.SponsorId = resultData.SponsorId;
                            rowUpdate.TeamId = resultData.TeamId;
                            rowUpdate.TourId = resultData.TourId;
                            rowUpdate.CampFollowUpMediaIsClosed = m.CampFollowUpMediaIsClosed;
                            rowUpdate.CampFollowUpMediaUpdatedBy = User.Identity.GetUserId();
                            rowUpdate.CampFollowUpMediaUpdatedDate = DateTime.Now;


                            db.SubmitChanges();
                            return Ok(m);
                        }

                    }
                }

                List<string> errorlist = new List<string>();
                foreach (var value in ModelState.Values)
                {
                    foreach (var error in value.Errors)
                        errorlist.Add(error.Exception.ToString());
                    //errorlist.Add(value.Errors);
                }
                return Content(HttpStatusCode.BadRequest, errorlist);
            }
        }
        
        [Route("Attachment/Media/New")]
        [HttpPost]
        public IHttpActionResult AddAttachmentCampFollowUpMedia(AttachmentCampFollowUpMediaModel m)
        {
            using (db)
            {
                if (ModelState.IsValid)
                {
                    //check camp exists in plan
                    var result = db.PlanConfigModels.ToList().FirstOrDefault(p => p.PlanConfigId == m.PlanConfigId);
                    if (result != null)
                    {


                        var resultData = db.AttachmentCampFollowUpMediaModels.ToList().FirstOrDefault(p => p.PlanConfigId == m.PlanConfigId
                        && p.FollowUpStatusId == m.FollowUpStatusId
                        && p.CampFollowUpMediaNote == m.CampFollowUpMediaNote
                        && p.AttachmentCampFollowUpMediaDateIn == m.AttachmentCampFollowUpMediaDateIn);

                        if (resultData == null)
                        {
                            int autoNumber = db.AttachmentCampFollowUpMediaModels.ToList().Where(p => p != null)
                               .Select(p => p.AttachmentMediaId + 1)
                               .DefaultIfEmpty(1)
                               .Max();

                            m.AttachmentMediaId = Convert.ToInt32(autoNumber);
                            m.CampId = Convert.ToInt16(result.CampId);
                            m.AttachmentCampFollowUpMediaAddBy = User.Identity.GetUserId();
                            m.CampStatusId = Convert.ToInt16(result.CampStatusId);
                            m.CountryId = Convert.ToByte(result.CountryId);
                            m.PlanConfigYear = Convert.ToInt16(result.PlanConfigYear);
                            m.SponsorId = Convert.ToInt16(result.SponsorId);
                            m.TeamId = Convert.ToInt16(result.TeamId);
                            m.TourId = Convert.ToInt16(result.TourId);
                            m.AttachmentCampFollowUpMediaDateIn = DateTime.Now;

                            db.AttachmentCampFollowUpMediaModels.InsertOnSubmit(m);
                            db.SubmitChanges();
                            return Ok(m);
                        }
                        else
                        {
                            int attachmentDrugId = db.AttachmentCampFollowUpMediaModels.ToList().FirstOrDefault(p => p.PlanConfigId == m.PlanConfigId
                      && p.FollowUpStatusId == m.FollowUpStatusId
                      && p.CampFollowUpMediaNote == m.CampFollowUpMediaNote
                      && p.CampFollowUpMediaDate == m.CampFollowUpMediaDate).AttachmentMediaId;

                            if (attachmentDrugId > 0)
                            {
                                m.AttachmentMediaId = attachmentDrugId;
                                m.CampId = resultData.CampId;
                                m.AttachmentCampFollowUpMediaAddBy = User.Identity.GetUserId();
                                m.CampStatusId = resultData.CampStatusId;
                                m.CountryId = resultData.CountryId;
                                m.PlanConfigYear = resultData.PlanConfigYear;
                                m.SponsorId = resultData.SponsorId;
                                m.TeamId = resultData.TeamId;
                                m.TourId = resultData.TourId;
                                m.AttachmentCampFollowUpMediaDateIn = DateTime.Now;
                                db.AttachmentCampFollowUpMediaModels.InsertOnSubmit(m);
                                db.SubmitChanges();
                                return Ok(m);
                            }
                            return Content(HttpStatusCode.Gone, "Attachment Media exists");
                        }
                    }
                }

                List<string> errorlist = new List<string>();
                foreach (var value in ModelState.Values)
                {
                    foreach (var error in value.Errors)
                        errorlist.Add(error.Exception.ToString());
                    //errorlist.Add(value.Errors);
                }
                return Content(HttpStatusCode.BadRequest, errorlist);
            }
        }
        
       
        [Route("GetAllById")]
        [HttpPost]
        public IHttpActionResult GetCampAllFollowUpMediaById(CampFollowUpMediaSearch m)
        {

            using (db)
            {
                var result = (from campFollow in db.vwGetCampFollowUpMediaWithAttachmentModels.AsEnumerable()

                              join followStatus in db.FollowUpStatusModels
                              on campFollow.FollowUpStatusId equals followStatus.FollowUpStatusId

                              join user in userDb.Users
                              on campFollow.CampFollowUpMediaAddBy equals user.Id



                              select new
                              {
                                  campFollow.PlanConfigId,
                                  campFollow.CampFollowUpMediaDate,
                                  campFollow.CampFollowUpMediaNote,
                                  campFollow.FollowUpStatusId,
                                  campFollow.CampFollowUpMediaDateIn,
                                  campFollow.CampFollowUpMediaDropboxLink,
                                  followStatus.FollowUpStatusDescAR,
                                  followStatus.FollowUpStatusClassName,
                                  user.UserName,
                                  campFollow.AttachmentMediaId

                              })
                    .Where(c => c.PlanConfigId == m.PlanConfigId
                    && (c.FollowUpStatusId == m.FollowUpStatusId || m.FollowUpStatusId == null))
                    .ToList().OrderByDescending(c => c.CampFollowUpMediaDateIn);

                if (result == null)
                {
                    return Content(HttpStatusCode.NoContent, "no record found");
                }
                else
                    return Ok(result);
            }

        }
   
        [Route("GetById")]
        [HttpPost]
        public IHttpActionResult GetCampFollowUpMediaById(CampFollowUpMediaSearch m)
        {
            using (db)
            {
                CampFollowUpMediaModel result = db.CampFollowUpMediaModels.ToList().OrderByDescending(c => c.CampFollowUpMediaDateIn)
                    .FirstOrDefault(c => c.PlanConfigId == m.PlanConfigId
                    && (c.FollowUpStatusId == m.FollowUpStatusId || m.FollowUpStatusId == null));

                if (result == null)
                {
                    return Content(HttpStatusCode.NotFound, "no record found");
                }
                else
                    return Ok(result);
            }

        }

        [Route("MediaAttachment/Get")]
        [HttpPost]
        public IHttpActionResult GetCampFollowUpMediaAttachments(CampFollowUpMediaSearch m)
        {
            using (db)
            {
                IEnumerable<AttachmentCampFollowUpMediaModel> result = db.AttachmentCampFollowUpMediaModels
                    .Where(c => c.AttachmentMediaId == m.AttachmentMediaId)
                    .ToList();

                if (result == null)
                {
                    return Content(HttpStatusCode.NotFound, "no record found");
                }
                else
                    return Ok(result);
            }

        }
        #endregion
    }
    public class CampFollowUpMediaSearch
    {
        public int? PlanConfigId { get; set; }
        public int? AttachmentMediaId { get; set; }
        public short? FollowUpStatusId { get; set; }
    }
}
