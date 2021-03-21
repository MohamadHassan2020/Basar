using Basar.Models;
using BasarBLL.Operation;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Basar.RPT
{
    public partial class frmViewReports : System.Web.UI.Page
    {
        HelperOperation helperOperation = HelperOperation.GetInstance();
        AnnualPlanReportModel annualPlanReport = AnnualPlanReportModel.GetInstance();
        #region shared print report
        void OpenReport()
        {
            ReportDocument report = new ReportDocument();
                using (AnnualPlanReportModel aprm = Session["ANNUALPLAN"] as AnnualPlanReportModel)
                {

                    if (aprm.ReportName == "annualreport")
                    {
                        report.Load(Server.MapPath("crAnnualPlan" + ".rpt"));
                        report.SetDataSource(annualPlanReport.GetAnnualPlanReportDT(aprm));
                        //TextObject PrintedBy;
                        //PrintedBy = (TextObject)report.ReportDefinition.Sections[0].ReportObjects["PrintedBytext"];
                        //PrintedBy.Text = Session["UserName"].ToString();

                        ExportOptions options = new ExportOptions
                        {
                            ExportFormatType = ExportFormatType.PortableDocFormat,
                            FormatOptions = new PdfRtfWordFormatOptions()

                        };

                        ExportRequestContext req = new ExportRequestContext()
                        {
                            ExportInfo = options
                        };
                        using (Stream s = report.FormatEngine.ExportToStream(req))
                        {
                            Response.ClearHeaders();
                            Response.ClearContent();
                            Response.ContentType = "application/pdf";
                            //Response.AddHeader("Content-Disposition", "inline;filename=ORIGINAL_FILENAME");
                            //Response.AddHeader("title", "filename=" + "xxx" + ".pdf");
                            s.Seek(0, SeekOrigin.Begin);
                            byte[] buffer = new byte[s.Length];
                            s.Read(buffer, 0, (int)s.Length);
                            Response.BinaryWrite(buffer);
                            Response.End();
                        }
                    }
                    else if (aprm.ReportName == "annualplansponsor")
                    { 
                        report.Load(Server.MapPath("crAnnualPlanSponsor" + ".rpt"));
                        report.SetDataSource(annualPlanReport.GetAnnualPlanReportDT(aprm));
                        //TextObject PrintedBy;
                        //PrintedBy = (TextObject)report.ReportDefinition.Sections[0].ReportObjects["PrintedBytext"];
                        //PrintedBy.Text = Session["UserName"].ToString();

                        ExportOptions options = new ExportOptions
                        {
                            ExportFormatType = ExportFormatType.PortableDocFormat,
                            FormatOptions = new PdfRtfWordFormatOptions()

                        };

                        ExportRequestContext req = new ExportRequestContext()
                        {
                            ExportInfo = options
                        };
                        using (Stream s = report.FormatEngine.ExportToStream(req))
                        {
                            Response.ClearHeaders();
                            Response.ClearContent();
                            Response.ContentType = "application/pdf";
                            //Response.AddHeader("Content-Disposition", "inline;filename=ORIGINAL_FILENAME");
                            //Response.AddHeader("title", "filename=" + "xxx" + ".pdf");
                            s.Seek(0, SeekOrigin.Begin);
                            byte[] buffer = new byte[s.Length];
                            s.Read(buffer, 0, (int)s.Length);
                            Response.BinaryWrite(buffer);
                            Response.End();
                        }
                    }
            }
        }

        #endregion


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["loginAuthentication"] == null)
            {
                Response.Redirect("../frmLogin.aspx");
            }
            else
            {
                OpenReport();
            }
            
        }
    }
}