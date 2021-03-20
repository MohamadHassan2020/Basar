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
    [RoutePrefix("basar/FollowUpStatus")]
    [Authorize]
    public class FollowUpStatusController : ApiController
    {
        readonly BasarLinqDataContext db;
        public FollowUpStatusController()
        {
            db = new BasarLinqDataContext();
        }

        #region 15-5-2020

        [Route("del")]
        public IHttpActionResult DelFollowUpStatus(FollowUpStatusModel m)
        {
            using (db)
            {
                if (ModelState.IsValid)
                {
                    using (db)
                    {
                        //PlanConfigModel plan = db.PlanConfigModels.ToList().FirstOrDefault(p => p.CampStatusId == csm.CampStatusId);
                        //if (plan == null)
                        //{
                        FollowUpStatusModel data = db.FollowUpStatusModels.ToList().FirstOrDefault(c => c.FollowUpStatusId == m.FollowUpStatusId);
                            db.FollowUpStatusModels.DeleteOnSubmit(data);
                            db.SubmitChanges();
                            return Ok(data);
                        //}
                        //else
                        //    return Content(HttpStatusCode.NotFound, "Camp Status allready used in plan");
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
        public IHttpActionResult AddFollowUpStatus(FollowUpStatusModel m)
        {
            using (db)
            {
                if (ModelState.IsValid)
                {
                    var result = db.FollowUpStatusModels.ToList().FirstOrDefault(p => p.FollowUpStatusId == m.FollowUpStatusId);
                    if (result == null)
                    {
                        int autoNumber = db.FollowUpStatusModels.ToList().Where(p => p != null)
                    .Select(p => p.FollowUpStatusId + 1)
                    .DefaultIfEmpty(1)
                    .Max();

                        //pcm.PlanConfigId = db.PlanConfigModels.Max(p => p == null ? 0 : p.PlanConfigId);
                        m.FollowUpStatusId = Convert.ToInt16(autoNumber);
                        m.FollowUpStatusAddBy = User.Identity.GetUserId();
                        m.CreationDate = DateTime.Now;
                        m.FollowUpStatusOrder = m.FollowUpStatusId;
                        //m.FollowUpStatusDivider = m.FollowUpStatusDivider;
                        //m.FollowUpStatusEnabled = m.FollowUpStatusEnabled;
                        //m.FollowUpStatusEnabled = m.FollowUpStatusEnabled;
                        //m.FollowUpStatusImage = m.FollowUpStatusImage;
                        db.FollowUpStatusModels.InsertOnSubmit(m);
                        db.SubmitChanges();
                        return Ok(m);
                    }
                    else
                    {
                        FollowUpStatusModel updateData = db.FollowUpStatusModels.FirstOrDefault(p => p.FollowUpStatusId == m.FollowUpStatusId);

                        updateData.FollowUpStatusDescAR = m.FollowUpStatusDescAR;
                        updateData.FollowUpStatusDescEN = m.FollowUpStatusDescEN;
                        updateData.FollowUpStatusDivider = m.FollowUpStatusDivider;
                        updateData.FollowUpStatusEnabled = m.FollowUpStatusEnabled;
                        updateData.FollowUpStatusImage = m.FollowUpStatusImage;
                        updateData.FollowUpStatusIsFollow = m.FollowUpStatusIsFollow;
                        updateData.FollowUpStatusUpdatedBy = User.Identity.GetUserId();
                        updateData.FollowUpStatusUpdatedDate = DateTime.Now;


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

        [Route("Get")]
        [HttpPost]
        public IHttpActionResult GetFollowUpStatus(FollowUpStatusModel m)
        {
            using (db)
            {
                IEnumerable<FollowUpStatusModel> result = db.FollowUpStatusModels
                    .Where(c => c.FollowUpStatusEnabled == m.FollowUpStatusEnabled && c.FollowUpStatusDivider == m.FollowUpStatusDivider 
                    || (m.FollowUpStatusEnabled == null || m.FollowUpStatusDivider==null)
                    ).ToList();

                if (result == null)
                {
                    return Content(HttpStatusCode.NotFound, "no record found");
                }
                else
                    return Ok(result);
            }

        }
        #endregion

    }
}
