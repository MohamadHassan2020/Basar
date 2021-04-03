using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BasarV2.Controllers
{
    public class PlanConfigController : Controller
    {
        // GET: PlanConfig
        public ActionResult Index()
        {
            return View();
        }

        #region 30-4-2020  
        public ActionResult FollowUp()
        {
            return View();
        }
        #endregion
        #region 19-4-2020 camps

        public ActionResult Camp()
        {
            return View();
        }
        public ActionResult SponsorShip()
        {
            return View();
        }
        #endregion

        #region 21-4-2020 Countries
        public ActionResult Country()
        {
            return View();
        }
        public ActionResult Sponsor()
        {
            return View();
        }

        public ActionResult Tour()
        {
            return View();
        }

        #endregion

        #region 22-4-2020 

        public ActionResult CampStatus()
        {
            return View();
        }
        public ActionResult Team()
        {
            return View();
        }

        public ActionResult Year()
        {
            return View();
        }
        public ActionResult Stats()
        {
            return View();
        }

        #endregion

    }
}