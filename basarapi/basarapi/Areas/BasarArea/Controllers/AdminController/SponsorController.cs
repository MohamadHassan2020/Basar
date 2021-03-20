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
    [RoutePrefix("basar/sponsors")]
    [Authorize]
    public class SponsorController : ApiController
    {
        readonly BasarLinqDataContext db;
        public SponsorController()
        {
            db = new BasarLinqDataContext();
        }

        #region 21-4-2020

        [Route("del")]
        public IHttpActionResult DelSponosr(SponsorModel sm)
        {
            using (db)
            {
                if (ModelState.IsValid)
                {
                    using (db)
                    {
                        PlanConfigModel plan = db.PlanConfigModels.ToList().FirstOrDefault(p => p.SponsorId == sm.SponsorId);
                        if (plan == null)
                        {
                            //Camp Stats Summary
                            CampStatsSummaryModel campStats = db.CampStatsSummaryModels.FirstOrDefault(c => c.SponsorId == sm.SponsorId);
                            if (campStats == null)
                            {

                                SponsorModel sponsor = db.SponsorModels.ToList().FirstOrDefault(c => c.SponsorId == sm.SponsorId);
                            db.SponsorModels.DeleteOnSubmit(sponsor);
                            db.SubmitChanges();
                            return Ok(sponsor);
                            }
                            else
                                return Content(HttpStatusCode.NotFound, "year allready used in Camp Stats");
                        }
                        else
                            return Content(HttpStatusCode.NotFound, "camp allready used");
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
        public IHttpActionResult AddSponsor(SponsorModel sm)
        {
            using (db)
            {
                if (ModelState.IsValid)
                {
                    var sponsor = db.SponsorModels.ToList().FirstOrDefault(p => p.SponsorId == sm.SponsorId);
                    if (sponsor == null)
                    {
                        int autoNumber = db.SponsorModels.ToList().Where(p => p != null)
                    .Select(p => p.SponsorId + 1)
                    .DefaultIfEmpty(1)
                    .Max();

                        //pcm.PlanConfigId = db.PlanConfigModels.Max(p => p == null ? 0 : p.PlanConfigId);
                        sm.SponsorId = Convert.ToInt16(autoNumber);
                        sm.CreationBy = User.Identity.GetUserId();
                        sm.CreationDate = DateTime.Now;
                        sm.SponsorOrder = sm.SponsorId;
                        db.SponsorModels.InsertOnSubmit(sm);
                        db.SubmitChanges();
                        return Ok(sm);
                    }
                    else
                    {
                        SponsorModel sponsorUpdate = db.SponsorModels.FirstOrDefault(p => p.SponsorId == sm.SponsorId);
                        sponsorUpdate.SponsorDsecAr = sm.SponsorDsecAr;
                        sponsorUpdate.SponsorDsecEn = sm.SponsorDsecEn;
                        sponsorUpdate.SponsorStatus = sm.SponsorStatus;
                        sponsorUpdate.UpdatedBy = User.Identity.GetUserId();
                        sponsorUpdate.UpdatedDate = DateTime.Now;
                       
                        db.SubmitChanges();
                        return Ok(sm);
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
        public IHttpActionResult GetSponsors(SponsorModel sm)
        {
            using (db)
            {
                IEnumerable<SponsorModel> sponsors = db.SponsorModels
                    .Where(c => c.SponsorStatus == sm.SponsorStatus || sm.SponsorStatus == null).ToList();

                if (sponsors == null)
                {
                    return Content(HttpStatusCode.NotFound, "no record found");
                }
                else
                    return Ok(sponsors);
            }

        }
        #endregion



        #region 16-4-2020

        //[Route("{countryId:int:range(1,254)}")]
        [Route("")]
        //[HttpPost]//405 (Method Not Allowed)
        public IHttpActionResult GetSponsors()
        {
            using (db)
            {
                IEnumerable<SponsorModel> sponosors = db.SponsorModels
                    .Where(c => c.SponsorStatus == true).ToList();
                if (sponosors == null)
                {
                    return Content(HttpStatusCode.NotFound, "no record found");
                }
                else
                    return Ok(sponosors);
            }
        }
        #endregion
    }
}
