using basarapi.Areas.BasarArea.Db;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Microsoft.AspNet.Identity;
namespace basarapi.Areas.BasarArea.Controllers.AdminController
{
    [RoutePrefix("basar/teams")]
    [Authorize]
    public class TeamController : ApiController
    {
        readonly BasarLinqDataContext db;
        public TeamController()
        {
            db = new BasarLinqDataContext();
        }

        #region 22-4-2020

        [Route("del")]
        public IHttpActionResult DelTeam(TeamModel tm)
        {
            using (db)
            {
                if (ModelState.IsValid)
                {
                    using (db)
                    {
                        PlanConfigModel plan = db.PlanConfigModels.ToList().FirstOrDefault(p => p.TeamId == tm.TeamId);
                        if (plan == null)
                        {
                            //Camp Stats Summary
                            CampStatsSummaryModel campStats = db.CampStatsSummaryModels.FirstOrDefault(c => c.TeamId == tm.TeamId);
                            if (campStats == null)
                            {
                                TeamModel team = db.TeamModels.ToList().FirstOrDefault(c => c.TeamId == tm.TeamId);
                            db.TeamModels.DeleteOnSubmit(team);
                            db.SubmitChanges();
                            return Ok(team);
                            }
                            else
                                return Content(HttpStatusCode.NotFound, "year allready used in Camp Stats");
                        }
                        else
                            return Content(HttpStatusCode.NotFound, "Team allready used in plan");
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
        public IHttpActionResult AddTeam(TeamModel tm)
        {
            using (db)
            {
                if (ModelState.IsValid)
                {
                    var team = db.TeamModels.ToList().FirstOrDefault(p => p.TeamId == tm.TeamId);
                    if (team == null)
                    {
                        int autoNumber = db.TeamModels.ToList().Where(p => p != null)
                    .Select(p => p.TeamId + 1)
                    .DefaultIfEmpty(1)
                    .Max();

                        //pcm.PlanConfigId = db.PlanConfigModels.Max(p => p == null ? 0 : p.PlanConfigId);
                        tm.TeamId = Convert.ToInt16(autoNumber);
                        tm.CreationBy = User.Identity.GetUserId();
                        tm.CreationDate = DateTime.Now;
                        tm.TeamOrder = tm.TeamId;
                        db.TeamModels.InsertOnSubmit(tm);
                        db.SubmitChanges();
                        return Ok(tm);
                    }
                    else
                    {
                        TeamModel teamUpdate = db.TeamModels.FirstOrDefault(p => p.TeamId == tm.TeamId);
                        teamUpdate.TeamDsecAr = tm.TeamDsecAr;
                        teamUpdate.TeamDsecEn = tm.TeamDsecEn;
                        teamUpdate.TeamFlag = tm.TeamFlag;
                        teamUpdate.TeamStatus = tm.TeamStatus;
                        teamUpdate.UpdatedBy = User.Identity.GetUserId();
                        teamUpdate.UpdatedDate = DateTime.Now;

                        db.SubmitChanges();
                        return Ok(tm);
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

        [Route("Get")]
        [HttpPost]
        public IHttpActionResult GetTeams(TeamModel tm)
        {
            using (db)
            {
                IEnumerable<TeamModel> teams = db.TeamModels
                    .Where(c => c.TeamStatus == tm.TeamStatus || tm.TeamStatus == null).ToList();

                if (teams == null)
                {
                    return Content(HttpStatusCode.NotFound, "no record found");
                }
                else
                    return Ok(teams);
            }

        }
        #endregion


        #region 16-4-2020

        //[Route("{countryId:int:range(1,254)}")]
        [Route("")]
        //[HttpPost]//405 (Method Not Allowed)
        public IHttpActionResult GetTeams()
        {
            using (db)
            {
                IEnumerable<TeamModel> teams = db.TeamModels
                    .Where(c => c.TeamStatus == true).ToList();
                if (teams == null)
                {
                    return Content(HttpStatusCode.NotFound, "no record found");
                }
                else
                    return Ok(teams);
            }

        }
        #endregion
    }
}
