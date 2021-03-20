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
    [RoutePrefix("basar/CampFollowUpFinancial")]
    [Authorize]
    public class CampFollowUpFinancialController : ApiController
    {
        readonly BasarLinqDataContext db;
        readonly ApplicationDbContext userDb;
        public CampFollowUpFinancialController()
        {
            db = new BasarLinqDataContext();
            userDb = new ApplicationDbContext();
        }

        #region 14-5-2020
        [Route("new")]
        public IHttpActionResult AddCampFollowUpFinancial(CampFollowUpFinancialModel m)
        {
            using (db)
            {
                if (ModelState.IsValid)
                {
                    //check camp exists in plan
                    var result = db.PlanConfigModels.ToList().FirstOrDefault(p => p.PlanConfigId == m.PlanConfigId);
                    if (result != null)
                    {

                        var resultData = db.CampFollowUpFinancialModels.ToList().FirstOrDefault(p => p.PlanConfigId == m.PlanConfigId
                        && p.FollowUpStatusId == m.FollowUpStatusId
                        && p.CampFollowUpFinancialAmmount == m.CampFollowUpFinancialAmmount
                        && p.CampFollowUpFinancialNote == m.CampFollowUpFinancialNote
                        && p.CampFollowUpFinancialDate == m.CampFollowUpFinancialDate);

                        if (resultData == null)
                        {
                            m.CampId = result.CampId;
                            m.CampFollowUpFinancialAddBy = User.Identity.GetUserId();
                            m.CampStatusId = result.CampStatusId;
                            m.CountryId = result.CountryId;
                            m.PlanConfigYear = result.PlanConfigYear;
                            m.SponsorId = result.SponsorId;
                            m.TeamId = result.TeamId;
                            m.TourId = result.TourId;
                            m.CampFollowUpFinancialDateIn = DateTime.Now;

                            db.CampFollowUpFinancialModels.InsertOnSubmit(m);
                            db.SubmitChanges();
                            return Ok(m);
                        }
                        else
                        {
                            CampFollowUpFinancialModel rowUpdate = db.CampFollowUpFinancialModels.ToList().FirstOrDefault(p => p.PlanConfigId == m.PlanConfigId);

                            rowUpdate.CampId = resultData.CampId;
                            rowUpdate.CampStatusId = resultData.CampStatusId;
                            rowUpdate.CountryId = resultData.CountryId;
                            rowUpdate.PlanConfigYear = resultData.PlanConfigYear;
                            rowUpdate.SponsorId = resultData.SponsorId;
                            rowUpdate.TeamId = resultData.TeamId;
                            rowUpdate.TourId = resultData.TourId;
                            rowUpdate.CampFollowUpFinancialIsClosed = m.CampFollowUpFinancialIsClosed;
                            rowUpdate.CampFollowUpFinancialUpdatedBy = User.Identity.GetUserId();
                            rowUpdate.CampFollowUpFinancialUpdatedDate = DateTime.Now;


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
        
        [Route("Attachment/Financial/New")]
        [HttpPost]
        public IHttpActionResult AddAttachmentCampFollowUpFinancial(AttachmentCampFollowUpFinancialModel m)
        {
            using (db)
            {
                if (ModelState.IsValid)
                {
                    //check camp exists in plan
                    var result = db.PlanConfigModels.ToList().FirstOrDefault(p => p.PlanConfigId == m.PlanConfigId);
                    if (result != null)
                    {


                        var resultData = db.AttachmentCampFollowUpFinancialModels.ToList().FirstOrDefault(p => p.PlanConfigId == m.PlanConfigId
                        && p.FollowUpStatusId == m.FollowUpStatusId
                        && p.CampFollowUpFinancialNote == m.CampFollowUpFinancialNote
                        && p.CampFollowUpFinancialAmmount == m.CampFollowUpFinancialAmmount
                        && p.AttachmentCampFollowUpFinancialDateIn == m.CampFollowUpFinancialDate);

                        if (resultData == null)
                        {
                            int autoNumber = db.AttachmentCampFollowUpFinancialModels.ToList().Where(p => p != null)
                               .Select(p => p.AttachmentFinancialId + 1)
                               .DefaultIfEmpty(1)
                               .Max();

                            m.AttachmentFinancialId = Convert.ToInt32(autoNumber);
                            m.CampId = Convert.ToInt16(result.CampId);
                            m.AttachmentCampFollowUpFinancialAddBy = User.Identity.GetUserId();
                            m.CampStatusId = Convert.ToInt16(result.CampStatusId);
                            m.CountryId = Convert.ToByte(result.CountryId);
                            m.PlanConfigYear = Convert.ToInt16(result.PlanConfigYear);
                            m.SponsorId = Convert.ToInt16(result.SponsorId);
                            m.TeamId = Convert.ToInt16(result.TeamId);
                            m.TourId = Convert.ToInt16(result.TourId);
                            m.AttachmentCampFollowUpFinancialDateIn = DateTime.Now;

                            db.AttachmentCampFollowUpFinancialModels.InsertOnSubmit(m);
                            db.SubmitChanges();
                            return Ok(m);
                        }
                        else
                        {
                            int attachmentDrugId = db.AttachmentCampFollowUpFinancialModels.ToList().FirstOrDefault(p => p.PlanConfigId == m.PlanConfigId
                      && p.FollowUpStatusId == m.FollowUpStatusId
                      && p.CampFollowUpFinancialNote == m.CampFollowUpFinancialNote
                      && p.CampFollowUpFinancialDate == m.CampFollowUpFinancialDate).AttachmentFinancialId;

                            if (attachmentDrugId > 0)
                            {
                                m.AttachmentFinancialId = attachmentDrugId;
                                m.CampId = resultData.CampId;
                                m.AttachmentCampFollowUpFinancialAddBy = User.Identity.GetUserId();
                                m.CampStatusId = resultData.CampStatusId;
                                m.CountryId = resultData.CountryId;
                                m.PlanConfigYear = resultData.PlanConfigYear;
                                m.SponsorId = resultData.SponsorId;
                                m.TeamId = resultData.TeamId;
                                m.TourId = resultData.TourId;
                                m.AttachmentCampFollowUpFinancialDateIn = DateTime.Now;
                                db.AttachmentCampFollowUpFinancialModels.InsertOnSubmit(m);
                                db.SubmitChanges();
                                return Ok(m);
                            }
                            return Content(HttpStatusCode.Gone, "Attachment Financial exists");
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
        public IHttpActionResult GetCampAllFollowUpFinancialById(CampFollowUpFinancialSearch m)
        {

            using (db)
            {
                var result = (from campFollow in db.vwGetCampFollowUpFinancialWithAttachmentModels.AsEnumerable()

                              join followStatus in db.FollowUpStatusModels
                              on campFollow.FollowUpStatusId equals followStatus.FollowUpStatusId

                              join user in userDb.Users
                              on campFollow.CampFollowUpFinancialAddBy equals user.Id



                              select new
                              {
                                  campFollow.PlanConfigId,
                                  campFollow.CampFollowUpFinancialDate,
                                  campFollow.CampFollowUpFinancialNote,
                                  campFollow.FollowUpStatusId,
                                  campFollow.CampFollowUpFinancialDateIn,
                                  followStatus.FollowUpStatusDescAR,
                                  followStatus.FollowUpStatusClassName,
                                  user.UserName,
                                  campFollow.AttachmentFinancialId

                              })
                    .Where(c => c.PlanConfigId == m.PlanConfigId
                    && (c.FollowUpStatusId == m.FollowUpStatusId || m.FollowUpStatusId == null))
                    .ToList().OrderByDescending(c => c.CampFollowUpFinancialDateIn);

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
        public IHttpActionResult GetCampFollowUpFinancialById(CampFollowUpFinancialSearch m)
        {
            using (db)
            {
                CampFollowUpFinancialModel result = db.CampFollowUpFinancialModels.ToList().OrderByDescending(c => c.CampFollowUpFinancialDateIn)
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

        [Route("FinancialAttachment/Get")]
        [HttpPost]
        public IHttpActionResult GetCampFollowUpFinancialAttachments(CampFollowUpFinancialSearch m)
        {
            using (db)
            {
                IEnumerable<AttachmentCampFollowUpFinancialModel> result = db.AttachmentCampFollowUpFinancialModels
                    .Where(c => c.AttachmentFinancialId == m.AttachmentFinancialId)
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
    public class CampFollowUpFinancialSearch
    {
        public int? PlanConfigId { get; set; }
        public int? AttachmentFinancialId { get; set; }
        public short? FollowUpStatusId { get; set; }
    }
}
