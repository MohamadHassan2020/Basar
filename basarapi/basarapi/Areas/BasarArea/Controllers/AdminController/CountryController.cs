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
    [RoutePrefix("basar/country")]
    [Authorize]
    public class CountryController : ApiController
    {
        readonly BasarLinqDataContext db;
        public CountryController()
        {
            db = new BasarLinqDataContext();
        }

        #region 21-4-2020

        [Route("del")]
        public IHttpActionResult DelCountry(CountryModel cm)
        {
            using (db)
            {
                if (ModelState.IsValid)
                {
                    using (db)
                    {
                        PlanConfigModel plan = db.PlanConfigModels.ToList().FirstOrDefault(p => p.CountryId == cm.CountryId);
                        if (plan == null)
                        {
                            //Camp Stats Summary
                            CampStatsSummaryModel campStats = db.CampStatsSummaryModels.FirstOrDefault(c => c.CountryId == cm.CountryId);
                            if (campStats == null)
                            {

                                CampModel camp = db.CampModels.ToList().FirstOrDefault(p => p.CountryId == cm.CountryId);
                            if (camp == null)
                            {
                                CountryModel country = db.CountryModels.ToList().FirstOrDefault(c => c.CountryId == cm.CountryId);
                                db.CountryModels.DeleteOnSubmit(country);
                                db.SubmitChanges();
                                return Ok(country);
                                }
                                else
                                    return Content(HttpStatusCode.NotFound, "year allready used in Camp Stats");
                            }
                            return Content(HttpStatusCode.NotFound, "Country allready used in camps");
                        }
                        else
                            return Content(HttpStatusCode.NotFound, "Country allready used in Plan");
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
        public IHttpActionResult AddCountry(CountryModel cm)
        {
            using (db)
            {
                if (ModelState.IsValid)
                {
                    var country = db.CountryModels.ToList().FirstOrDefault(p => p.CountryId == cm.CountryId);
                    if (country == null)
                    {
                        int autoNumber = db.CountryModels.ToList().Where(p => p != null)
                    .Select(p => p.CountryId + 1)
                    .DefaultIfEmpty(1)
                    .Max();

                        //pcm.PlanConfigId = db.PlanConfigModels.Max(p => p == null ? 0 : p.PlanConfigId);
                        cm.CountryId = Convert.ToByte(autoNumber);
                        cm.CountryOrder = cm.CountryId;
                        cm.CreationDate = DateTime.Now;
                        cm.CreationBy = User.Identity.GetUserId();
                        db.CountryModels.InsertOnSubmit(cm);
                        db.SubmitChanges();
                        return Ok(cm);
                    }
                    else
                    {
                        CountryModel countryUpdate = db.CountryModels.SingleOrDefault(p => p.CountryId == cm.CountryId);


                        countryUpdate.CountryDsecAr = cm.CountryDsecAr;
                        countryUpdate.CountryDsecEn = cm.CountryDsecEn;
                        countryUpdate.CountryStatus = cm.CountryStatus;
                        countryUpdate.UpdatedBy = User.Identity.GetUserId();
                        countryUpdate.UpdatedDate = DateTime.Now;
                        countryUpdate.UpdatedDate = DateTime.Now;
                        db.SubmitChanges();
                        return Ok(cm);
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
        public IHttpActionResult GetCountries(CountryModel cm)
        {
            using (db)
            {
                IEnumerable<CountryModel> countries = db.CountryModels
                    .Where(c => c.CountryStatus == cm.CountryStatus || cm.CountryStatus == null).ToList();

                if (countries == null)
                {
                    return Content(HttpStatusCode.NotFound, "no record found");
                }
                else
                    return Ok(countries);
            }

        }
        #endregion

        #region 16-4-2020
        [Route("")]
        public IHttpActionResult GetCountries()
        {
            using (db)
            {
                IEnumerable<CountryModel> countries = db.CountryModels
                    .Where(c => c.CountryStatus == true).ToList();

                if (countries == null)
                {
                    return Content(HttpStatusCode.NotFound, "no record found");
                }
                else
                    return Ok(countries);
            }

        }
        #endregion
    }


}
