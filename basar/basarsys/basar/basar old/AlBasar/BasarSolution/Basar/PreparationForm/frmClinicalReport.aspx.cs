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

namespace Basar.PreparationForm
{
    public partial class frmClinicalReport : System.Web.UI.Page
    {
        HelperOperation helperOperation = HelperOperation.GetInstance();
        #region banner
        void addListItem(DropDownList ddl, string value)
        {
            ListItem li = new ListItem(value, "-1");
            ddl.Items.Insert(0, li);
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
        void getYears()
        {
            using (helperOperation)
            {
                ddlYear.Items.Clear();
                addListItem(ddlYear, "عام الخطة");
                ddlYear.DataSource = helperOperation.GetDataTable("spGetAnnualPlanYears");
                ddlYear.DataBind();
            }
        }
        void getTours()
        {
            if (!ddlYear.SelectedValue.Equals(string.Empty) & !ddlYear.SelectedValue.Equals("-1"))
            {
                byte yearId = Convert.ToByte(ddlYear.SelectedValue);
                List<SqlParameter> sqlParameters = new List<SqlParameter>()
                {
                    new SqlParameter("@YearId", yearId)
                };
                using (helperOperation)
                {
                    ddlToure.Items.Clear();
                    addListItem(ddlToure, "الجولة");
                    ddlToure.DataSource = helperOperation.GetDataTable("spGetAnnualPlanTour", sqlParameters);
                    ddlToure.DataBind();
                }
            }
        }
        void GetManager(DropDownList ddl, string managerType, string defaultValue)
        {
            List<SqlParameter> sqlParameters = new List<SqlParameter>()
                {
                    new SqlParameter("@ManagerType", managerType)
                };
            using (helperOperation)
            {
                ddl.Items.Clear();
                addListItem(ddl, defaultValue);
                ddl.DataSource = helperOperation.GetDataTable("spGetManager", sqlParameters);
                ddl.DataBind();
            }
        }
        void getCountries()
        {
            if (!ddlYear.SelectedValue.Equals(string.Empty))
            {
                if (!string.IsNullOrEmpty(ddlToure.SelectedValue) && !string.Equals(ddlToure.SelectedValue, "-1"))
                {
                    byte yearId = Convert.ToByte(ddlYear.SelectedValue);
                    short TourId = Convert.ToInt16(ddlToure.SelectedValue);
                    List<SqlParameter> sqlParameters = new List<SqlParameter>()
                {
                    new SqlParameter("@YearId", yearId),
                    new SqlParameter("@TourId", TourId)
                };

                    using (helperOperation)
                    {
                        ddlCountries.Items.Clear();
                        addListItem(ddlCountries, "الدولة");
                        ddlCountries.DataSource = helperOperation.GetDataTable("spGetAnnualPlanCountries", sqlParameters);
                        ddlCountries.DataBind();
                    };
                }
            }
        }

        void getTeam()
        {
            if (!ddlYear.SelectedValue.Equals(string.Empty))
            {
                if (!string.IsNullOrEmpty(ddlToure.SelectedValue) && !string.Equals(ddlToure.SelectedValue, "-1"))
                {
                    if (!string.IsNullOrEmpty(ddlCountries.SelectedValue) && !string.Equals(ddlCountries.SelectedValue, "-1"))
                    {
                        if (!string.IsNullOrEmpty(ddlCamps.SelectedValue) && !string.Equals(ddlCamps.SelectedValue, "-1"))
                        {
                            byte yearId = Convert.ToByte(ddlYear.SelectedValue);
                            byte countryId = Convert.ToByte(ddlCountries.SelectedValue);
                            short TourId = Convert.ToInt16(ddlToure.SelectedValue);
                            short campId = Convert.ToInt16(ddlCamps.SelectedValue);
                            List<SqlParameter> sqlParameters = new List<SqlParameter>()
                                        {
                                            new SqlParameter("@YearId", yearId),
                                            new SqlParameter("@CountryId", countryId),
                                            new SqlParameter("@CampId", campId),
                                            new SqlParameter("@TourId", TourId)
                                        };
                            using (helperOperation)
                            {
                                ddlTeam.Items.Clear();
                                addListItem(ddlTeam, "الفريق");
                                ddlTeam.DataSource = helperOperation.GetDataTable("spGetAnnualPlanTeam", sqlParameters);
                                ddlTeam.DataBind();
                            };
                        }
                    }
                }
            }
        }
        void getCamps()
        {
            if (!ddlYear.SelectedValue.Equals(string.Empty))
            {
                if (!string.IsNullOrEmpty(ddlToure.SelectedValue) && !string.Equals(ddlToure.SelectedValue, "-1"))
                {
                    if (!string.IsNullOrEmpty(ddlCountries.SelectedValue) && !string.Equals(ddlCountries.SelectedValue, "-1"))
                    {

                        byte yearId = Convert.ToByte(ddlYear.SelectedValue);
                        byte countryId = Convert.ToByte(ddlCountries.SelectedValue);
                        short TourId = Convert.ToInt16(ddlToure.SelectedValue);
                        List<SqlParameter> sqlParameters = new List<SqlParameter>()
                                        {
                                            new SqlParameter("@YearId", yearId),
                                            new SqlParameter("@CountryId", countryId),
                                            new SqlParameter("@TourId", TourId)
                                        };
                        using (helperOperation)
                        {
                            ddlCamps.Items.Clear();
                            addListItem(ddlCamps, "المخيم");
                            ddlCamps.DataSource = helperOperation.GetDataTable("spGetAnnualPlanCamp", sqlParameters);
                            ddlCamps.DataBind();
                        };
                    }
                }
            }
        }

        void GetClinicalReportByCamp()
        {
            txtCampReportNote.Text = string.Empty;
            ddlManager.SelectedValue = "-1";
            ddlChiefSurgeon.SelectedValue = "-1";
            cbInvolvedAgencies.Checked = false;
            if (!string.IsNullOrEmpty(ddlYear.SelectedValue) && !string.Equals(ddlYear.SelectedValue, "-1") &&
            !string.IsNullOrEmpty(ddlCountries.SelectedValue) && !string.Equals(ddlCountries.SelectedValue, "-1") &&
           !string.IsNullOrEmpty(ddlToure.SelectedValue) && !string.Equals(ddlToure.SelectedValue, "-1") &&
            !string.IsNullOrEmpty(ddlTeam.SelectedValue) && !string.Equals(ddlTeam.SelectedValue, "-1") &&
            !string.IsNullOrEmpty(ddlCamps.SelectedValue) && !string.Equals(ddlCamps.SelectedValue, "-1"))
            {
                byte yearId = Convert.ToByte(ddlYear.SelectedValue);
                byte countryId = Convert.ToByte(ddlCountries.SelectedValue);
                short TourId = Convert.ToInt16(ddlToure.SelectedValue);
                short teamId = Convert.ToInt16(ddlTeam.SelectedValue);
                short campId = Convert.ToInt16(ddlCamps.SelectedValue);
                short managerId = Convert.ToInt16(ddlManager.SelectedValue);
                short chiefSurgeonId = Convert.ToInt16(ddlChiefSurgeon.SelectedValue);
                List<SqlParameter> sqlParameters = new List<SqlParameter>()
                                        {
                                            new SqlParameter("@YearId", yearId),
                                            new SqlParameter("@CountryId", countryId),
                                            new SqlParameter("@TourId", TourId),
                                            new SqlParameter("@CampId", campId),
                                            new SqlParameter("@TeamId", teamId)
                };
                using (helperOperation)
                {
                    SqlDataReader dr = helperOperation.GetDataReader("spGetClinicalReportByCamp", sqlParameters);
                    while (dr.Read())
                    {
                        ddlManager.SelectedValue = dr["ManagerId"].ToString();
                        ddlChiefSurgeon.SelectedValue = dr["ChiefSurgeonId"].ToString();
                        txtCampReportNote.Text = dr["CampReportNote"].ToString();
                        txtCampLocation.Text = dr["CampLocation"].ToString();
                        txtCoverageMedia.Text = dr["CoverageMedia"].ToString();
                        txtCampVisitors.Text = dr["CampVisitors"].ToString();
                        txtTeamMemberCount.Text = dr["TeamMemberCount"].ToString();
                        cbInvolvedAgencies.Checked = (bool)dr["InvolvedAgencies"];
                    }
                }
                //
            }
        }
        void GetClinicalReportAxes()
        {
            if (!string.IsNullOrEmpty(ddlYear.SelectedValue) && !string.Equals(ddlYear.SelectedValue, "-1") &&
            !string.IsNullOrEmpty(ddlCountries.SelectedValue) && !string.Equals(ddlCountries.SelectedValue, "-1") &&
           !string.IsNullOrEmpty(ddlToure.SelectedValue) && !string.Equals(ddlToure.SelectedValue, "-1") &&
            !string.IsNullOrEmpty(ddlTeam.SelectedValue) && !string.Equals(ddlTeam.SelectedValue, "-1") &&
            !string.IsNullOrEmpty(ddlCamps.SelectedValue) && !string.Equals(ddlCamps.SelectedValue, "-1"))
            {
                byte yearId = Convert.ToByte(ddlYear.SelectedValue);
                byte countryId = Convert.ToByte(ddlCountries.SelectedValue);
                short TourId = Convert.ToInt16(ddlToure.SelectedValue);
                short teamId = Convert.ToInt16(ddlTeam.SelectedValue);
                short campId = Convert.ToInt16(ddlCamps.SelectedValue);
                short managerId = Convert.ToInt16(ddlManager.SelectedValue);
                short chiefSurgeonId = Convert.ToInt16(ddlChiefSurgeon.SelectedValue);
                List<SqlParameter> sqlParameters = new List<SqlParameter>()
                                        {
                                            new SqlParameter("@YearId", yearId),
                                            new SqlParameter("@CountryId", countryId),
                                            new SqlParameter("@TourId", TourId),
                                            new SqlParameter("@CampId", campId),
                                            new SqlParameter("@TeamId", teamId)
                                };

                using (helperOperation)
                {
                    gvAxes.DataSource = helperOperation.GetDataTable("spGetClinicalReportAxesData", sqlParameters);
                    gvAxes.DataBind();
                }
                if (gvAxes.Rows.Count == 0)
                {
                    using (helperOperation)
                    {
                        gvAxes.DataSource = helperOperation.GetDataTable("spGetClinicalReportAxes");
                        gvAxes.DataBind();
                    };
                }
            }
            else
            {
                using (helperOperation)
                {
                    gvAxes.DataSource = helperOperation.GetDataTable("spGetClinicalReportAxes");
                    gvAxes.DataBind();
                }
            }

        }
        void AddCampClinicalReport()
        {
            if (ddlYear.SelectedValue.Equals(string.Empty) || ddlYear.SelectedValue.Equals("-1"))
            {
                MsgBox("عام الخطة");
            }
            else if (ddlToure.SelectedValue.Equals(string.Empty) || ddlToure.SelectedValue.Equals("-1"))
            {
                MsgBox("الجولة");
            }
            else if (ddlCountries.SelectedValue.Equals(string.Empty) || ddlCountries.SelectedValue.Equals("-1"))
            {
                MsgBox("الدولة");
            }
            else if (ddlCamps.SelectedValue.Equals(string.Empty) || ddlCamps.SelectedValue.Equals("-1"))
            {
                MsgBox("المخيم");
            }
            else if (ddlTeam.SelectedValue.Equals(string.Empty) || ddlTeam.SelectedValue.Equals("-1"))
            {
                MsgBox("الفريق");
            }
            else if (txtTeamMemberCount.Text.Trim().Equals(string.Empty))
            {
                MsgBox("عدد الفريق");
            }
            else if (ddlManager.SelectedValue.Equals(string.Empty) || ddlManager.SelectedValue.Equals("-1"))
            {
                MsgBox("مدير المخيم");
            }
            else if (ddlChiefSurgeon.SelectedValue.Equals(string.Empty) || ddlChiefSurgeon.SelectedValue.Equals("-1"))
            {
                MsgBox("المدير الطبي");
            }
            else
            {
                byte yearId = Convert.ToByte(ddlYear.SelectedValue);
                byte countryId = Convert.ToByte(ddlCountries.SelectedValue);
                short TourId = Convert.ToInt16(ddlToure.SelectedValue);
                short teamId = Convert.ToInt16(ddlTeam.SelectedValue);
                short campId = Convert.ToInt16(ddlCamps.SelectedValue);
                short managerId = Convert.ToInt16(ddlManager.SelectedValue);
                short chiefSurgeonId = Convert.ToInt16(ddlChiefSurgeon.SelectedValue);
                List<SqlParameter> sqlParameters = new List<SqlParameter>()
                                        {
                                            new SqlParameter("@YearId", yearId),
                                            new SqlParameter("@CountryId", countryId),
                                            new SqlParameter("@TourId", TourId),
                                            new SqlParameter("@CampId", campId),
                                            new SqlParameter("@TeamId", teamId),
                                            new SqlParameter("@ManagerId", managerId),
                                            new SqlParameter("@ChiefSurgeonId", chiefSurgeonId),
                                            new SqlParameter("@InvolvedAgencies", cbInvolvedAgencies.Checked),
                                            new SqlParameter("@CampLocation", txtCampLocation.Text.Trim()),
                                            new SqlParameter("@CoverageMedia", txtCoverageMedia.Text.Trim()),
                                            new SqlParameter("@CampVisitors", txtCampVisitors.Text.Trim()),
                                            new SqlParameter("@TeamMemberCount", Convert.ToInt16 (txtTeamMemberCount.Text.Trim())),
                                            new SqlParameter("@CampReportNote", txtCampReportNote.Text.Trim()),
                                            new SqlParameter("@CreationBy", getUserId()),
                                            new SqlParameter("@UpdatedBy", getUserId())
                                        };
                using (helperOperation)
                {
                    int row = helperOperation.ChangeModifyed("spAddCampClinicalReport", sqlParameters);
                    if (row > 0)
                    {

                        foreach (GridViewRow grdRow in gvAxes.Rows)
                        {
                            HiddenField hfAxesId = (HiddenField)grdRow.FindControl("hfAxesId");
                            TextBox txtMaleAxes = (TextBox)grdRow.FindControl("txtMaleAxes");
                            TextBox txtFemaleAxes = (TextBox)grdRow.FindControl("txtFemaleAxes");
                            TextBox txtAxesNote = (TextBox)grdRow.FindControl("txtAxesNote");
                            int axesId = Convert.ToInt16(hfAxesId.Value);
                            int maleAxes = 0;
                            if (!string.IsNullOrEmpty (txtMaleAxes.Text.Trim()))
                            {
                                maleAxes  = Convert.ToInt16(txtMaleAxes.Text.Trim());
                            }
                            int femaleAxes = 0;
                            if (!string.IsNullOrEmpty (txtFemaleAxes.Text.Trim()))
                            {
                                femaleAxes = Convert.ToInt16(txtFemaleAxes.Text.Trim());
                            }

                            List<SqlParameter> sqlParamAxes = new List<SqlParameter>()
                                        {
                                            new SqlParameter("@YearId", yearId),
                                            new SqlParameter("@CountryId", countryId),
                                            new SqlParameter("@TourId", TourId),
                                            new SqlParameter("@CampId", campId),
                                            new SqlParameter("@TeamId", teamId),
                                            new SqlParameter("@AxesId", axesId),
                                            new SqlParameter("@MaleAxes", maleAxes),
                                            new SqlParameter("@FemaleAxes", femaleAxes),
                                            new SqlParameter("@AxesNote", txtAxesNote.Text.Trim()),
                                            new SqlParameter("@CreationBy", getUserId()),
                                            new SqlParameter("@UpdatedBy", getUserId())

                        };
                            using (helperOperation)
                            {
                                helperOperation.ChangeModifyed("spAddClincalReportResult", sqlParamAxes);
                            }
                        }
                        MsgBox("تم الحفظ");
                    }

                }
            }
        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["AnnualPlanId"] = string.Empty;
                getYears();
                getTours();
                getCountries();
                getTeam();
                getCamps();
                GetClinicalReportAxes();
                GetManager(ddlManager, "1", "مدير المخيم");
                GetManager(ddlChiefSurgeon, "2", "المدير الطبي");
            }
        }
        protected void ddlToure_SelectedIndexChanged(object sender, EventArgs e)
        {
            getCountries();
            getCamps();
            getTeam();
        }
        protected void ddlCountries_SelectedIndexChanged(object sender, EventArgs e)
        {
            getCamps();
            getTeam();
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            AddCampClinicalReport();


        }

        protected void lbtnSearch_Click(object sender, EventArgs e)
        {
            //GetBannerAttachment();
        }



        protected void lbtnClear_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.Url.PathAndQuery, true);
        }

        protected void ddlYear_SelectedIndexChanged(object sender, EventArgs e)
        {
            getTours();
            getTeam();
        }

        protected void ddlCamps_SelectedIndexChanged(object sender, EventArgs e)
        {
            getTeam();
        }
        protected void ddlTeam_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetClinicalReportAxes();
            GetClinicalReportByCamp();
        }
    }
}