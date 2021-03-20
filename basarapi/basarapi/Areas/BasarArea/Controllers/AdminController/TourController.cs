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
    [RoutePrefix("basar/tour")]
    [Authorize]
    public class TourController : ApiController
    {
        readonly BasarLinqDataContext db;
        public TourController()
        {
            db = new BasarLinqDataContext();
        }


        #region 21-4-2020

        [Route("del")]
        public IHttpActionResult DelTour(TourModel tm)
        {
            using (db)
            {
                if (ModelState.IsValid)
                {
                    using (db)
                    {
                        PlanConfigModel plan = db.PlanConfigModels.ToList().FirstOrDefault(p => p.TourId == tm.TourId);
                        if (plan == null)
                        {
                            //Camp Stats Summary
                            CampStatsSummaryModel campStats = db.CampStatsSummaryModels.FirstOrDefault(c => c.TourId == tm.TourId);
                            if (campStats == null)
                            {

                                TourModel tour = db.TourModels.ToList().FirstOrDefault(c => c.TourId == tm.TourId);
                            db.TourModels.DeleteOnSubmit(tour);
                            db.SubmitChanges();
                            return Ok(tour);
                            }
                            else
                                return Content(HttpStatusCode.NotFound, "year allready used in Camp Stats");

                        }
                        else
                            return Content(HttpStatusCode.NotFound, "tour allready used in plan: " + plan.PlanConfigId);
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
        public IHttpActionResult AddTour(TourModel tm)
        {
            using (db)
            {
                if (ModelState.IsValid)
                {
                    var tour = db.TourModels.ToList().FirstOrDefault(p => p.TourId == tm.TourId);
                    if (tour == null)
                    {
                        int autoNumber = db.TourModels.ToList().Where(p => p != null)
                    .Select(p => p.TourId + 1)
                    .DefaultIfEmpty(1)
                    .Max();

                        //pcm.PlanConfigId = db.PlanConfigModels.Max(p => p == null ? 0 : p.PlanConfigId);
                        tm.TourId = Convert.ToInt16(autoNumber);
                        tm.CreationBy = User.Identity.GetUserId();
                        tm.CreationDate = DateTime.Now;
                        tm.TourOrder = tm.TourId;
                        db.TourModels.InsertOnSubmit(tm);
                        db.SubmitChanges();
                        return Ok(tm);
                    }
                    else
                    {
                        TourModel tourUpdate = db.TourModels.FirstOrDefault(p => p.TourId == tm.TourId);
                        tourUpdate.TourDescHint = tm.TourDescHint;
                        tourUpdate.TourDsecAr = tm.TourDsecAr;
                        tourUpdate.TourDsecEn = tm.TourDsecEn;
                        tourUpdate.TourStatus = tm.TourStatus;
                        tourUpdate.UpdatedBy = User.Identity.GetUserId();
                        tourUpdate.UpdatedDate = DateTime.Now;

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
        public IHttpActionResult GetTours(TourModel tm)
        {
            using (db)
            {
                IEnumerable<TourModel> tours = db.TourModels
                    .Where(c => c.TourStatus == tm.TourStatus || tm.TourStatus == null).ToList();

                if (tours == null)
                {
                    return Content(HttpStatusCode.NotFound, "no record found");
                }
                else
                    return Ok(tours);
            }

        }
        #endregion


        #region 16-4-2020
        [Route("")]
        //[AllowAnonymous]
        public IHttpActionResult GetYears()
        {
            using (db)
            {
                //var countries = db.CountryModels.Select(x => x.CountryDsecAr).ToList();
                //var countryModel = db.CountryModels.ToList().Select(c => new { Id = c.CountryId, Desc = c.CountryDsecAr });

                var coutriesPlans = db.CountryModels
                    .Join(db.PlanConfigModels,
                                                         e => e.CountryId,
                                                         d => d.CountryId, (country, plan) => new
                                                         {
                                                             CountryName = country.CountryDsecAr,
                                                             PlanYear = plan.PlanConfigYear,
                                                             PlanTourId = plan.TourId
                                                         });

                var tours = from tour in db.TourModels.ToList()
                            orderby tour.TourDsecAr, tour.TourDsecEn
                            select new
                            {
                                tour.TourId,
                                tour.TourDsecAr,
                                //TourHint = countries.Aggregate((a, b) => a + " - " + b)
                                TourHint = "Country",//coutriesPlans
                                //.Where(c => c.PlanTourId == 1)
                                //.Select(c=> c.CountryName)
                                //.ToList().Aggregate((a, b) => a + " - " + b)
                                //.Select(t => new { CountryDesc = countries })  


                            };
                if (tours == null)
                {
                    return Content(HttpStatusCode.NotFound, "no record found");
                }
                else
                    return Ok(tours);
            }

        }
        #endregion
    }
}
