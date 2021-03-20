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
    [RoutePrefix("basar/SponsorShip")]
    [Authorize]
    public class SponsorShipController : ApiController
    {
        readonly BasarLinqDataContext db;
        public SponsorShipController()
        {
            db = new BasarLinqDataContext();
        }


        #region 20-4-2020
        [Route("del")]
        public IHttpActionResult DelSponsorShip(SponsorShipModel m)
        {
            using (db)
            {
                if (ModelState.IsValid)
                {
                    using (db)
                    {
                        PlanConfigModel plan = db.PlanConfigModels.ToList(). FirstOrDefault(p => p.SponsorId == m.SponsorId);
                        if (plan==null)
                        {
                            //Camp Stats Summary
                            CampStatsSummaryModel campStats = db.CampStatsSummaryModels.FirstOrDefault(c => c.SponsorId == m.SponsorId);
                            if (campStats == null)
                            {
                                SponsorShipModel dataModel = db.SponsorShipModels.ToList().FirstOrDefault(c => c.SponsorShipId == m.SponsorShipId);
                            db.SponsorShipModels.DeleteOnSubmit(dataModel);
                            db.SubmitChanges();
                            return Ok(dataModel);
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
        public IHttpActionResult GetSponsorShipAll(SponsorShipSearch m)
        {
            var result = (from ship in db.SponsorShipModels
                          from sponsor in db.SponsorModels
                          where ship.SponsorId == sponsor.SponsorId
                         select new
                         {
                             ship.SponsorShipId,
                             ship.SponsorShipName,
                             ship.SponsorShipNameEN,
                             ship.SponsorShipOrder,
                             ship.SponsorShipStatus,
                             ship.SponsorShipDateIn,
                             sponsor.SponsorId,
                             sponsor.SponsorDsecAr,
                             sponsor.SponsorDsecEn
                         })
                         .Where(c=>c.SponsorId== m.SponsorId || m.SponsorId ==null)
                         .ToList() ;


            if (result == null)
            {
                return Content(HttpStatusCode.NotFound, "no record found");
            }
            else
                return Ok(result);
        }

        [Route("new")]
        public IHttpActionResult AddSponsorShip(SponsorShipModel m)
        {
            using (db)
            {
                if (ModelState.IsValid)
                {
                    var camp = db.SponsorShipModels.ToList().FirstOrDefault(p => p.SponsorShipId == m.SponsorShipId);
                    if (camp == null)
                    {
                        int autoNumber = db.SponsorShipModels.ToList().Where(p => p != null)
                    .Select(p => p.SponsorShipId + 1)
                    .DefaultIfEmpty(1)
                    .Max();

                        //pcm.PlanConfigId = db.PlanConfigModels.Max(p => p == null ? 0 : p.PlanConfigId);
                        m.SponsorShipId = Convert.ToInt16(autoNumber);
                        m.SponsorShipDateIn = DateTime.Now;
                        m.SponsorShipAddBy = User.Identity.GetUserId();
                        db.SponsorShipModels.InsertOnSubmit(m);
                        db.SubmitChanges();
                        return Ok(m);
                    }
                    else
                    {
                        SponsorShipModel dataUpdate = db.SponsorShipModels.FirstOrDefault(p => p.SponsorShipId == m.SponsorShipId);


                        dataUpdate.SponsorShipName = m.SponsorShipName;
                        dataUpdate.SponsorShipNameEN = m.SponsorShipNameEN;
                        dataUpdate.SponsorShipStatus = m.SponsorShipStatus;
                        dataUpdate.SponsorShipOrder = m.SponsorShipOrder;
                        dataUpdate.SponsorId = m.SponsorId;
                        dataUpdate.SponsorShipUpdatedBy = User.Identity.GetUserId();
                        dataUpdate.SponsorShipUpdatedDateIn = DateTime.Now;

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
        #endregion

        #region 16-4-2020

        //[Route("{countryId:int:range(1,254)}")]
       /* [Route("")]
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

        }*/
        #endregion
    }
    public class SponsorShipSearch
    {
        public short SponsorShipId { get; set; }
        public byte? SponsorId { get; set; }
    }
}
