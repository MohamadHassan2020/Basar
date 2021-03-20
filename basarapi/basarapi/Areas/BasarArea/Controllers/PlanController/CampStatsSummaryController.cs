using basarapi.Areas.BasarArea.Db;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace basarapi.Areas.BasarArea.Controllers.PlanController
{
    [RoutePrefix("basar/CampStatsSummary")]
    [Authorize]
    public class CampStatsSummaryController : ApiController
    {
        readonly BasarLinqDataContext db;
        public CampStatsSummaryController()
        {
            db = new BasarLinqDataContext();
        }

        #region 13-5-2020
        [Route("Getdt")]
        [HttpPost]
        public IHttpActionResult GetCampStatsSummaryDataTable(CampStatsSummarySearch m)
        {
            using (db)
            {
             var result=   (from plan in db.PlanConfigModels


                 join statSummary in db.CampStatsSummaryModels //left join
                on plan.PlanConfigId equals statSummary.PlanConfigId into statsGroup
                 from statSummary in statsGroup.DefaultIfEmpty()

                 join country in db.CountryModels
                 on plan.CountryId equals country.CountryId

                 join team in db.TeamModels
                 on plan.TeamId equals team.TeamId

                 join camp in db.CampModels //left join
                 on plan.CampId equals camp.CampId into campGroup
                 from camp in campGroup.DefaultIfEmpty()

                 join sponsor in db.SponsorModels //left join
                 on plan.SponsorId equals sponsor.SponsorId into sponsorGroup
                 from sponsor in sponsorGroup.DefaultIfEmpty()

                 join tour in db.TourModels //left join
                 on plan.TourId equals tour.TourId into tourGroup
                 from tour in tourGroup.DefaultIfEmpty()

                 join campStatus in db.CampStatusModels //left join
                 on plan.CampStatusId equals campStatus.CampStatusId into campStatusGroup
                 from campStatus in campStatusGroup.DefaultIfEmpty()

                 select new
                 {
                     plan.PlanConfigId,
                     plan.TourId,
                     plan.TeamId,
                     plan.CountryId,
                     plan.CampId,
                     plan.SponsorId,
                     plan.CampStatusId,
                     plan.PlanConfigYear,
                     country.CountryDsecAr,
                     plan.PlanConfigStartDate,
                     plan.PlanConfigEndDate,
                     ORCount = statSummary == null ? -1 : statSummary.ORCount,
                     OPDCount = statSummary == null ? -1 : statSummary.OPDCount,
                     GlassesCount = statSummary == null ? -1 : statSummary.GlassesCount,

                     TourDsecAr = tour == null ? "بدون" : tour.TourDsecAr,
                     CampDsecAr = camp == null ? "بدون" : camp.CampDsecAr,
                     SponsorDsecAr = sponsor == null ? "بدون" : sponsor.SponsorDsecAr,
                     CampStatusDescAR = campStatus == null ? "بدون" : campStatus.CampStatusDescAR,
                     team.TeamDsecAr
                 })
                        .Where(p => p.CampId == m.CampId || m.CampId == null)
                        .ToList().OrderBy(p => p.PlanConfigStartDate);

                if (result == null)
                {
                    return Content(HttpStatusCode.NotFound, "no record found");
                }
                else
                    return Ok(result);
            }

        }
        #endregion

        #region 22-4-2020

        [Route("del")]
        public IHttpActionResult DelCampStatsSummary(CampStatsSummaryModel m)
        {
            using (db)
            {
                if (ModelState.IsValid)
                {
                    using (db)
                    {

                        CampStatsSummaryModel result = db.CampStatsSummaryModels.ToList().FirstOrDefault(c => c.PlanConfigId == m.PlanConfigId);
                        if (result != null)
                        {
                            db.CampStatsSummaryModels.DeleteOnSubmit(result);
                            db.SubmitChanges();
                            return Ok(result);
                        }
                        else
                            return Content(HttpStatusCode.NotFound, "result not exists ");
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

        [Route("new")]
        public IHttpActionResult AddCampStatsSummary(CampStatsSummaryModel m)
        {
            using (db)
            {
                if (ModelState.IsValid)
                {

                    var result = db.PlanConfigModels.ToList().FirstOrDefault(p => p.PlanConfigId == m.PlanConfigId);
                    if (result != null)
                    {

                        var campStatus = db.CampStatsSummaryModels.ToList().FirstOrDefault(p => p.PlanConfigId == m.PlanConfigId);

                        if (campStatus == null)
                        {
                            m.CampId = result.CampId;
                            m.CampStatsSummaryAddBy = User.Identity.GetUserId();
                            m.CampStatusId = result.CampStatusId;
                            m.CountryId = result.CountryId;
                            m.PlanConfigYear = result.PlanConfigYear;
                            m.SponsorId = result.SponsorId;
                            m.TeamId = result.TeamId;
                            m.TourId = result.TourId;
                            m.CampStatsSummaryDateIn = DateTime.Now;

                            db.CampStatsSummaryModels.InsertOnSubmit(m);
                            db.SubmitChanges();
                            return Ok(m);
                        }
                        else
                        {
                            CampStatsSummaryModel rowUpdate = db.CampStatsSummaryModels.ToList().FirstOrDefault(p => p.PlanConfigId == m.PlanConfigId);

                            rowUpdate.CampId = campStatus.CampId;
                            rowUpdate.CampStatusId = campStatus.CampStatusId;
                            rowUpdate.CountryId = campStatus.CountryId;
                            rowUpdate.PlanConfigYear = campStatus.PlanConfigYear;
                            rowUpdate.SponsorId = campStatus.SponsorId;
                            rowUpdate.TeamId = campStatus.TeamId;
                            rowUpdate.TourId = campStatus.TourId;
                            rowUpdate.CampStatsSummaryNote = m.CampStatsSummaryNote;
                            rowUpdate.GlassesCount = m.GlassesCount;
                            rowUpdate.OPDCount = m.OPDCount;
                            rowUpdate.ORCount = m.ORCount;
                            rowUpdate.CampStatsSummaryIsClosed = m.CampStatsSummaryIsClosed;
                            rowUpdate.CampStatsSummaryUpdatedBy = User.Identity.GetUserId();
                            rowUpdate.CampStatsSummaryUpdatedDate = DateTime.Now;


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
        [Route("update")]
        public IHttpActionResult UpdateCampStatsSummary(CampStatsSummaryModel m)
        {
            using (db)
            {
                if (ModelState.IsValid)
                {

                    var campStatus = db.CampStatsSummaryModels.ToList().FirstOrDefault(p => p.PlanConfigId == m.PlanConfigId);

                    if (campStatus != null)
                    {
                        CampStatsSummaryModel rowUpdate = db.CampStatsSummaryModels.ToList().FirstOrDefault(p => p.PlanConfigId == m.PlanConfigId);

                        rowUpdate.PlanConfigYear = m.PlanConfigYear;
                        rowUpdate.CampId = m.CampId;
                        rowUpdate.CampStatusId = m.CampStatusId;
                        rowUpdate.CountryId = m.CountryId;
                        rowUpdate.PlanConfigYear = m.PlanConfigYear;
                        rowUpdate.SponsorId = m.SponsorId;
                        rowUpdate.TeamId = m.TeamId;
                        rowUpdate.TourId = m.TourId;
                        rowUpdate.CampStatsSummaryUpdatedBy = User.Identity.GetUserId();
                        rowUpdate.CampStatsSummaryUpdatedDate = DateTime.Now;
                        db.SubmitChanges();
                        return Ok(m);
                    }
                    return Content(HttpStatusCode.NotFound, "no record found");
                    ////////////////////////////////////////
                }
                else
                {
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
        }

        [Route("Get")]
        [HttpPost]
        public IHttpActionResult GetCampStatsSummary(CampStatsSummarySearch m)
        {
            using (db)
            {
                IEnumerable<CampStatsSummaryModel> result = db.CampStatsSummaryModels
                    .Where(c => c.CampStatsSummaryStatus == m.CampStatsSummaryStatus || m.CampStatsSummaryStatus == null
                   
                    ).ToList();

                if (result == null)
                {
                    return Content(HttpStatusCode.NotFound, "no record found");
                }
                else
                    return Ok(result);
            }

        }

        [Route("GetById")]
        [HttpPost]
        public IHttpActionResult GetCampStatsSummaryById(CampStatsSummarySearch m)
        {
            using (db)
            {
                CampStatsSummaryModel result = db.CampStatsSummaryModels.ToList()
                    .FirstOrDefault(c => c.PlanConfigId == m.PlanConfigId);

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

    public class CampStatsSummarySearch
    {
        public short? CampId { get; set; }
        public int? PlanConfigId { get; set; }
        public bool? CampStatsSummaryStatus { get; set; }
    }
}
