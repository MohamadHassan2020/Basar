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
    [RoutePrefix("basar/CampFollowUpAdministrative")]
    [Authorize]
    public class CampFollowUpAdministrativeController : ApiController
    {
        readonly BasarLinqDataContext db;
        readonly ApplicationDbContext userDb;
        public CampFollowUpAdministrativeController()
        {
            db = new BasarLinqDataContext();
            userDb = new ApplicationDbContext();
        }

        #region 14-5-2020
        [Route("new")]
        public IHttpActionResult AddCampFollowUpAdministrative(CampFollowUpAdministrativeModel m)
        {
            using (db)
            {
                if (ModelState.IsValid)
                {
                    //check camp exists in plan
                    var result = db.PlanConfigModels.ToList().FirstOrDefault(p => p.PlanConfigId == m.PlanConfigId);
                    if (result != null)
                    {

                        var resultData = db.CampFollowUpAdministrativeModels.ToList().FirstOrDefault(p => p.PlanConfigId == m.PlanConfigId
                        && p.FollowUpStatusId == m.FollowUpStatusId
                        && p.CampFollowUpAdministrativeNote == m.CampFollowUpAdministrativeNote
                        && p.CampFollowUpAdministrativeDate == m.CampFollowUpAdministrativeDate);

                        if (resultData == null)
                        {
                            m.CampId = result.CampId;
                            m.CampFollowUpAdministrativeAddBy = User.Identity.GetUserId();
                            m.CampStatusId = result.CampStatusId;
                            m.CountryId = result.CountryId;
                            m.PlanConfigYear = result.PlanConfigYear;
                            m.SponsorId = result.SponsorId;
                            m.TeamId = result.TeamId;
                            m.TourId = result.TourId;
                            m.CampFollowUpAdministrativeDateIn = DateTime.Now;

                            db.CampFollowUpAdministrativeModels.InsertOnSubmit(m);
                            db.SubmitChanges();
                            return Ok(m);
                        }
                        else
                        {
                            CampFollowUpAdministrativeModel rowUpdate = db.CampFollowUpAdministrativeModels.ToList().FirstOrDefault(p => p.PlanConfigId == m.PlanConfigId);

                            rowUpdate.CampId = resultData.CampId;
                            rowUpdate.CampStatusId = resultData.CampStatusId;
                            rowUpdate.CountryId = resultData.CountryId;
                            rowUpdate.PlanConfigYear = resultData.PlanConfigYear;
                            rowUpdate.SponsorId = resultData.SponsorId;
                            rowUpdate.TeamId = resultData.TeamId;
                            rowUpdate.TourId = resultData.TourId;
                            rowUpdate.CampFollowUpAdministrativeIsClosed = m.CampFollowUpAdministrativeIsClosed;
                            rowUpdate.CampFollowUpAdministrativeUpdatedBy = User.Identity.GetUserId();
                            rowUpdate.CampFollowUpAdministrativeUpdatedDate = DateTime.Now;

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
        
        [Route("Attachment/Administrative/New")]
        [HttpPost]
        public IHttpActionResult AddAttachmentCampFollowUpAdministrative(AttachmentCampFollowUpAdministrativeModel m)
        {
            using (db)
            {
                if (ModelState.IsValid)
                {
                    //check camp exists in plan
                    var result = db.PlanConfigModels.ToList().FirstOrDefault(p => p.PlanConfigId == m.PlanConfigId);
                    if (result != null)
                    {


                        var resultData = db.AttachmentCampFollowUpAdministrativeModels.ToList().FirstOrDefault(p => p.PlanConfigId == m.PlanConfigId
                        && p.FollowUpStatusId == m.FollowUpStatusId
                        && p.CampFollowUpAdministrativeNote == m.CampFollowUpAdministrativeNote
                        && p.AttachmentCampFollowUpAdministrativeDateIn == m.AttachmentCampFollowUpAdministrativeDateIn);

                        if (resultData == null)
                        {
                            int autoNumber = db.AttachmentCampFollowUpAdministrativeModels.ToList().Where(p => p != null)
                               .Select(p => p.AttachmentAdministrativeId + 1)
                               .DefaultIfEmpty(1)
                               .Max();

                            m.AttachmentAdministrativeId = Convert.ToInt32(autoNumber);
                            m.CampId = Convert.ToInt16(result.CampId);
                            m.AttachmentCampFollowUpAdministrativeAddBy = User.Identity.GetUserId();
                            m.CampStatusId = Convert.ToInt16(result.CampStatusId);
                            m.CountryId = Convert.ToByte(result.CountryId);
                            m.PlanConfigYear = Convert.ToInt16(result.PlanConfigYear);
                            m.SponsorId = Convert.ToInt16(result.SponsorId);
                            m.TeamId = Convert.ToInt16(result.TeamId);
                            m.TourId = Convert.ToInt16(result.TourId);
                            m.AttachmentCampFollowUpAdministrativeDateIn = DateTime.Now;

                            db.AttachmentCampFollowUpAdministrativeModels.InsertOnSubmit(m);
                            db.SubmitChanges();
                            return Ok(m);
                        }
                        else
                        {
                            int attachmentDrugId = db.AttachmentCampFollowUpAdministrativeModels.ToList().FirstOrDefault(p => p.PlanConfigId == m.PlanConfigId
                      && p.FollowUpStatusId == m.FollowUpStatusId
                      && p.CampFollowUpAdministrativeNote == m.CampFollowUpAdministrativeNote
                      && p.CampFollowUpAdministrativeDate == m.CampFollowUpAdministrativeDate).AttachmentAdministrativeId;

                            if (attachmentDrugId > 0)
                            {
                                m.AttachmentAdministrativeId = attachmentDrugId;
                                m.CampId = resultData.CampId;
                                m.AttachmentCampFollowUpAdministrativeAddBy = User.Identity.GetUserId();
                                m.CampStatusId = resultData.CampStatusId;
                                m.CountryId = resultData.CountryId;
                                m.PlanConfigYear = resultData.PlanConfigYear;
                                m.SponsorId = resultData.SponsorId;
                                m.TeamId = resultData.TeamId;
                                m.TourId = resultData.TourId;
                                m.AttachmentCampFollowUpAdministrativeDateIn = DateTime.Now;
                                db.AttachmentCampFollowUpAdministrativeModels.InsertOnSubmit(m);
                                db.SubmitChanges();
                                return Ok(m);
                            }
                            return Content(HttpStatusCode.Gone, "Attachment Administrative exists");
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
        public IHttpActionResult GetCampAllFollowUpAdministrativeById(CampFollowUpAdministrativeSearch m)
        {

            using (db)
            {
                var result = (from campFollow in db.vwGetCampFollowUpAdministrativeWithAttachmentModels.AsEnumerable()

                              join followStatus in db.FollowUpStatusModels
                              on campFollow.FollowUpStatusId equals followStatus.FollowUpStatusId

                              join user in userDb.Users
                              on campFollow.CampFollowUpAdministrativeAddBy equals user.Id



                              select new
                              {
                                  campFollow.PlanConfigId,
                                  campFollow.CampFollowUpAdministrativeDate,
                                  campFollow.CampFollowUpAdministrativeNote,
                                  campFollow.FollowUpStatusId,
                                  campFollow.CampFollowUpAdministrativeDateIn,
                                  campFollow.CampFollowUpAdministrativeIsSignature,
                                  followStatus.FollowUpStatusDescAR,
                                  followStatus.FollowUpStatusClassName,
                                  user.UserName,
                                  campFollow.AttachmentAdministrativeId

                              })
                    .Where(c => c.PlanConfigId == m.PlanConfigId
                    && (c.FollowUpStatusId == m.FollowUpStatusId || m.FollowUpStatusId == null))
                    .ToList().OrderByDescending(c => c.CampFollowUpAdministrativeDateIn);

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
        public IHttpActionResult GetCampFollowUpAdministrativeById(CampFollowUpAdministrativeSearch m)
        {
            using (db)
            {
                CampFollowUpAdministrativeModel result = db.CampFollowUpAdministrativeModels.ToList().OrderByDescending(c => c.CampFollowUpAdministrativeDateIn)
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

        [Route("AdministrativeAttachment/Get")]
        [HttpPost]
        public IHttpActionResult GetCampFollowUpAdministrativeAttachments(CampFollowUpAdministrativeSearch m)
        {
            using (db)
            {
                IEnumerable<AttachmentCampFollowUpAdministrativeModel> result = db.AttachmentCampFollowUpAdministrativeModels
                    .Where(c => c.AttachmentAdministrativeId == m.AttachmentAdministrativeId)
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
    public class CampFollowUpAdministrativeSearch
    {
        public int? PlanConfigId { get; set; }
        public int? AttachmentAdministrativeId { get; set; }
        public short? FollowUpStatusId { get; set; }
    }
}
