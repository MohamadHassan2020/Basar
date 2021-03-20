using basarapi.Areas.BasarArea.Db;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace basarapi.Areas.BasarArea.Controllers.AdminController
{
    [RoutePrefix("basar/axis")]
    [Authorize]
    public class AxisController : ApiController
    {
        readonly BasarLinqDataContext db;
        public AxisController()
        {
            db = new BasarLinqDataContext();
        }

        #region 20-10-2020

        [Route("")]
        [HttpPost]
        public IHttpActionResult GetAxises()
        {
            using (db)
            {
                IEnumerable<vwGetAxisModel> countries = db.vwGetAxisModels
                    .Where(c => c.AxisStatus == true).ToList().OrderBy(x=>x.AxisOrder);

                if (countries == null)
                {
                    return Content(HttpStatusCode.NotFound, "no record found");
                }
                else
                    return Ok(countries);
            }

        }

        #endregion
    }
}
