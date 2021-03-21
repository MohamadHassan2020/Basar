using System.Web;
using System.Web.Optimization;

namespace basar
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {

            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/js/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at https://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js"));

            bundles.Add(new ScriptBundle("~/bundles/sweetalert2").Include(
                      "~/js/sweetalert2.all.js",
                      "~/js/jsProj/sweetalertmh.js"));

            #region proj

            //DataTable
            bundles.Add(new ScriptBundle("~/bundles/dataTables").Include(
                      "~/js/jquery.dataTables.min.js",
                      "~/js/dataTables.responsive.min.js"));
            //datepicker
            bundles.Add(new ScriptBundle("~/bundles/datepicker").Include(
                      "~/js/bootstrap-datepicker.js"));

            ////////////////////////////////////////////////////////////////////////////////////////////////
            ///
            bundles.Add(new ScriptBundle("~/bundles/piexif").Include(
                    "~/dist/fileinput/js/plugins/piexif.js"));

            bundles.Add(new ScriptBundle("~/bundles/fileinput").Include(
                      "~/dist/fileinput/js/fileinput.js"));

            bundles.Add(new ScriptBundle("~/bundles/explorertheme").Include(
                      "~/dist/fileinput/themes/explorer-fa/theme.js"));


            bundles.Add(new ScriptBundle("~/bundles/helper").Include(
                      "~/js/jsProj/helper.js"));
            //Country
            bundles.Add(new ScriptBundle("~/bundles/country").Include(
                      "~/js/jsProj/country.js"));
            //tour
            bundles.Add(new ScriptBundle("~/bundles/tour").Include(
                      "~/js/jsProj/tour.js"));
            //camp
            bundles.Add(new ScriptBundle("~/bundles/camp").Include(
                      "~/js/jsProj/camp.js"));
            //sponsor
            bundles.Add(new ScriptBundle("~/bundles/sponsor").Include(
                      "~/js/jsProj/sponsor.js"));
            //campstatus
            bundles.Add(new ScriptBundle("~/bundles/campstatus").Include(
                      "~/js/jsProj/campstatus.js"));
            //planconfig
            bundles.Add(new ScriptBundle("~/bundles/planconfig").Include(
                      "~/js/jsProj/planconfig.js"));

            //team
            bundles.Add(new ScriptBundle("~/bundles/team").Include(
                      "~/js/jsProj/team.js"));

            //year
            bundles.Add(new ScriptBundle("~/bundles/year").Include(
                      "~/js/jsProj/yearjs.js"));
            #endregion


            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.css",
                      "~/Content/site.css"));

            bundles.Add(new StyleBundle("~/Content/fontawesome").Include(
                      "~/css/font-awesome.css"));
            //sweetalert2
            bundles.Add(new StyleBundle("~/Content/sweetalert2").Include(
                      "~/css/sweetalert2.css"));

            bundles.Add(new StyleBundle("~/Content/fileinput").Include(
                      "~/dist/fileinput/css/fileinput.css"));

            bundles.Add(new StyleBundle("~/Content/explorertheme").Include(
                      "~/dist/fileinput/themes/explorer-fa/theme.css"));

            //#if DEBUG
            //            BundleTable.EnableOptimizations = false;
            //#else
            //BundleTable.EnableOptimizations = true;
            //#endif
            // Code removed for clarity.
            //BundleTable.EnableOptimizations = true;
        }
    }
}
