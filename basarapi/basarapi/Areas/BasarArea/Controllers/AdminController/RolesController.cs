using basarapi.Areas.BasarArea.Db;
using basarapi.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace basarapi.Areas.BasarArea.Controllers.AdminController
{
    [RoutePrefix("basar/roles")]
    [Authorize]
    public class RolesController : ApiController
    {
        readonly ApplicationDbContext userDb;
        readonly BasarLinqDataContext db;
        public RolesController()
        {
            userDb = new ApplicationDbContext();
            db = new BasarLinqDataContext();
        }
        [Route("new")]
        [HttpPost]
        public IHttpActionResult AddRole(IdentityRole role)
        {
            using (userDb)
            {

                try
                {
                    // Your code...
                    // Could also be before try if you know the exception occurs in SaveChanges
                    if (ModelState.IsValid)
                    {
                        var myRole = userDb.Roles.Find(role.Name);
                        if (myRole == null)
                        {
                            userDb.Roles.Add(role);
                            userDb.SaveChanges();
                            return Ok(role);

                        }
                        else
                        {
                            //return Json(ModelState.Values.SelectMany(x => x.Errors));
                            return Content(HttpStatusCode.Found, "Role " + " exists");
                        }
                    }
                    else
                    {
                        //var errorList = ModelState.Values.SelectMany(m => m.Errors)
                        //                 .Select(e => e.ErrorMessage)
                        //                 .ToList();
                        return Content(HttpStatusCode.BadRequest, role.Name + " ؟ " + "موجود مسبقا ");
                    }
                }
                catch (DbEntityValidationException e)
                {
                    foreach (var eve in e.EntityValidationErrors)
                    {
                        Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                            eve.Entry.Entity.GetType().Name, eve.Entry.State);
                        foreach (var ve in eve.ValidationErrors)
                        {
                            Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                                ve.PropertyName, ve.ErrorMessage);
                        }
                    }
                    //throw;
                    return Content(HttpStatusCode.BadRequest, role.Name + " !! " + "موجود مسبقا ");
                }
            }
        }

        [Route("RoleExtend/New")]
        public IHttpActionResult AddRoleExtend(RoleExtendModel m)
        {
            using (db)
            {
                if (ModelState.IsValid)
                {
                    var dataModel = db.RoleExtendModels.ToList().FirstOrDefault(x => x.RoleDescAR == m.RoleDescAR
                    || x.RoleDescEN == m.RoleDescEN);
                    if (dataModel == null)
                    {

                        m.RoleAddBy = User.Identity.GetUserId();
                        m.RoleDateIn = DateTime.Now;

                        db.RoleExtendModels.InsertOnSubmit(m);
                        db.SubmitChanges();
                        return Ok(m);
                    }
                    else
                    {
                        return Content(HttpStatusCode.BadRequest, "وصف الصلاحية موجود مسبقاً");
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

        [Route("GetByRoleGroup")]
        [HttpPost]
        public IHttpActionResult GetRolesById(RoleSearch m)
        {
            using (db)
            {
                var result = (from role in db.vwGetRoleGroupDividerModels.AsEnumerable()

                              select new
                              {
                                  role.RoleDividerId,
                                  role.RoleDividerDescAR,
                                  role.RoleGroupId,
                                  role.RoleId,
                                  role.Name,
                                  role.RoleDescEN,
                                  role.RoleDescAR,
                                  

                              }).Where(x=>x.RoleGroupId == m.RoleGroupId || m.RoleGroupId == null).ToList();

                if (result == null)
                {
                    return Content(HttpStatusCode.NotFound, "no record found");
                }
                else
                    return Ok(result);
            }

        }
        [Route("GetByRoleDividerId")]
        [HttpPost]
        public IHttpActionResult GetRolesByGroupId(RoleSearch m)
        {
            using (db)
            {
                var result = (from role in userDb.Roles.AsEnumerable()

                              join roleDesc in db.RoleExtendModels
                                          on role.Id equals roleDesc.RoleId

                              join roleClass in db.RoleClassDividerModels
                                          on role.Id equals roleClass.RoleId

                              join roleDivider in db.RoleDividerModels
                                          on roleClass.RoleDividerId equals roleDivider.RoleDividerId
                              select new
                              {
                                  roleDivider.RoleDividerId,
                                  roleDivider.RoleDividerDescAR,
                                  role.Id,
                                  role.Name,
                                  roleDesc.RoleDescEN,
                                  roleDesc.RoleDescAR,
                                  roleDesc.RoleDateIn,

                              }).Where(x=>x.RoleDividerId== m.RoleDividerId || m.RoleDividerId==null).ToList();

                if (result == null)
                {
                    return Content(HttpStatusCode.NotFound, "no record found");
                }
                else
                    return Ok(result);
            }

        }
        [Route("")]
        [HttpPost]
        public IHttpActionResult GetRoles(RoleSearch m)
        {
            using (db)
            {
                var result = (from role in userDb.Roles.AsEnumerable()

                              join roleDesc in db.RoleExtendModels
                                          on role.Id equals roleDesc.RoleId

                              join roleClass in db.RoleClassDividerModels
                                          on role.Id equals roleClass.RoleId

                              join roleDivider in db.RoleDividerModels
                                          on roleClass.RoleDividerId equals roleDivider.RoleDividerId
                              select new
                              {
                                  roleDivider.RoleDividerId,
                                  roleDivider.RoleDividerDescAR,
                                  role.Id,
                                  role.Name,
                                  roleDesc.RoleDescEN,
                                  roleDesc.RoleDescAR,
                                  roleDesc.RoleDateIn,

                              }).ToList();

                if (result == null)
                {
                    return Content(HttpStatusCode.NotFound, "no record found");
                }
                else
                    return Ok(result);
            }

        }
    }
    public class RoleSearch
    {

        public string RoleName { get; set; }
        public short? RoleDividerId { get; set; }
        public short? RoleGroupId { get; set; }
    }
}
