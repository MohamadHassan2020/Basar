using basarapi.Areas.BasarArea.Db;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace basarapi.Areas.BasarArea.Controllers.PlanController
{
    [RoutePrefix("PlanStasticsHome")]
    [Authorize]
    public class PlanStasticsHomeController : ApiController
    {
        readonly BasarLinqDataContext db;
        public PlanStasticsHomeController()
        {
            db = new BasarLinqDataContext();
        }
        [Route("Stats/Year")]
        //[AllowAnonymous]
        public IHttpActionResult GetPlanStats()
        {

            var result = (from plan in db.PlanConfigModels
                          join stats in db.CampStatsSummaryModels //left join
                                         on plan.PlanConfigId equals stats.PlanConfigId into statsGroup
                          from stats in statsGroup.DefaultIfEmpty()
                          group new { plan, stats } by new { plan.PlanConfigYear, plan.CampStatusId }
           into grp
                          select new
                          {
                              Key = grp.Key.PlanConfigYear,

                              Count = grp.Count(),
                              Id = grp.Key.PlanConfigYear,
                              Status = grp.Key.CampStatusId,
                              grp.Key.PlanConfigYear,

                              OPDCount = grp.Sum(c => c.stats.OPDCount) == null ? -1 : grp.Sum(c => c.stats.OPDCount),
                              ORCount = grp.Sum(c => c.stats.ORCount) == null ? -1 : grp.Sum(c => c.stats.ORCount),
                              GlassesCount = grp.Sum(c => c.stats.GlassesCount) == null ? grp.Sum(c => c.stats.ORCount) == null ? -1 : grp.Sum(c => c.stats.ORCount)  : grp.Sum(c => c.stats.GlassesCount)
                          }).Where(x => x.Status == 2).OrderByDescending(c => c.Key).ThenBy(c => c.Count);

            if (result == null)
            {
                return Content(HttpStatusCode.NotFound, "no record found");
            }
            else
                return Ok(result);
        }

        [Route("Stats/Country")]
        public IHttpActionResult GetPlanStatsByCountry()
        {
 
            var result = (from plan in db.PlanConfigModels
                          join country in db.CountryModels
                        on plan.CountryId equals country.CountryId

                          join stats in db.CampStatsSummaryModels //left join
                                         on plan.PlanConfigId equals stats.PlanConfigId into statsGroup
                          from stats in statsGroup.DefaultIfEmpty()
                          group new { plan, country, stats } by new { country.CountryDsecAr, country.CountryId, plan.CampStatusId }
          into grp
                          select new
                          {
                              Key = grp.Key.CountryDsecAr,
                              Count = grp.Count(),
                              Id = grp.Key.CountryId,
                              Status = grp.Key.CampStatusId,


                              OPDCount = grp.Sum(c => c.stats.OPDCount) == null ? -1 : grp.Sum(c => c.stats.OPDCount),
                              ORCount = grp.Sum(c => c.stats.ORCount) == null ? -1 : grp.Sum(c => c.stats.ORCount),
                              GlassesCount = grp.Sum(c => c.stats.GlassesCount) == null ? grp.Sum(c => c.stats.ORCount) == null ? -1 : grp.Sum(c => c.stats.ORCount) : grp.Sum(c => c.stats.GlassesCount)
                          }).Where(x => x.Status == 2).OrderByDescending(c => c.Count).ThenBy(c => c.Key);

            if (result == null)
            {
                return Content(HttpStatusCode.NotFound, "no record found");
            }
            else
                return Ok(result);
        }

        [Route("Stats/sponsor")]
        //[AllowAnonymous]
        public IHttpActionResult GetPlanStatsBySponsor()
        {
            var result = (from plan in db.PlanConfigModels
                          join sponsor in db.SponsorModels //left join
                                         on plan.SponsorId equals sponsor.SponsorId into sponsorGroup
                          from sponsor in sponsorGroup.DefaultIfEmpty()
                          join stats in db.CampStatsSummaryModels //left join
                                         on plan.PlanConfigId equals stats.PlanConfigId into statsGroup
                          from stats in statsGroup.DefaultIfEmpty()
                          group new { plan, sponsor, stats } by new { sponsor.SponsorDsecAr, plan.SponsorId, plan.CampStatusId }
                     into grp
                          select new
                          {
                              Key = grp.Key.SponsorDsecAr,
                              Count = grp.Count(),
                              Status = grp.Key.CampStatusId,
                              Id = grp.Key.SponsorId == null ? -1 : grp.Key.SponsorId,
                              OPDCount = grp.Sum(c => c.stats.OPDCount) == null ? -1 : grp.Sum(c => c.stats.OPDCount),
                              ORCount = grp.Sum(c => c.stats.ORCount) == null ? -1 : grp.Sum(c => c.stats.ORCount),
                              GlassesCount = grp.Sum(c => c.stats.GlassesCount) == null ? grp.Sum(c => c.stats.ORCount) == null ? -1 : grp.Sum(c => c.stats.ORCount) : grp.Sum(c => c.stats.GlassesCount)
                          }).Where(x => x.Status == 2)
                          .OrderByDescending(c => c.Count).ThenBy(c => c.Key);


            if (result == null)
            {
                return Content(HttpStatusCode.NotFound, "no record found");
            }
            else
                return Ok(result);
        }

        [Route("Stats/campCount")]
        public IHttpActionResult GetPlanStatsByCamp()
        {
            var result = (from plan in db.PlanConfigModels
                          join camp in db.CampModels //left join
                                         on plan.CampId equals camp.CampId into campsGroup
                          from camp in campsGroup.DefaultIfEmpty()



                          join stats in db.CampStatsSummaryModels //left join
                                         on plan.PlanConfigId equals stats.PlanConfigId into statsGroup
                          from stats in statsGroup.DefaultIfEmpty()
                          group new { plan, camp, stats } by new { camp.CampDsecAr, plan.CampId , plan.CampStatusId }
         into grp
                          select new
                          {
                              Key = grp.Key.CampDsecAr,
                              Count = grp.Count(),
                              Status = grp.Key.CampStatusId,
                              Id = grp.Key.CampId,

                              OPDCount = grp.Sum(c => c.stats.OPDCount) == null ? -1 : grp.Sum(c => c.stats.OPDCount),
                              ORCount = grp.Sum(c => c.stats.ORCount) == null ? -1 : grp.Sum(c => c.stats.ORCount),
                              GlassesCount = grp.Sum(c => c.stats.GlassesCount) == null ? grp.Sum(c => c.stats.ORCount) == null ? -1 : grp.Sum(c => c.stats.ORCount) : grp.Sum(c => c.stats.GlassesCount)
                          }).Where(x => x.Status == 2)
                          .OrderByDescending(c => c.Count).ThenBy(c => c.Key);


            if (result == null)
            {
                return Content(HttpStatusCode.NotFound, "no record found");
            }
            else
                return Ok(result);
        }


        [Route("Stats/Team")]
        public IHttpActionResult GetPlanStatsByTeam()
        {
            var result = (from plan in db.PlanConfigModels
                          join team in db.TeamModels
                        on plan.TeamId equals team.TeamId

                          join stats in db.CampStatsSummaryModels //left join
                                         on plan.PlanConfigId equals stats.PlanConfigId into statsGroup
                          from stats in statsGroup.DefaultIfEmpty()
                          group new { plan, team, stats } by new { team.TeamDsecAr, team.TeamId, plan.CampStatusId }
                            into grp
                          select new
                          {
                              Key = grp.Key.TeamDsecAr,
                              Count = grp.Count(),
                              Status = grp.Key.CampStatusId,
                              Id = grp.Key.TeamId,
                              OPDCount = grp.Sum(c => c.stats.OPDCount) == null ? -1 : grp.Sum(c => c.stats.OPDCount),
                              ORCount = grp.Sum(c => c.stats.ORCount) == null ? -1 : grp.Sum(c => c.stats.ORCount),
                              GlassesCount = grp.Sum(c => c.stats.GlassesCount) == null ? grp.Sum(c => c.stats.ORCount) == null ? -1 : grp.Sum(c => c.stats.ORCount) : grp.Sum(c => c.stats.GlassesCount)

                          }).Where(x => x.Status == 2)
                          .OrderByDescending(c => c.Count).ThenBy(c => c.Key);


            if (result == null)
            {
                return Content(HttpStatusCode.NotFound, "no record found");
            }
            else
                return Ok(result);
        }


        [Route("Stats/CampStatus")]
        //[HttpPost]
        public IHttpActionResult GetPlanStatsByCampStatus()
        {


            var result = (from plan in db.PlanConfigModels
                          join campStatus in db.CampStatusModels
                        on plan.CampStatusId equals campStatus.CampStatusId

                          join stats in db.CampStatsSummaryModels //left join
                                         on plan.PlanConfigId equals stats.PlanConfigId into statsGroup
                          from stats in statsGroup.DefaultIfEmpty()
                          group new { plan, campStatus, stats } by new { campStatus.CampStatusDescAR, plan.CampStatusId }
          into grp
                          select new
                          {
                              Key = grp.Key.CampStatusDescAR,
                              Count = grp.Count(),
                              Id = grp.Key.CampStatusId,

                              OPDCount = grp.Sum(c => c.stats.OPDCount) == null ? -1 : grp.Sum(c => c.stats.OPDCount),
                              ORCount = grp.Sum(c => c.stats.ORCount) == null ? -1 : grp.Sum(c => c.stats.ORCount),
                              GlassesCount = grp.Sum(c => c.stats.GlassesCount) == null ? grp.Sum(c => c.stats.ORCount) == null ? -1 : grp.Sum(c => c.stats.ORCount) : grp.Sum(c => c.stats.GlassesCount)

                          }).OrderByDescending(c => c.Count).ThenBy(c => c.Key);


            if (result == null)
            {
                return Content(HttpStatusCode.NotFound, "no record found");
            }
            else
                return Ok(result);
        }


    }
}
