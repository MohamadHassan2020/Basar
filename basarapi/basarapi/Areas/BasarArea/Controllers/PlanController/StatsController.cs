using basarapi.Areas.BasarArea.Db;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace basarapi.Areas.BasarArea.Controllers.PlanController
{
    [RoutePrefix("plan/Stats")]
    [Authorize]
    public class StatsController : ApiController
    {
        readonly BasarLinqDataContext db;
        public StatsController()
        {
            db = new BasarLinqDataContext();
        }

        #region 26-4-2020
        [Route("")]
        public IHttpActionResult GetStatsCount()
        {

            int planNumber = db.PlanConfigModels.Count();


            int planYears = (from plan in db.PlanConfigModels
                             select plan.PlanConfigYear).Distinct().Count(x => x != null);

            int planCountries = (from plan in db.PlanConfigModels
                                 select plan.CountryId).Distinct().Count(x => x != null);

            int planTeams = (from plan in db.PlanConfigModels
                             select plan.TeamId).Distinct().Count(x => x != null);

            int planSponsors = (from plan in db.PlanConfigModels
                                select plan.SponsorId).Distinct().Count(x => x != null);

            int campCount = (from plan in db.PlanConfigModels
                             select plan.CampId).Distinct().Count(x => x != null);
             
 
            PlanStats planStats = new PlanStats
            {
                PlanCamps = planNumber,
                PlanCities = campCount,
                PlanYears = planYears,
                PlanCountries = planCountries,
                PlanTeams = planTeams,
                PlanSponsors = planSponsors
             };

            if (planStats == null)
            {
                return Content(HttpStatusCode.NotFound, "no record found");
            }
            else
                return Ok(planStats);
        }
        [Route("CampStatus")]
        public IHttpActionResult GetStatsCountEnd()
        {

            int planNumber = db.PlanConfigModels.Where(x=>x.CampStatusId==2).Count();


            int planYears = (from plan in db.PlanConfigModels.Where(x => x.CampStatusId == 2)
                             select plan.PlanConfigYear).Distinct().Count(x => x != null);

            int planCountries = (from plan in db.PlanConfigModels.Where(x => x.CampStatusId == 2)
                                 select plan.CountryId).Distinct().Count(x => x != null);

            int planTeams = (from plan in db.PlanConfigModels.Where(x => x.CampStatusId == 2)
                             select plan.TeamId).Distinct().Count(x => x != null);

            int planSponsors = (from plan in db.PlanConfigModels.Where(x => x.CampStatusId == 2)
                                select plan.SponsorId).Distinct().Count(x => x != null);

            int campCount = (from plan in db.PlanConfigModels.Where(x => x.CampStatusId == 2)
                             select plan.CampId).Distinct().Count(x => x != null);
             
 
            PlanStats planStats = new PlanStats
            {
                PlanCamps = planNumber,
                PlanCities = campCount,
                PlanYears = planYears,
                PlanCountries = planCountries,
                PlanTeams = planTeams,
                PlanSponsors = planSponsors
             };

            if (planStats == null)
            {
                return Content(HttpStatusCode.NotFound, "no record found");
            }
            else
                return Ok(planStats);
        }

        #endregion
    }

    public class PlanStats
    {
        public int PlanCamps { get; set; }
        public int PlanCities { get; set; }
        public int PlanYears { get; set; }
        public int PlanCountries { get; set; }
        public int PlanTeams { get; set; }
        public int PlanSponsors { get; set; }
    }
}
