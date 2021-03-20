using basarapi.Areas.BasarArea.Db;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace basarapi.Areas.BasarArea.Controllers.AdminController
{
    [RoutePrefix("basar/camps")]
    [Authorize]
    public class CampController : ApiController
    {
        readonly BasarLinqDataContext db;
        public CampController()
        {
            db = new BasarLinqDataContext();
        }


        #region 20-4-2020
        [Route("del")]
        public IHttpActionResult DelCamp(CampModel cm)
        {
            using (db)
            {
                if (ModelState.IsValid)
                {
                    using (db)
                    {
                        PlanConfigModel plan = db.PlanConfigModels.ToList(). FirstOrDefault(p => p.CampId == cm.CampId);
                        if (plan==null)
                        {
                            //Camp Stats Summary
                            CampStatsSummaryModel campStats = db.CampStatsSummaryModels.FirstOrDefault(c => c.CampId == cm.CampId);
                            if (campStats == null)
                            {
                                CampModel camp = db.CampModels.ToList().FirstOrDefault(c => c.CampId == cm.CampId);
                            db.CampModels.DeleteOnSubmit(camp);
                            db.SubmitChanges();
                            return Ok(camp);
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

        #endregion
        #region 19-4-2020

        [Route("all")]
        [HttpPost]
        public IHttpActionResult GetCampsAll(CampSearch campSearch)
        {
            var camps = (from camp in db.CampModels
                         from country in db.CountryModels
                         where camp.CountryId == country.CountryId
                         select new
                         {
                             camp.CampId,
                             camp.CampDsecAr,
                             camp.CampDsecEn,
                             camp.CampOrder,
                             camp.CampStatus,
                             camp.CreationDate,
                             country.CountryId,
                             country.CountryDsecAr,
                             country.CountryDsecEn
                         })
                         .Where(c=>c.CountryId== campSearch.CountryId || campSearch.CountryId ==null)
                         .ToList() ;


            if (camps == null)
            {
                return Content(HttpStatusCode.NotFound, "no record found");
            }
            else
                return Ok(camps);
        }

        [Route("new")]
        public IHttpActionResult AddCamp(CampModel cm)
        {
            using (db)
            {
                if (ModelState.IsValid)
                {
                    var camp = db.CampModels.ToList().FirstOrDefault(p => p.CampId == cm.CampId);
                    if (camp == null)
                    {
                        int autoNumber = db.CampModels.ToList().Where(p => p != null)
                    .Select(p => p.CampId + 1)
                    .DefaultIfEmpty(1)
                    .Max();

                        //pcm.PlanConfigId = db.PlanConfigModels.Max(p => p == null ? 0 : p.PlanConfigId);
                        cm.CampId = Convert.ToInt16(autoNumber);
                        cm.CampOrder = cm.CampId;
                        cm.CreationDate = DateTime.Now;
                        cm.CreationBy = User.Identity.GetUserId();
                        db.CampModels.InsertOnSubmit(cm);
                        db.SubmitChanges();
                        return Ok(cm);
                    }
                    else
                    {
                        CampModel campUpdate = db.CampModels.SingleOrDefault(p => p.CampId == cm.CampId);


                        campUpdate.CampDsecAr = cm.CampDsecAr;
                        campUpdate.CampDsecEn = cm.CampDsecEn;
                        campUpdate.CampStatus = cm.CampStatus;
                        campUpdate.CountryId = cm.CountryId;
                        campUpdate.UpdatedBy = User.Identity.GetUserId();
                        campUpdate.UpdatedDate = DateTime.Now;

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
        #endregion

        #region 16-4-2020

        //[Route("{countryId:int:range(1,254)}")]
        [Route("")]
        [HttpPost]
        public IHttpActionResult GetCamps(CampSearch campSearch)
        {
            using (db)
            {
                IEnumerable<CampModel> camps = db.CampModels
                    .Where(c => c.CampStatus == true
                    && c.CountryId == campSearch.CountryId).ToList();
                if (camps == null)
                {
                    return Content(HttpStatusCode.NotFound, "no record found");
                }
                else
                    return Ok(camps);
            }

        }
        #endregion
    }
    public class CampSearch
    {
        public short CampId { get; set; }
        public byte? CountryId { get; set; }
    }
}
