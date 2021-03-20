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
    [RoutePrefix("basar/CampFollowUpDrug")]
    [Authorize]
    public class CampFollowUpDrugController : ApiController
    {
        readonly BasarLinqDataContext db;
        readonly ApplicationDbContext userDb;
        public CampFollowUpDrugController()
        {
            db = new BasarLinqDataContext();
            userDb = new ApplicationDbContext();
        }

        #region 14-5-2020
        [Route("new")]
        public IHttpActionResult AddCampFollowUpDrug(CampFollowUpDrugModel m)
        {
            using (db)
            {
                if (ModelState.IsValid)
                {
                    //check camp exists in plan
                    var result = db.PlanConfigModels.ToList().FirstOrDefault(p => p.PlanConfigId == m.PlanConfigId);
                    if (result != null)
                    {

                        var resultData = db.CampFollowUpDrugModels.ToList().FirstOrDefault(p => p.PlanConfigId == m.PlanConfigId
                        && p.FollowUpStatusId == m.FollowUpStatusId
                        && p.CampFollowUpDrugsNote == m.CampFollowUpDrugsNote
                        && p.CampFollowUpDrugsDate == m.CampFollowUpDrugsDate);

                        if (resultData == null)
                        {
                            m.CampId = result.CampId;
                            m.CampFollowUpDrugsAddBy = User.Identity.GetUserId();
                            m.CampStatusId = result.CampStatusId;
                            m.CountryId = result.CountryId;
                            m.PlanConfigYear = result.PlanConfigYear;
                            m.SponsorId = result.SponsorId;
                            m.TeamId = result.TeamId;
                            m.TourId = result.TourId;
                            m.CampFollowUpDrugsDateIn = DateTime.Now;

                            db.CampFollowUpDrugModels.InsertOnSubmit(m);
                            db.SubmitChanges();
                            return Ok(m);
                        }
                        else
                        {
                            CampFollowUpDrugModel rowUpdate = db.CampFollowUpDrugModels.ToList().FirstOrDefault(p => p.PlanConfigId == m.PlanConfigId);

                            rowUpdate.CampId = resultData.CampId;
                            rowUpdate.CampStatusId = resultData.CampStatusId;
                            rowUpdate.CountryId = resultData.CountryId;
                            rowUpdate.PlanConfigYear = resultData.PlanConfigYear;
                            rowUpdate.SponsorId = resultData.SponsorId;
                            rowUpdate.TeamId = resultData.TeamId;
                            rowUpdate.TourId = resultData.TourId;
                            rowUpdate.CampFollowUpDrugsIsClosed = m.CampFollowUpDrugsIsClosed;
                            rowUpdate.CampFollowUpDrugsUpdatedBy = User.Identity.GetUserId();
                            rowUpdate.CampFollowUpDrugsUpdatedDate = DateTime.Now;


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
        [Route("Attachment/Drug/New")]
        [HttpPost]
        public IHttpActionResult AddAttachmentCampFollowUpDrug(AttachmentCampFollowUpDrugModel m)
        {
            using (db)
            {
                if (ModelState.IsValid)
                {
                    //check camp exists in plan
                    var result = db.PlanConfigModels.ToList().FirstOrDefault(p => p.PlanConfigId == m.PlanConfigId);
                    if (result != null)
                    {


                        var resultData = db.AttachmentCampFollowUpDrugModels.ToList().FirstOrDefault(p => p.PlanConfigId == m.PlanConfigId
                        && p.FollowUpStatusId == m.FollowUpStatusId
                        && p.CampFollowUpDrugsNote == m.CampFollowUpDrugsNote
                        && p.CampFollowUpDrugsDate == m.CampFollowUpDrugsDate);

                        if (resultData == null)
                        {
                            int autoNumber = db.AttachmentCampFollowUpDrugModels.ToList().Where(p => p != null)
                               .Select(p => p.AttachmentDrugId + 1)
                               .DefaultIfEmpty(1)
                               .Max();

                            m.AttachmentDrugId = Convert.ToInt32(autoNumber);
                            m.CampId = Convert.ToInt16(result.CampId);
                            m.AttachmentCampFollowUpDrugsAddBy = User.Identity.GetUserId();
                            m.CampStatusId = Convert.ToInt16(result.CampStatusId);
                            m.CountryId = Convert.ToByte(result.CountryId);
                            m.PlanConfigYear = Convert.ToInt16(result.PlanConfigYear);
                            m.SponsorId = Convert.ToInt16(result.SponsorId);
                            m.TeamId = Convert.ToInt16(result.TeamId);
                            m.TourId = Convert.ToInt16(result.TourId);
                            m.AttachmentCampFollowUpDrugsDateIn = DateTime.Now;

                            db.AttachmentCampFollowUpDrugModels.InsertOnSubmit(m);
                            db.SubmitChanges();
                            return Ok(m);
                        }
                        else
                        {
                            int attachmentDrugId = db.AttachmentCampFollowUpDrugModels.ToList().FirstOrDefault(p => p.PlanConfigId == m.PlanConfigId
                      && p.FollowUpStatusId == m.FollowUpStatusId
                      && p.CampFollowUpDrugsNote == m.CampFollowUpDrugsNote
                      && p.CampFollowUpDrugsDate == m.CampFollowUpDrugsDate).AttachmentDrugId;

                            if (attachmentDrugId > 0)
                            {
                                m.AttachmentDrugId = attachmentDrugId;
                                m.CampId = resultData.CampId;
                                m.AttachmentCampFollowUpDrugsAddBy = User.Identity.GetUserId();
                                m.CampStatusId = resultData.CampStatusId;
                                m.CountryId = resultData.CountryId;
                                m.PlanConfigYear = resultData.PlanConfigYear;
                                m.SponsorId = resultData.SponsorId;
                                m.TeamId = resultData.TeamId;
                                m.TourId = resultData.TourId;
                                m.AttachmentCampFollowUpDrugsDateIn = DateTime.Now;
                                db.AttachmentCampFollowUpDrugModels.InsertOnSubmit(m);
                                db.SubmitChanges();
                                return Ok(m);
                            }
                            return Content(HttpStatusCode.Gone, "Attachment drug exists");
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
        public IHttpActionResult GetCampAllFollowUpDrugById(CampFollowUpDrugSearch m)
        {

            using (db)
            {
                var result = (from campFollow in db.vwGetCampFollowUpDrugsWithAttachmentModels.AsEnumerable()

                              join followStatus in db.FollowUpStatusModels
                              on campFollow.FollowUpStatusId equals followStatus.FollowUpStatusId

                              join user in userDb.Users
                              on campFollow.CampFollowUpDrugsAddBy equals user.Id



                              select new
                              {
                                  campFollow.PlanConfigId,
                                  campFollow.CampFollowUpDrugsDate,
                                  campFollow.CampFollowUpDrugsNote,
                                  campFollow.FollowUpStatusId,
                                  campFollow.CampFollowUpDrugsDateIn,
                                  followStatus.FollowUpStatusDescAR,
                                  followStatus.FollowUpStatusClassName,
                                  user.UserName,
                                  campFollow.AttachmentDrugId

                              })
                    .Where(c => c.PlanConfigId == m.PlanConfigId
                    && (c.FollowUpStatusId == m.FollowUpStatusId || m.FollowUpStatusId == null))
                    .ToList().OrderByDescending(c => c.CampFollowUpDrugsDateIn);

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
        public IHttpActionResult GetCampFollowUpDrugById(CampFollowUpDrugSearch m)
        {
            using (db)
            {
                CampFollowUpDrugModel result = db.CampFollowUpDrugModels.ToList().OrderByDescending(c => c.CampFollowUpDrugsDateIn)
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

        [Route("DrugAttachments/Get")]
        [HttpPost]
        public IHttpActionResult GetCampFollowUpDrugAttachments(CampFollowUpDrugSearch m)
        {
            using (db)
            {
                IEnumerable<AttachmentCampFollowUpDrugModel> result = db.AttachmentCampFollowUpDrugModels
                    .Where(c => c.AttachmentDrugId == m.AttachmentDrugId)
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
    public class CampFollowUpDrugSearch
    {
        public int? PlanConfigId { get; set; }
        public int? AttachmentDrugId { get; set; }
        public short? FollowUpStatusId { get; set; }
    }
}
