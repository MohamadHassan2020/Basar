using BasarBLL.Operation;
using BasarBLL.Operation.AdminOperation;
using BasarBLL.Operation.SharedOperation;
using BasarBO.AdminBO;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Basar.AdminForm
{
    public partial class frmTour : System.Web.UI.Page
    {
        HelperOperation helperOperation = HelperOperation.GetInstance();
        #region Tour 
        void getTeams()
        {
            using (TeamOperation teamOperation = new TeamOperation())
            {
                teamOperation.GetTeams(ddlTeam);
            };
        }
        
        short getUserId()
        {
            using (LoginAuthentication loginAuthentication = Session["loginAuthentication"] as LoginAuthentication)
            {
                return loginAuthentication.UserId;
            }
        }
        void MsgBox(string msg)
        {
            using (SharedOp sharedOp = new SharedOp())
            {
                sharedOp.MyMessege(upMain, msg);
            }
        }
        void addTour()
        {
            if (string.IsNullOrEmpty(txtTourDsecAr.Text.Trim()))
            {
                MsgBox("إسم الرحلة بالعربي");
            }
            else if (string.IsNullOrEmpty(txtTourDsecEn.Text.Trim()))
            {
                MsgBox("إسم الرحلة بالانجليزية");
            }
            else if (string.Equals(ddlTeam.SelectedValue, "-1") || string.IsNullOrEmpty(ddlTeam.SelectedValue))
            {
                MsgBox("الفريق");
            }
            else if (int.Equals(rblTourStatus.SelectedIndex, -1))
            {
                MsgBox("حالة الرحلة");
            }
            else
            {
                using (Tour tour = new Tour())
                {
                    tour.CreationBy = getUserId();
                    tour.TourDsecAr = txtTourDsecAr.Text.Trim();
                    tour.TourDsecEn = txtTourDsecEn.Text.Trim();
                    tour.TeamId = Convert.ToInt16(ddlTeam.SelectedValue);
                    tour.TourOrder = 1;
                    tour.TourStatus = Convert.ToBoolean(rblTourStatus.SelectedValue.ToLower());
                    tour.UpdatedBy = getUserId();
                    if (!string.IsNullOrEmpty(ViewState["TourId"].ToString()))
                    {
                        tour.TourId = Convert.ToByte(ViewState["TourId"].ToString());
                    }
                    using (ToursOperation toursOperation = new ToursOperation())
                    {
                        toursOperation.AddTour(tour);
                        ViewState["TourId"] = tour.TourIdOut;
                        MsgBox(tour.MsgOut);
                    }
                }
            }
        }
        #endregion
        #region 15-12-2018

        void GetToursExists()
        {
            using (helperOperation)
            {
                byte? teamId=!string.IsNullOrEmpty(ddlTeam.SelectedValue)
                    && !ddlTeam.SelectedValue.Equals("-1") ? teamId=Convert.ToByte(ddlTeam.SelectedValue):null;
                List<SqlParameter> sqlparm = new List<SqlParameter>()
                    {
                        new SqlParameter("@TeamId", teamId)
                };
                gvExists.DataSource = helperOperation.GetDataTable("spGetToursExists", sqlparm);
                gvExists.DataBind();
            }
        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["TourId"] = string.Empty;
                getTeams();
                GetToursExists();
            }
        }
        protected void btnNew_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.Url.PathAndQuery, true);
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            addTour();
            GetToursExists();
        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            try
            {
                GetToursExists();
            }
            catch  
            {}
           
        }

        protected void gvExists_DataBound(object sender, EventArgs e)
        {
            foreach (GridViewRow grdRow in gvExists.Rows)
            {
                HiddenField hfTourStatus = (HiddenField)grdRow.FindControl("hfTourStatus");
                Image imgStatus = (Image)grdRow.FindControl("imgStatus");
                CheckExistDocument(hfTourStatus.Value, imgStatus, "../images/yes.png", "../images/nosm.png");
            }
        }

        public void CheckExistDocument(string value, System.Web.UI.WebControls.Image imgStatus, string imgTrue, string imgFalse)
        {
            if (value.Equals(string.Empty))
            {
                imgStatus.ImageUrl = imgFalse;
            }
            else
            {
                if (value.ToLower().Equals("true"))
                {
                    imgStatus.ImageUrl = imgTrue;
                }
                else
                {
                    imgStatus.ImageUrl = imgFalse;
                }
            }
        }

        protected void gvExists_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            try
            {
                if (e.CommandName == "cnEdit")
                {
                    GridViewRow row = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
                    HiddenField hfTourStatus = (HiddenField)row.FindControl("hfTourStatus");
                    HiddenField hfTourId = (HiddenField)row.FindControl("hfTourId");
                    HiddenField hfTeamId = (HiddenField)row.FindControl("hfTeamId");
                    Label lblTourDsecAr = (Label)row.FindControl("lblTourDsecAr");
                    Label lblTourDsecEn = (Label)row.FindControl("lblTourDsecEn");
                    ViewState["TourId"] = hfTourId.Value;
                    rblTourStatus.SelectedValue = Convert.ToBoolean(hfTourStatus.Value).ToString().ToLower();
                    ddlTeam.SelectedValue = hfTeamId.Value;
                    txtTourDsecAr.Text = lblTourDsecAr.Text;
                    txtTourDsecEn.Text = lblTourDsecEn.Text;
                }
            }
            catch  
            {

                
            }
            
        }

        protected void gvExists_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            
            try
            {
                gvExists.PageIndex = e.NewPageIndex;
                GetToursExists();
            }
            catch
            { }
        }
    }
}