using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace basarapi
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            //routes.IgnoreRoute("");
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );

            /* routes.MapRoute(
                 "Default",                          //The name of this route.
                 "api/{controller}/{action}/{id}",   //The url, note the prefix "api" is hard-coded.
                         new
                         {                               //The default values:
                             controller = "Home",            //{controller} in URL defaults to Home (i.e. HomeController)
                             action = "Index",               //{action} in URL defaults to Index method
                             id = UrlParameter.Optional
                         });  //The id part is optional
                         */
        }
    }
}
