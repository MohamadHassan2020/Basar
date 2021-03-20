using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Basar.PreparationForm
{
    public partial class frmViewFile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewPdfFile(Session["path"].ToString());
            }
        }
        void ViewPdfFile(string filepath)
        {
            try
            {
                string ext = Path.GetExtension(Path.GetFileName(filepath).ToString());
                if (ext.ToLower() == ".pdf")
                {
                    Response.Clear();
                    Response.ContentType = "application/pdf";
                    //Response.ContentType = "image/jpeg";
                    Response.AddHeader("content-disposition", "inline;filename=" + Path.GetFileName(filepath));
                    Response.AppendHeader("content-disposition", "inline;filename=" + Path.GetFileName(filepath));
                    Response.WriteFile(filepath);
                    Response.End();
                }
                else
                {
                    Response.Clear();
                    Response.ContentType = "application/jpg";
                    Response.AddHeader("content-disposition", "inline;filename=" + Path.GetFileName(filepath));
                    Response.AppendHeader("content-disposition", "inline;filename=" + Path.GetFileName(filepath));
                    Response.WriteFile(filepath);
                    Response.End();

                }
            }
            catch{}
            
        }
    }
}