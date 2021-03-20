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
    [RoutePrefix("basar/campstatus")]
    [Authorize]
    public class CampStatusController : ApiController
    {
        readonly BasarLinqDataContext db;
        public CampStatusController()
        {
            db = new BasarLinqDataContext();
        }

        #region 22-4-2020

        [Route("del")]
        public IHttpActionResult DelCampStatus(CampStatusModel csm)
        {
            using (db)
            {
                if (ModelState.IsValid)
                {
                    using (db)
                    {
                        PlanConfigModel plan = db.PlanConfigModels.ToList().FirstOrDefault(p => p.CampStatusId == csm.CampStatusId);
                        if (plan == null)
                        {
                            //Camp Stats Summary
                            CampStatsSummaryModel campStats = db.CampStatsSummaryModels.FirstOrDefault(c => c.CampStatusId == csm.CampStatusId);
                            if (campStats == null)
                            {

                                CampStatusModel campStatus = db.CampStatusModels.ToList().FirstOrDefault(c => c.CampStatusId == csm.CampStatusId);
                            db.CampStatusModels.DeleteOnSubmit(campStatus);
                            db.SubmitChanges();
                            return Ok(campStatus);
                            }
                            else
                                return Content(HttpStatusCode.NotFound, "year allready used in Camp Stats");
                        }
                        else
                            return Content(HttpStatusCode.NotFound, "Camp Status allready used in plan");
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
        public IHttpActionResult AddCampStatus(CampStatusModel csm)
        {
            using (db)
            {
                if (ModelState.IsValid)
                {
                    var campStatus = db.CampStatusModels.ToList().FirstOrDefault(p => p.CampStatusId == csm.CampStatusId);
                    if (campStatus == null)
                    {
                        int autoNumber = db.CampStatusModels.ToList().Where(p => p != null)
                    .Select(p => p.CampStatusId + 1)
                    .DefaultIfEmpty(1)
                    .Max();

                        //pcm.PlanConfigId = db.PlanConfigModels.Max(p => p == null ? 0 : p.PlanConfigId);
                        csm.CampStatusId = Convert.ToInt16(autoNumber);
                        csm.AddBy = User.Identity.GetUserId();
                        csm.CreationDate = DateTime.Now;
                        csm.CampStatusOrder = csm.CampStatusId;
                        db.CampStatusModels.InsertOnSubmit(csm);
                        db.SubmitChanges();
                        return Ok(csm);
                    }
                    else
                    {
                        CampStatusModel campStatusUpdate = db.CampStatusModels.FirstOrDefault(p => p.CampStatusId == csm.CampStatusId);
                        campStatusUpdate.CampStatusDescAR = csm.CampStatusDescAR;
                        campStatusUpdate.CampStatusDescEN = csm.CampStatusDescEN;
                        campStatusUpdate.CampStatusEnabled = csm.CampStatusEnabled;
                        campStatusUpdate.CampStatusImage = csm.CampStatusImage;
                        campStatusUpdate.UpdatedBy = User.Identity.GetUserId();
                        campStatusUpdate.UpdatedDate = DateTime.Now;

                        db.SubmitChanges();
                        return Ok(csm);
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
        public IHttpActionResult GetCampStatus(CampStatusModel csm)
        {
            using (db)
            {
                IEnumerable<CampStatusModel> campStatus = db.CampStatusModels
                    .Where(c => c.CampStatusEnabled == csm.CampStatusEnabled || csm.CampStatusEnabled == null).ToList();

                if (campStatus == null)
                {
                    return Content(HttpStatusCode.NotFound, "no record found");
                }
                else
                    return Ok(campStatus);
            }

        }
        #endregion


        #region 16-4-2020

        //[Route("{countryId:int:range(1,254)}")]
        [Route("")]
        //[HttpPost]//405 (Method Not Allowed)
        public IHttpActionResult GetCampsStatus()
        {
            using (db)
            {
                IEnumerable<CampStatusModel> campsStatus = db.CampStatusModels
                    .Where(c => c.CampStatusEnabled == true).ToList();
                if (campsStatus == null)
                {
                    return Content(HttpStatusCode.NotFound, "no record found");
                }
                else
                    return Ok(campsStatus);
            }
        }
        #endregion

    }
}
