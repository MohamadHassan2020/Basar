using basarapi.Areas.BasarArea.Db;
using basarapi.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Claims;
using System.Web.Http;

namespace basarapi.Areas.BasarArea.Controllers.AdminController
{
    [RoutePrefix("Basar/UserHelper")]
    //[Authorize]
    public class UserHelperController : ApiController
    {
        readonly BasarLinqDataContext db;
        readonly ApplicationDbContext dbUsers;
        public UserHelperController()
        {
            db = new BasarLinqDataContext();
            dbUsers = new ApplicationDbContext();
        }

        #region 10-6-2020
        [Route("Get")]
        [HttpPost]
        public IHttpActionResult GetUsers(UserSearch m)
        {
            //using (dbUsers)
            //{
                //IEnumerable<ApplicationUser> users = dbUsers.Users.ToList();
               var users = dbUsers.Users.ToList();

                if (users == null)
                {
                    return Content(HttpStatusCode.NotFound, "User Not Found");
                }
                else
                    return Ok(users);
            //}

        }

        [Route("New")]
        public IHttpActionResult AddUserGroups(UserGroupModel m)
        {
            using (db)
            {
                if (ModelState.IsValid)
                {
                    var data = db.UserGroupModels.ToList()
                        .FirstOrDefault(p => p.UserId == m.UserId
                        && p.RoleGroupId==m.RoleGroupId);
                    if (data == null)
                    {
                        
                        m.UserGroupAddBy = User.Identity.GetUserId();
                        m.UserGroupDateIn = DateTime.Now;
                     
                        db.UserGroupModels.InsertOnSubmit(m);
                        db.SubmitChanges();
                        return Ok(m);
                    }
                    else
                    {
                        return Content(HttpStatusCode.Ambiguous, "Exists");
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
        [Route("UserRole/New")]
        public IHttpActionResult AddUserRoles(AspNetUserRoleModel m)
        {
            using (db)
            {
                if (ModelState.IsValid)
                {
                    var data = db.AspNetUserRoleModels.ToList()
                        .FirstOrDefault(p => p.UserId == m.UserId
                        && p.RoleId==m.RoleId);
                    if (data == null)
                    {
                        db.AspNetUserRoleModels.InsertOnSubmit(m);
                        db.SubmitChanges();
                        return Ok(m);
                    }
                    else
                    {
                        return Content(HttpStatusCode.Ambiguous, "Role Exists");
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


        [Route("Check")]
        [HttpPost]
        public   IHttpActionResult CheckUserRoleExists(UserSearch m)
        {
            //bool isAuth = false;
            //IdentityRole roleXists = new IdentityRole(m.RoleName);
            //var userName = ((ClaimsIdentity)RequestContext.Principal.Identity).Claims.FirstOrDefault(cl => cl.Type == "UserName")?.Value;
            //first get the User id by calling user.idetntity
            //var user = User.Identity.GetUserId();
            ////appuser
            //ApplicationUser appUser = new ApplicationUser();
            //appUser = db.Users.Find(user);


            //get the user name
            //var Name = appUser.UserName;
            //if (roleXists!=null)
            //{
            //    isAuth = db.AspNetUserRoleModels.ToList()
            //          .Any(p => p.UserId == User.Identity.GetUserId()
            //          && p.RoleId == roleXists.Id);
            //    if (isAuth)
            //    {
            //        return Ok(isAuth);
            //    }
            //    else
            //    {
            //        return Content(HttpStatusCode.Unauthorized, "un authorized");
            //    }
            //}
            //return Content(HttpStatusCode.BadRequest, "Role Not Exists");

            return Ok(User.IsInRole(m.RoleName));

        }
        #endregion
    }
    public class UserSearch
    {
        public bool? UserStatus { get; set; }
        public string UserId { get; set; }
        public string RoleName { get; set; }
    }
}
