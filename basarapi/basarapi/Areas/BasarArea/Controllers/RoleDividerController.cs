using basarapi.Areas.BasarArea.Db;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace basarapi.Areas.BasarArea.Controllers
{
    [RoutePrefix("basar/RoleDivider")]
    [Authorize]
    public class RoleDividerController : ApiController
    {
        readonly BasarLinqDataContext db;
        public RoleDividerController()
        {
            db = new BasarLinqDataContext();
        }

        #region 22-4-2020

        [Route("del")]
        public IHttpActionResult DelRoleDivider(RoleDividerModel m)
        {
            using (db)
            {
                if (ModelState.IsValid)
                {
                    RoleDividerModel result = db.RoleDividerModels.ToList().FirstOrDefault(x => x.RoleDividerId == m.RoleDividerId);
                    if (result != null)
                    {
                        //Camp Stats Summary
                        //CampStatsSummaryModel campStats = db.CampStatsSummaryModels.FirstOrDefault(c => c.TeamId == tm.TeamId);
                        //if (campStats == null)
                        //{

                        db.RoleDividerModels.DeleteOnSubmit(result);
                        db.SubmitChanges();
                        return Ok();
                        //}
                        //else
                        //    return Content(HttpStatusCode.NotFound, "year allready used in Camp Stats");
                    }
                    else
                        return Content(HttpStatusCode.NotFound, "فئة الصلاحية غير موجوده");
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

        [Route("New")]
        public IHttpActionResult AddRoleDivider(RoleDividerModel m)
        {
            using (db)
            {
                if (ModelState.IsValid)
                {
                    RoleDividerModel result = db.RoleDividerModels.ToList().FirstOrDefault(p => p.RoleDividerId == m.RoleDividerId);
                    if (result == null)
                    {
                        int autoNumber = db.RoleDividerModels.ToList().Where(p => p != null)
                    .Select(p => p.RoleDividerId + 1)
                    .DefaultIfEmpty(1)
                    .Max();

                        //pcm.PlanConfigId = db.PlanConfigModels.Max(p => p == null ? 0 : p.PlanConfigId);
                        m.RoleDividerId = Convert.ToInt16(autoNumber);
                        m.RoleDividerAddBy = User.Identity.GetUserId();
                        m.RoleDividerDateIn = DateTime.Now;
                        db.RoleDividerModels.InsertOnSubmit(m);
                        db.SubmitChanges();
                        return Ok(m);
                    }
                    else
                    {
                        RoleDividerModel updateData = db.RoleDividerModels.FirstOrDefault(p => p.RoleDividerId == m.RoleDividerId);

                        updateData.RoleDividerUpdatedBy = User.Identity.GetUserId();
                        updateData.RoleDividerUpdatedDate = DateTime.Now;
                        updateData.RoleDividerDescAR = m.RoleDividerDescAR;
                        updateData.RoleDividerDescEN = m.RoleDividerDescEN;
                        updateData.RoleDividerOrder = m.RoleDividerOrder;
                        updateData.RoleDividerStatus = m.RoleDividerStatus;

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

        [Route("ClassDivider/New")]
        public IHttpActionResult AddRoleClassDivider(RoleClassDividerModel m)
        {
            using (db)
            {
                if (ModelState.IsValid)
                {
                    RoleClassDividerModel result = db.RoleClassDividerModels.ToList()
                        .FirstOrDefault(p => p.RoleDividerId == m.RoleDividerId
                        &&p.RoleId==m.RoleId);
                    if (result == null)
                    {
                        m.RoleClassAddBy = User.Identity.GetUserId();
                        m.RoleClassDateIn = DateTime.Now;
                        db.RoleClassDividerModels.InsertOnSubmit(m);
                        db.SubmitChanges();
                        return Ok(m);
                    }
                    else
                    {
                        return Content(HttpStatusCode.Found, "Role Exists In Divider");
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
        public IHttpActionResult GetRolesGroup(RoleDividerModel m)
        {
            using (db)
            {
                IEnumerable<RoleDividerModel> result = db.RoleDividerModels
                    .Where(c => c.RoleDividerStatus == m.RoleDividerStatus || m.RoleDividerStatus == null).ToList();

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
