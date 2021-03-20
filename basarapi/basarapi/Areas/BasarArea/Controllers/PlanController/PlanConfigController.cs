using basarapi.Areas.BasarArea.Db;
using BasarDalProj.BasarDb;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace basarapi.Areas.BasarArea.Controllers.PlanController
{
    [RoutePrefix("plan/config")]
    [Authorize]
    public class PlanConfigController : ApiController
    {
        //readonly BasarProjOperation basarProjOperation;
        readonly BasarLinqDataContext db;
        public PlanConfigController()
        {
            db = new BasarLinqDataContext();
            //basarProjOperation = BasarProjOperation.GetInstance();
        }

        #region 15-5-2020
        [Route("AllPlanPending")]
        [HttpPost]
        public IHttpActionResult GetPlansPending(PlanSearch planSearch)
        {
            var plans = (from plan in db.PlanConfigModels

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
                             TourDsecAr = tour == null ? "بدون" : tour.TourDsecAr,
                             CampDsecAr = camp == null ? "بدون" : camp.CampDsecAr,
                             SponsorDsecAr = sponsor == null ? "بدون" : sponsor.SponsorDsecAr,
                             CampStatusDescAR = campStatus == null ? "بدون" : campStatus.CampStatusDescAR,
                             team.TeamDsecAr
                         })
                        .Where(p => p.CampStatusId != planSearch.CampStatusId || planSearch.CampStatusId == null)
                        .ToList().OrderBy(p => p.PlanConfigStartDate);

            if (plans == null)
            {
                return Content(HttpStatusCode.NotFound, "no record found");
            }
            else
                return Ok(plans);
        }

        #endregion
        #region 10-5-2020
        [Route("AllPlan/Stats/camps")]
        [HttpPost]
        public IHttpActionResult GetPlanStatsCamps(PlanSearch planSearch)
        {
            var plans = (from plan in db.PlanConfigModels

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

                         join statSummary in db.CampStatsSummaryModels //left join
                        on plan.PlanConfigId equals statSummary.PlanConfigId into statsGroup
                         from statSummary in statsGroup.DefaultIfEmpty()



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
                        .Where(p => p.CampId == planSearch.CampId || p.CampId == null)
                        .ToList().OrderBy(p => p.PlanConfigStartDate);

            if (plans == null)
            {
                return Content(HttpStatusCode.NotFound, "no record found");
            }
            else
                return Ok(plans);
        }
        [Route("AllPlan/Stats/Sponsors")]
        [HttpPost]
        public IHttpActionResult GetPlanStatSponsors(PlanSearch planSearch)
        {
            var plans = (from plan in db.PlanConfigModels

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

                         join statSummary in db.CampStatsSummaryModels //left join
                        on plan.PlanConfigId equals statSummary.PlanConfigId into statsGroup
                         from statSummary in statsGroup.DefaultIfEmpty()


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
                        .Where(p => p.SponsorId == planSearch.SponsorId || p.SponsorId == null)
                        .ToList().OrderBy(p => p.PlanConfigStartDate);

            if (plans == null)
            {
                return Content(HttpStatusCode.NotFound, "no record found");
            }
            else
                return Ok(plans);
        }
        [Route("AllPlan/Stats/CampStatus")]
        [HttpPost]
        public IHttpActionResult GetPlanCampStatus(PlanSearch planSearch)
        {
            var plans = (from plan in db.PlanConfigModels

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

                         join statSummary in db.CampStatsSummaryModels //left join
                        on plan.PlanConfigId equals statSummary.PlanConfigId into statsGroup
                         from statSummary in statsGroup.DefaultIfEmpty()


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
                             TourDsecAr = tour == null ? "تحدد لاحقاً" : tour.TourDsecAr,
                             CampDsecAr = camp == null ? "تحدد لاحقاً" : camp.CampDsecAr,
                             SponsorDsecAr = sponsor == null ? "تحدد لاحقاً" : sponsor.SponsorDsecAr,
                             CampStatusDescAR = campStatus == null ? "تحدد لاحقاً" : campStatus.CampStatusDescAR,
                             team.TeamDsecAr
                         })
                        .Where(p => p.CampStatusId == planSearch.CampStatusId || p.CampStatusId == null)
                        .ToList().OrderBy(p => p.PlanConfigStartDate);

            if (plans == null)
            {
                return Content(HttpStatusCode.NotFound, "no record found");
            }
            else
                return Ok(plans);
        }

        #endregion
        #region 3-5-2020

        [Route("del")]
        public IHttpActionResult DelPlan(PlanConfigModel pcm)
        {
            using (db)
            {
                if (ModelState.IsValid)
                {
                    using (db)
                    {
                        PlanConfigModel plan = db.PlanConfigModels.ToList().FirstOrDefault(p => p.PlanConfigId == pcm.PlanConfigId);
                        if (plan != null)
                        {
                            //Camp Stats Summary
                            CampStatsSummaryModel campStats = db.CampStatsSummaryModels.FirstOrDefault(c => c.PlanConfigId == pcm.PlanConfigId);
                            if (campStats == null)
                            {

                                db.PlanConfigModels.DeleteOnSubmit(plan);
                                db.SubmitChanges();
                                return Ok(plan);
                            }
                            else
                                return Content(HttpStatusCode.NotFound, "مخيم الخطة موجود باحصائية المخيم");

                        }
                        else
                            return Content(HttpStatusCode.NotFound, "مخيم الخطة غير موجود");
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


        [Route("AllPlan")]
        [HttpPost]
        public IHttpActionResult GetPlans(PlanSearch planSearch)
        {
            var plans = (from plan in db.PlanConfigModels

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

                         join statSummary in db.CampStatsSummaryModels //left join
                        on plan.PlanConfigId equals statSummary.PlanConfigId into statsGroup
                         from statSummary in statsGroup.DefaultIfEmpty()

                         join planSponsorShip in db.vwGetPlanConfigSponsorShipLastModels //left join
                            on plan.PlanConfigId equals planSponsorShip.PlanConfigId into planSponsorShipGroup
                         from planSponsorShip in planSponsorShipGroup.DefaultIfEmpty()

                         join sponsorShip in db.SponsorShipModels //left join
                            on planSponsorShip.SponsorShipId equals sponsorShip.SponsorShipId into sponsorShipGroup
                         from sponsorShip in sponsorShipGroup.DefaultIfEmpty()


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
                            // planSponsorShip.SponsorShipId,
                             SponsorShipId = (short?)planSponsorShip.SponsorShipId,
                             SponsorShipName = sponsorShip.SponsorShipName ?? "",
                             ORCount = statSummary == null ? -1 : statSummary.ORCount,
                             OPDCount = statSummary == null ? -1 : statSummary.OPDCount,
                             GlassesCount = statSummary == null ? -1 : statSummary.GlassesCount,

                             TourDsecAr = tour == null ? "تحدد لاحقاً" : tour.TourDsecAr,
                             CampDsecAr = camp == null ? "تحدد لاحقاً" : camp.CampDsecAr,
                             SponsorDsecAr = sponsor == null ? "تحدد لاحقاً" : sponsor.SponsorDsecAr,
                             CampStatusDescAR = campStatus == null ? "تحدد لاحقاً" : campStatus.CampStatusDescAR,
                             team.TeamDsecAr
                         })
                        .Where(p => p.PlanConfigYear == planSearch.PlanConfigYear | planSearch.PlanConfigYear == null
                        && (p.CountryId == planSearch.CountryId || planSearch.CountryId == null)
                        && (p.TourId == planSearch.TourId || planSearch.TourId == null)
                        && (p.TeamId == planSearch.TeamId || planSearch.TeamId == null)
                        && (p.CampId == planSearch.CampId || planSearch.CampId == null)
                        && (p.SponsorId == planSearch.SponsorId || planSearch.SponsorId == null)
                        && (p.CampStatusId == planSearch.CampStatusId || planSearch.CampStatusId == null)
                        && (p.PlanConfigStartDate >= planSearch.PlanConfigStartDate || planSearch.PlanConfigStartDate == null)
                        && (p.PlanConfigEndDate <= planSearch.PlanConfigEndDate || planSearch.PlanConfigEndDate == null)

                        )
                        .ToList().OrderBy(p => p.PlanConfigStartDate);

            if (plans == null)
            {
                return Content(HttpStatusCode.NotFound, "no record found");
            }
            else
                return Ok(plans);
        }
        [Route("AllPlan/Stats")]
        [HttpPost]
        public IHttpActionResult GetPlanStats(PlanSearch planSearch)
        {
            var plans = (from plan in db.PlanConfigModels

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

                         join statSummary in db.CampStatsSummaryModels //left join
                         on plan.PlanConfigId equals statSummary.PlanConfigId into statsGroup
                         from statSummary in statsGroup.DefaultIfEmpty()

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
                        .Where(p => p.PlanConfigYear == planSearch.PlanConfigYear | planSearch.PlanConfigYear == null
                        && (p.CountryId == planSearch.CountryId || planSearch.CountryId == null)
                        && (p.TourId == planSearch.TourId || planSearch.TourId == null)
                        && (p.TeamId == planSearch.TeamId || planSearch.TeamId == null)
                        && (p.CampId == planSearch.CampId || planSearch.CampId == null)
                        && (p.SponsorId == planSearch.SponsorId || planSearch.SponsorId == null)
                        && (p.CampStatusId == planSearch.CampStatusId || planSearch.CampStatusId == null)
                        && (p.PlanConfigStartDate >= planSearch.PlanConfigStartDate || planSearch.PlanConfigStartDate == null)
                        && (p.PlanConfigEndDate <= planSearch.PlanConfigEndDate || planSearch.PlanConfigEndDate == null)

                        )
                        .ToList().OrderBy(p => p.PlanConfigStartDate);

            if (plans == null)
            {
                return Content(HttpStatusCode.NotFound, "no record found");
            }
            else
                return Ok(plans);
        }
        #endregion

        #region 19-4-2020
        [Route("stats/Year")]
        //[AllowAnonymous]
        public IHttpActionResult GetPlanStats()
        {


            //var planCounts = db.PlanConfigModels
            //.GroupBy(paln => paln.PlanConfigYear)//group by
            //.OrderBy(paln => paln.Key)
            //.Select(g => new { Key = g.Key, Count = g.Count(), Id = g.Key });//select group by
            //var query = from father in db.PlanConfigModels
            //            join children in db.CampStatsSummaryModels
            //            on father.PlanConfigYear equals children.PlanConfigYear into Children
            //            from children in Children.DefaultIfEmpty()
            //            where father.PlanConfigYear.Value == null
            //            group new { father = father, childExists = (children != null) } by new { id = father.Id, code = father.Code } into gf
            //            select new { id = gf.Key.id, count = gf.Count(o => o.childExists) };


            var result = (from plan in db.PlanConfigModels
                          join stats in db.CampStatsSummaryModels //left join
                                         on plan.PlanConfigId equals stats.PlanConfigId into statsGroup
                          from stats in statsGroup.DefaultIfEmpty()
                          group new { plan, stats } by new { plan.PlanConfigYear }
           into grp
                          select new
                          {
                              Key = grp.Key.PlanConfigYear,
                              Count = grp.Count(),
                              Id = grp.Key.PlanConfigYear,

                              grp.Key.PlanConfigYear,
                              OPDCount = grp.Sum(c => c.stats.OPDCount) == null ? -1 : grp.Sum(c => c.stats.OPDCount),
                              ORCount = grp.Sum(c => c.stats.ORCount) == null ? -1 : grp.Sum(c => c.stats.ORCount),
                              GlassesCount = grp.Sum(c => c.stats.GlassesCount) == null ? -1 : grp.Sum(c => c.stats.GlassesCount),
                          }).OrderByDescending(c => c.Key).ThenBy(c => c.Count);
            /*var result=( from e in db.PlanConfigModels
                         group e by e.PlanConfigYear into g
             where g.Count() > 1
             select new
             {
                 Location = g.Key,
                 Total = g.Count(),
                 TotalSalary = g.Sum(x => x.Salary),
                 AverageSalary = g.Average(x => x.Salary),
                 CheapestEmployee = g.Min(x => x.Salary),
                 MostExpensiveEmployee = g.Max(x => x.Salary)
             });*/
            if (result == null)
            {
                return Content(HttpStatusCode.NotFound, "no record found");
            }
            else
                return Ok(result);
        }
        [Route("stats/Country")]
        public IHttpActionResult GetPlanStatsByCountry()
        {
            /*var planCounts = db.PlanConfigModels
                                     .GroupJoin(db.CountryModels,
                                             p => p.CountryId,
                                             s => s.CountryId,
                                             (plan, countries) => new { plan, countries })
                                     .SelectMany(z => z.countries.DefaultIfEmpty(),
                                             (a, b) => new
                                             {
                                                 CountryName = b == null ? "No Country" : b.CountryDsecAr,
                                                 CountryId = b == null ? -1 : b.CountryId,
                                             })
                                               .GroupBy(x => new { x.CountryName, x.CountryId })
                                                .Select(g => new
                                                {
                                                    Key = g.Key.CountryName,
                                                    Count = g.Count(),
                                                    Id = g.Key.CountryId
                                                })
                                                .OrderByDescending(c => c.Count)//
                                                .ThenBy(c => c.Key);*/

            var result = (from plan in db.PlanConfigModels
                          join country in db.CountryModels
                        on plan.CountryId equals country.CountryId

                          join stats in db.CampStatsSummaryModels //left join
                                         on plan.PlanConfigId equals stats.PlanConfigId into statsGroup
                          from stats in statsGroup.DefaultIfEmpty()
                          group new { plan, country, stats } by new { country.CountryDsecAr, country.CountryId }
          into grp
                          select new
                          {
                              Key = grp.Key.CountryDsecAr,
                              Count = grp.Count(),
                              Id = grp.Key.CountryId,

                              OPDCount = grp.Sum(c => c.stats.OPDCount) == null ? -1 : grp.Sum(c => c.stats.OPDCount),
                              ORCount = grp.Sum(c => c.stats.ORCount) == null ? -1 : grp.Sum(c => c.stats.ORCount),
                              GlassesCount = grp.Sum(c => c.stats.GlassesCount) == null ? -1 : grp.Sum(c => c.stats.GlassesCount),
                          }).OrderByDescending(c => c.Count).ThenBy(c => c.Key);

            if (result == null)
            {
                return Content(HttpStatusCode.NotFound, "no record found");
            }
            else
                return Ok(result);
        }
        [Route("stats/sponsor")]
        //[AllowAnonymous]
        public IHttpActionResult GetPlanStatsBySponsor()
        {

            /*var planCounts = db.PlanConfigModels
                                     .GroupJoin(db.SponsorModels,
                                             p => p.SponsorId,
                                             s => s.SponsorId,
                                             (plan, sponsors) => new { plan, sponsors })
                                     .SelectMany(z => z.sponsors.DefaultIfEmpty(),
                                             (a, b) => new
                                             {
                                                 SponsorName = b == null ? "No Sponsor" : b.SponsorDsecAr,
                                                 SponsorId = b == null ? -1 : b.SponsorId,
                                             })
                                               .GroupBy(x => new { x.SponsorName, x.SponsorId })

                                                .Select(g => new
                                                {
                                                    Key = g.Key.SponsorName,
                                                    Count = g.Count(),
                                                    Id = g.Key.SponsorId
                                                })
                                                .OrderByDescending(c => c.Count)//
                                                .ThenBy(c => c.Key);//*/
            var result = (from plan in db.PlanConfigModels
                          join sponsor in db.SponsorModels //left join
                                         on plan.SponsorId equals sponsor.SponsorId into sponsorGroup
                          from sponsor in sponsorGroup.DefaultIfEmpty()



                          join stats in db.CampStatsSummaryModels //left join
                                         on plan.PlanConfigId equals stats.PlanConfigId into statsGroup
                          from stats in statsGroup.DefaultIfEmpty()
                          group new { plan, sponsor, stats } by new { sponsor.SponsorDsecAr, plan.SponsorId }
                     into grp
                          select new
                          {
                              Key = grp.Key.SponsorDsecAr,
                              Count = grp.Count(),
                              Id = grp.Key.SponsorId == null ? -1 : grp.Key.SponsorId,
                              OPDCount = grp.Sum(c => c.stats.OPDCount) == null ? -1 : grp.Sum(c => c.stats.OPDCount),
                              ORCount = grp.Sum(c => c.stats.ORCount) == null ? -1 : grp.Sum(c => c.stats.ORCount),
                              GlassesCount = grp.Sum(c => c.stats.GlassesCount) == null ? -1 : grp.Sum(c => c.stats.GlassesCount),
                          }).OrderByDescending(c => c.Count).ThenBy(c => c.Key);


            if (result == null)
            {
                return Content(HttpStatusCode.NotFound, "no record found");
            }
            else
                return Ok(result);
        }


        [Route("stats/Team")]
        public IHttpActionResult GetPlanStatsByTeam()
        {
            var result = (from plan in db.PlanConfigModels
                          join team in db.TeamModels
                        on plan.TeamId equals team.TeamId

                          join stats in db.CampStatsSummaryModels //left join
                                         on plan.PlanConfigId equals stats.PlanConfigId into statsGroup
                          from stats in statsGroup.DefaultIfEmpty()
                          group new { plan, team, stats } by new { team.TeamDsecAr, team.TeamId }
                            into grp
                          select new
                          {
                              Key = grp.Key.TeamDsecAr,
                              Count = grp.Count(),
                              Id = grp.Key.TeamId,
                              OPDCount = grp.Sum(c => c.stats.OPDCount) == null ? -1 : grp.Sum(c => c.stats.OPDCount),
                              ORCount = grp.Sum(c => c.stats.ORCount) == null ? -1 : grp.Sum(c => c.stats.ORCount),
                              GlassesCount = grp.Sum(c => c.stats.GlassesCount) == null ? -1 : grp.Sum(c => c.stats.GlassesCount),
                          }).OrderByDescending(c => c.Count).ThenBy(c => c.Key);


            if (result == null)
            {
                return Content(HttpStatusCode.NotFound, "no record found");
            }
            else
                return Ok(result);
        }

        [Route("stats/CampStatus")]
        //[HttpPost]
        public IHttpActionResult GetPlanStatsByCampStatus()
        {

            /*var planCounts = db.PlanConfigModels
                                                 .GroupJoin(db.CampStatusModels,
                                                         p => p.CampStatusId,
                                                         s => s.CampStatusId,
                                                         (plan, campStatus) => new { plan, campStatus })
                                                 .SelectMany(z => z.campStatus.DefaultIfEmpty(),
                                                         (a, b) => new
                                                         {
                                                             CampStatusName = b == null ? "No Camp Status" : b.CampStatusDescAR,
                                                             CampStatusId = b == null ? -1 : b.CampStatusId,
                                                         })
                                                           .GroupBy(x => new { x.CampStatusName, x.CampStatusId })
                                                            .Select(g => new
                                                            {
                                                                Key = g.Key.CampStatusName,
                                                                Count = g.Count(),
                                                                Id = g.Key.CampStatusId
                                                            })
                                                            .OrderByDescending(c => c.Count)//
                                                            .ThenBy(c => c.Key);*/

            var result = (from plan in db.PlanConfigModels
                          join campStatus in db.CampStatusModels
                        on plan.CampStatusId equals campStatus.CampStatusId

                          join stats in db.CampStatsSummaryModels //left join
                                         on plan.PlanConfigId equals stats.PlanConfigId into statsGroup
                          from stats in statsGroup.DefaultIfEmpty()
                          group new { plan, campStatus, stats } by new { campStatus.CampStatusDescAR, campStatus.CampStatusId }
          into grp
                          select new
                          {
                              Key = grp.Key.CampStatusDescAR,
                              Count = grp.Count(),
                              Id = grp.Key.CampStatusId,

                              OPDCount = grp.Sum(c => c.stats.OPDCount) == null ? -1 : grp.Sum(c => c.stats.OPDCount),
                              ORCount = grp.Sum(c => c.stats.ORCount) == null ? -1 : grp.Sum(c => c.stats.ORCount),
                              GlassesCount = grp.Sum(c => c.stats.GlassesCount) == null ? -1 : grp.Sum(c => c.stats.GlassesCount),
                          }).OrderByDescending(c => c.Count).ThenBy(c => c.Key);


            if (result == null)
            {
                return Content(HttpStatusCode.NotFound, "no record found");
            }
            else
                return Ok(result);
        }
        [Route("stats/campCount")]
        public IHttpActionResult GetPlanStatsByCamp()
        {
            //left join
            /*var planCounts = db.PlanConfigModels
                                      .GroupJoin(db.CampModels,
                                              p => p.CampId,
                                              s => s.CampId,
                                              (plan, camps) => new { plan, camps })
                                      .SelectMany(z => z.camps.DefaultIfEmpty(),
                                              (a, b) => new
                                              {
                                                  CampName = b == null ? "No Camp" : b.CampDsecAr,
                                                  CampId = b == null ? -1 : b.CampId,
                                              })
                                                .GroupBy(x => new { x.CampName, x.CampId })
                                                 .Select(g => new
                                                 {
                                                     Key = g.Key.CampName,
                                                     Count = g.Count(),
                                                     Id = g.Key.CampId
                                                 })
                                                 .OrderByDescending(c => c.Count)//
                                                 .ThenBy(c => c.Key);*/

            //select group 


            /* inner join
            var planCounts = db.PlanConfigModels
               .Join(db.CampModels,
                                                   p => p.CampId,
                                                   c => c.CampId, (plan, camp) => new
                                                   {
                                                       CampName = camp.CampDsecAr,

                                                   })

           .GroupBy(campName => campName.CampName)//group by
           .OrderBy(campName => campName.Key)
           .Select(g => new { Key = g.Key == null ? "null" : g.Key, Count = g.Count() });//select group by
            */

            var result = (from plan in db.PlanConfigModels
                          join camp in db.CampModels //left join
                                         on plan.CampId equals camp.CampId into campsGroup
                          from camp in campsGroup.DefaultIfEmpty()



                          join stats in db.CampStatsSummaryModels //left join
                                         on plan.PlanConfigId equals stats.PlanConfigId into statsGroup
                          from stats in statsGroup.DefaultIfEmpty()
                          group new { plan, camp, stats } by new { camp.CampDsecAr, plan.CampId }
         into grp
                          select new
                          {
                              Key = grp.Key.CampDsecAr,
                              Count = grp.Count(),
                              Id = grp.Key.CampId,

                              OPDCount = grp.Sum(c => c.stats.OPDCount) == null ? -1 : grp.Sum(c => c.stats.OPDCount),
                              ORCount = grp.Sum(c => c.stats.ORCount) == null ? -1 : grp.Sum(c => c.stats.ORCount),
                              GlassesCount = grp.Sum(c => c.stats.GlassesCount) == null ? -1 : grp.Sum(c => c.stats.GlassesCount),
                          }).OrderByDescending(c => c.Count).ThenBy(c => c.Key);


            if (result == null)
            {
                return Content(HttpStatusCode.NotFound, "no record found");
            }
            else
                return Ok(result);
        }

        #endregion

        #region 18-4-2020
        [Route("All")]
        public IHttpActionResult GetPlansAll()
        {
            var plans = (from plan in db.PlanConfigModels
                         from tour in db.TourModels
                         from country in db.CountryModels.ToList()
                         from camp in db.CampModels
                         from team in db.TeamModels
                         from sponsor in db.SponsorModels
                         where plan.TeamId == team.TeamId
                         && plan.SponsorId == sponsor.SponsorId
                         && plan.TourId == tour.TourId
                         && plan.CountryId == country.CountryId
                         && plan.CampId == camp.CampId
                         select new
                         {
                             plan.PlanConfigId,
                             plan.PlanConfigYear,
                             plan.PlanConfigStartDate,
                             plan.PlanConfigEndDate,
                             team.TeamDsecAr,
                             sponsor.SponsorDsecAr,
                             tour.TourDsecAr,
                             country.CountryDsecAr,
                             camp.CampDsecAr
                         }).ToList();


            if (plans == null)
            {
                return Content(HttpStatusCode.NotFound, "no record found");
            }
            else
                return Ok(plans);
        }
        [Route("ById")]
        [HttpPost]
        public IHttpActionResult GetPlanById(PlanSearch planSearch)
        {
            var plan = db.PlanConfigModels.FirstOrDefault(p => p.PlanConfigId == planSearch.PlanConfigId);

            if (plan == null)
            {
                return Content(HttpStatusCode.NotFound, "no record found");
            }
            else
                return Ok(plan);
        }

        #endregion

        #region 16-4-2020
        [Route("")]

        public IHttpActionResult AddPlanConfig(PlanConfigModel m)
        {
            using (db)
            {
                if (ModelState.IsValid)
                {
                    var plan = db.PlanConfigModels.ToList().FirstOrDefault(p => p.PlanConfigId == m.PlanConfigId);
                    if (plan == null)
                    {
                        int autoNumber = db.PlanConfigModels.ToList().Where(p => p != null)
                    .Select(p => p.PlanConfigId + 1)
                    .DefaultIfEmpty(1)
                    .Max();

                        //pcm.PlanConfigId = db.PlanConfigModels.Max(p => p == null ? 0 : p.PlanConfigId);
                        m.PlanConfigId = autoNumber;
                        m.PlanConfigIdNumber = m.PlanConfigYear + "00" + autoNumber;
                        m.PlanConfigOrder = m.PlanConfigId;
                        m.PlanConfigAddBy = User.Identity.GetUserId();
                        m.PlanConfigDateIn = DateTime.Now;
                        db.PlanConfigModels.InsertOnSubmit(m);
                        db.SubmitChanges();
                        return Ok(m);
                    }
                    else
                    {
                        var campStatus = db.CampStatsSummaryModels.ToList().FirstOrDefault(p => p.PlanConfigId == m.PlanConfigId);

                        if (campStatus != null)
                        {
                            CampStatsSummaryModel rowUpdate = db.CampStatsSummaryModels.ToList().FirstOrDefault(p => p.PlanConfigId == m.PlanConfigId);

                            rowUpdate.CampId = m.CampId;
                            rowUpdate.CampStatusId = m.CampStatusId;
                            rowUpdate.CountryId = m.CountryId;
                            rowUpdate.PlanConfigYear = m.PlanConfigYear;
                            rowUpdate.SponsorId = m.SponsorId;
                            rowUpdate.TeamId = m.TeamId;
                            rowUpdate.TourId = m.TourId;
                            rowUpdate.CampStatsSummaryUpdatedBy = User.Identity.GetUserId();
                            rowUpdate.CampStatsSummaryUpdatedDate = DateTime.Now;

                        }
                        ////////////////////////////////////////

                        PlanConfigModel planUpdate = db.PlanConfigModels.SingleOrDefault(p => p.PlanConfigId == m.PlanConfigId);

                        planUpdate.CampId = m.CampId;
                        planUpdate.CampStatusId = m.CampStatusId;
                        planUpdate.CountryId = m.CountryId;
                        planUpdate.PlanConfigEndDate = m.PlanConfigEndDate;
                        planUpdate.PlanConfigIsClosed = m.PlanConfigIsClosed;
                        planUpdate.PlanConfigRemark = m.PlanConfigRemark;
                        planUpdate.PlanConfigStartDate = m.PlanConfigStartDate;
                        planUpdate.PlanConfigStatus = m.PlanConfigStatus;
                        planUpdate.PlanConfigUpdatedBy = User.Identity.GetUserId();
                        planUpdate.PlanConfigUpdatedDate = DateTime.Now;
                        planUpdate.PlanConfigYear = m.PlanConfigYear;
                        planUpdate.PreliminaryStatus = m.PreliminaryStatus;
                        planUpdate.SponsorId = m.SponsorId;
                        planUpdate.TeamId = m.TeamId;
                        planUpdate.TourId = m.TourId;
                        db.SubmitChanges();
                        return Ok(m);
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
        [Route("SponsorShip/Add")]
        public IHttpActionResult AddPlanConfigSponsorShip(PlanConfigSponsorShipModel m)
        {
            using (db)
            {
                if (ModelState.IsValid)
                {
                    var plan = db.PlanConfigSponsorShipModels.ToList().FirstOrDefault(p => p.PlanConfigId == m.PlanConfigId
                    && p.SponsorId == m.SponsorId && p.SponsorShipId == m.SponsorShipId);
                    if (plan == null)
                    {
                        m.PlanConfigSponsorShipAddBy = User.Identity.GetUserId();
                        m.PlanConfigSponsorShipDateIn = DateTime.Now;
                        db.PlanConfigSponsorShipModels.InsertOnSubmit(m);
                        db.SubmitChanges();
                        return Ok(m);
                    }
                    else
                    {
                        return Content(HttpStatusCode.Found, "sponsor ship found");
                    }
                }

                List<string> errorlist = new List<string>();
                foreach (var value in ModelState.Values)
                {
                    foreach (var error in value.Errors)
                        errorlist.Add(error.Exception.ToString());
                    //errorlist.Add(value.Errors);
                }
                return Content(HttpStatusCode.InternalServerError, errorlist);
            }
        }
        #endregion
    }

    public class PlanSearch
    {
        public int PlanConfigId { get; set; }
        public byte? CountryId { get; set; }
        public short? PlanConfigYear { get; set; }
        public short? TourId { get; set; }
        public short? TeamId { get; set; }
        public short? CampId { get; set; }
        public short? SponsorId { get; set; }
        public short? CampStatusId { get; set; }
        public DateTime? PlanConfigStartDate { get; set; }
        public DateTime? PlanConfigEndDate { get; set; }
    }
}
