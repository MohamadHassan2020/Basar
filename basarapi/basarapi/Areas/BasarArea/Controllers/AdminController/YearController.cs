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
    [RoutePrefix("basar/year")]
    [Authorize]
    public class YearController : ApiController
    {
        readonly BasarLinqDataContext db;
        public YearController()
        {
            db = new BasarLinqDataContext();
        }

        #region 22-4-2020

        [Route("del")]
        public IHttpActionResult DelYear(YearModel ym)
        {
            using (db)
            {
                if (ModelState.IsValid)
                {
                    using (db)
                    {
                        PlanConfigModel plan = db.PlanConfigModels.ToList().FirstOrDefault(p => p.PlanConfigYear == ym.YearNameEn);
                        if (plan == null)
                        {
                            CampStatsSummaryModel campStats = db.CampStatsSummaryModels.FirstOrDefault(c => c.PlanConfigYear == ym.YearNameEn);
                            if (campStats == null)
                            {
                                YearModel year = db.YearModels.ToList().FirstOrDefault(c => c.YearNameEn == ym.YearNameEn);
                                db.YearModels.DeleteOnSubmit(year);
                                db.SubmitChanges();
                                return Ok(year);
                            }
                            else
                                return Content(HttpStatusCode.NotFound, " العام موجود باحصائية الخطة");
                        }
                        else
                            return Content(HttpStatusCode.NotFound, "العام موجود بالخطة");
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
        public IHttpActionResult AddYear(YearModel ym)
        {
            using (db)
            {
                if (ModelState.IsValid)
                {
                    var year = db.YearModels.ToList().FirstOrDefault(p => p.YearNameEn == ym.YearNameEn);
                    if (year == null)
                    {
                        int autoNumber = db.YearModels.ToList().Where(p => p != null)
                    .Select(p => p.YearId + 1)
                    .DefaultIfEmpty(1)
                    .Max();

                        //pcm.PlanConfigId = db.PlanConfigModels.Max(p => p == null ? 0 : p.PlanConfigId);
                        ym.YearId = Convert.ToByte(autoNumber);
                        ym.CreationBy = User.Identity.GetUserId();
                        ym.CreationDate = DateTime.Now;
                        ym.YearOrder = ym.YearOrder;
                        db.YearModels.InsertOnSubmit(ym);
                        db.SubmitChanges();
                        return Ok(ym);
                    }
                    else
                    {
                        YearModel yearUpdate = db.YearModels.FirstOrDefault(p => p.YearNameEn == ym.YearNameEn);
                        yearUpdate.YearDesc = ym.YearDesc;
                        yearUpdate.YearNameAr = ym.YearNameAr;
                        yearUpdate.YearNameEn = ym.YearNameEn;
                        yearUpdate.YearStatus = ym.YearStatus;
                        yearUpdate.UpdatedBy = User.Identity.GetUserId();
                        yearUpdate.UpdatedDate = DateTime.Now;

                        db.SubmitChanges();
                        return Ok(ym);
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
        public IHttpActionResult GetYears(YearModel ym)
        {
            using (db)
            {
                IEnumerable<YearModel> years = db.YearModels
                    .Where(c => c.YearStatus == ym.YearStatus || ym.YearStatus == null).ToList();

                if (years == null)
                {
                    return Content(HttpStatusCode.NotFound, "no record found");
                }
                else
                    return Ok(years);
            }

        }
        #endregion

        #region 16-4-2020
        [Route("")]
        public IHttpActionResult GetYears()
        {
            using (db)
            {
                IEnumerable<YearModel> years = from year in db.YearModels.ToList()
                                               orderby year.YearNameEn descending
                                               select year;
                if (years == null)
                {
                    return Content(HttpStatusCode.NotFound, "no record found");
                }
                else
                    return Ok(years);
            }

        }
        #endregion
    }
}
