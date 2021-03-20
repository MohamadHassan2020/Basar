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
    [RoutePrefix("basar/RoleGroup")]
    [Authorize]
    public class RoleGroupController : ApiController
    {

        readonly BasarLinqDataContext db;
        public RoleGroupController()
        {
            db = new BasarLinqDataContext();
        }



        #region 22-4-2020

        [Route("del")]
        public IHttpActionResult DelRoleGroup(RoleGroupModel m)
        {
            using (db)
            {
                if (ModelState.IsValid)
                {
                        RoleGroupModel result = db.RoleGroupModels.ToList().FirstOrDefault(x => x.RoleGroupId == m.RoleGroupId);
                        if (result != null)
                        {
                            //Camp Stats Summary
                            //CampStatsSummaryModel campStats = db.CampStatsSummaryModels.FirstOrDefault(c => c.TeamId == tm.TeamId);
                            //if (campStats == null)
                            //{

                            db.RoleGroupModels.DeleteOnSubmit(result);
                            db.SubmitChanges();
                            return Ok();
                            //}
                            //else
                            //    return Content(HttpStatusCode.NotFound, "year allready used in Camp Stats");
                        }
                        else
                            return Content(HttpStatusCode.NotFound, "مجموعة الصلاحية غير موجوده");
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

        [Route("RoleGroupDivider/New")]
        [HttpPost]
        public IHttpActionResult AddRoleGroupDivider(RoleGroupDividerModel m)
        {
            using (db)
            {
                if (ModelState.IsValid)
                {
                    RoleGroupDividerModel result = db.RoleGroupDividerModels.ToList()
                        .FirstOrDefault(p => p.RoleGroupId == m.RoleGroupId
                        && p.RoleId==m.RoleId
                        && p.RoleDividerId == m.RoleDividerId);
                    if (result == null)
                    {
                        m.RoleGroupDividerAddBy = User.Identity.GetUserId();
                        m.RoleGroupDividerDateIn = DateTime.Now;
                        db.RoleGroupDividerModels.InsertOnSubmit(m);
                        db.SubmitChanges();
                        return Ok(m);
                    }
                    else
                    {
                        return Content(HttpStatusCode.BadRequest, "Role Group Divider Exists");
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
        [Route("New")]
        public IHttpActionResult AddRoleGroup(RoleGroupModel m)
        {
            using (db)
            {
                if (ModelState.IsValid)
                {
                    RoleGroupModel result = db.RoleGroupModels.ToList().FirstOrDefault(p => p.RoleGroupId == m.RoleGroupId);
                    if (result == null)
                    {
                        int autoNumber = db.RoleGroupModels.ToList().Where(p => p != null)
                    .Select(p => p.RoleGroupId + 1)
                    .DefaultIfEmpty(1)
                    .Max();

                        //pcm.PlanConfigId = db.PlanConfigModels.Max(p => p == null ? 0 : p.PlanConfigId);
                        m.RoleGroupId = Convert.ToInt16(autoNumber);
                        m.RoleGroupAddBy = User.Identity.GetUserId();
                        m.RoleGroupDateIn = DateTime.Now;
                        db.RoleGroupModels.InsertOnSubmit(m);
                        db.SubmitChanges();
                        return Ok(m);
                    }
                    else
                    {
                        RoleGroupModel updateData = db.RoleGroupModels.FirstOrDefault(p => p.RoleGroupId   == m.RoleGroupId);

                        updateData.RoleGroupUpdatedBy = User.Identity.GetUserId();
                        updateData.RoleGroupUpdatedDate = DateTime.Now;
                        updateData.RoleGroupDescAR = m.RoleGroupDescAR;
                        updateData.RoleGroupDescEN = m.RoleGroupDescEN;
                        updateData.RoleGroupOrder = m.RoleGroupOrder;
                        updateData.RoleGroupStatus = m.RoleGroupStatus;

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
        public IHttpActionResult GetRolesGroup(RoleGroupModel m)
        {
            using (db)
            {
                IEnumerable<RoleGroupModel> result = db.RoleGroupModels
                    .Where(c => c.RoleGroupStatus == m.RoleGroupStatus || m.RoleGroupStatus == null).ToList();

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
