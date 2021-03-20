using BasarBLL.Operation.AdminOperation;
using BasarBLL.Operation.PlanOperation;
using BasarBLL.Operation.SharedOperation;
using BasarBO.AdminBO;
using BasarBO.PlanBO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Basar.PreparationForm
{
    public partial class frmSupportAssistance : System.Web.UI.Page
    {
        #region Support Assistance 


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
        void getSupportAssistance()
        {
            using (SupportAssistanceOperation supportAssistanceOperation = new SupportAssistanceOperation())
            {
                supportAssistanceOperation.GetSupportAssistance(ddlVisa);
            }
        }
        void getPermit()
        {
            using (SupportAssistanceOperation supportAssistanceOperation = new SupportAssistanceOperation())
            {
                supportAssistanceOperation.GetSupportAssistance(ddlPermit);
            }
        }
        int AddCampSupportAssistance()
        {
            using (CampSupportAssistance campSupportAssistance = new CampSupportAssistance())
            {
                campSupportAssistance.AccommodationId = Convert.ToByte(ddlAccommodation.SelectedValue);
                campSupportAssistance.AddBy = getUserId();
                campSupportAssistance.AdvertisementId = Convert.ToByte(ddlAdvertisement.SelectedValue);
                campSupportAssistance.CampId = Convert.ToInt16(ddlCamps.SelectedValue);
                campSupportAssistance.CountryId = Convert.ToByte(ddlCountries.SelectedValue);
                campSupportAssistance.CustomsClearanceId = Convert.ToByte(ddlCustomsClearance.SelectedValue);
                campSupportAssistance.OrganizationalTeamRemark = txtOrganizationalTeamRemark.Text.Trim();
                campSupportAssistance.OrganizationalTeamStatus = rblOrganizationalTeam.SelectedValue;
                campSupportAssistance.PermitId = Convert.ToByte(ddlPermit.SelectedValue);
                campSupportAssistance.PhysicainRegStatus = rblPhysicain.SelectedValue;
                campSupportAssistance.TranslatorsRegStatus = rblTranslators.SelectedValue;
                campSupportAssistance.TranslatorsRemark = txtTranslatorsRemark.Text.Trim();
                campSupportAssistance.TransportationId = Convert.ToByte(ddlTransportation.SelectedValue);
                campSupportAssistance.UpdatedBy = getUserId();
                campSupportAssistance.VisaId = Convert.ToByte(ddlVisa.SelectedValue);
                campSupportAssistance.VolunteersRegStatus = rblVolunteers.SelectedValue;
                campSupportAssistance.VolunteersRemark = txtVolunteersRemark.Text.Trim();
                campSupportAssistance.YearId = Convert.ToByte(ddlYear.SelectedValue);
                using (CampSupportAssistanceOperation campSupportAssistanceOperation = new CampSupportAssistanceOperation())
                {
                    return campSupportAssistanceOperation.AddCampSupportAssistance(campSupportAssistance);
                }
            }
        }
        void getAdvertisement()
        {
            using (SupportAssistanceOperation supportAssistanceOperation = new SupportAssistanceOperation())
            {
                supportAssistanceOperation.GetSupportAssistance(ddlAdvertisement);
            }
        }
        void getTransportation()
        {
            using (SupportAssistanceOperation supportAssistanceOperation = new SupportAssistanceOperation())
            {
                supportAssistanceOperation.GetSupportAssistance(ddlTransportation);
            }
        }



        void getCustomsClearance()
        {
            using (SupportAssistanceOperation supportAssistanceOperation = new SupportAssistanceOperation())
            {
                supportAssistanceOperation.GetSupportAssistance(ddlCustomsClearance);
            }
        }
        void getAccommodation()
        {
            using (SupportAssistanceOperation supportAssistanceOperation = new SupportAssistanceOperation())
            {
                supportAssistanceOperation.GetSupportAssistance(ddlAccommodation);
            }
        }

        void getYears()
        {
            using (YearsOperation yearsOperation = new YearsOperation())
            {
                yearsOperation.GetYears(ddlYear);
            }
        }

        void getCountries()
        {
            using (CountryOperation countryOperation = new CountryOperation())
            {
                countryOperation.GetCountries(ddlCountries);
            };
        }
        void getCamps()
        {
            if (!string.IsNullOrEmpty(ddlCountries.SelectedValue))
            {
                byte countryId = Convert.ToByte(ddlCountries.SelectedValue);
                using (CampOperation campOperation = new CampOperation())
                {
                    campOperation.GetCamps(ddlCamps, countryId);
                };
            }
        }
        void getEquipment()
        {
            using (EquipmentOperation equipmentOperation = new EquipmentOperation())
            {
                equipmentOperation.GetEquipment(gvEquipment, false);
            }
        }

        int AddCampEquipment(CampEquipment campEquipment)
        {
            using (CampEquipmentOperation campEquipmentOperation = new CampEquipmentOperation())
            {
                return campEquipmentOperation.AddCampEquipment(campEquipment);
            };
        }

        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["IndicatorId"] = string.Empty;
                getCountries();
                getSupportAssistance();
                getPermit();
                getCustomsClearance();
                getYears();
                getEquipment();
                getAdvertisement();
                getTransportation();
                getAccommodation();

            }
        }
        protected void btnNew_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.Url.PathAndQuery, true);
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            int row = AddCampSupportAssistance();
            if (row > 0)
            {
                MsgBox("تم الحفظ ");
            }
        }
        protected void ddlCountries_SelectedIndexChanged(object sender, EventArgs e)
        {

            getCamps();
        }

        protected void aSave_ServerClick(object sender, EventArgs e)
        {
            if (ddlCamps.SelectedValue.Equals(string.Empty) || ddlCamps.SelectedValue.Equals("-1"))
            {
                MsgBox("المخيم");
            }
            else if (ddlCountries.SelectedValue.Equals(string.Empty) || ddlCountries.SelectedValue.Equals("-1"))
            {
                MsgBox("الدولة");
            }

            else if (ddlYear.SelectedValue.Equals(string.Empty) || ddlYear.SelectedValue.Equals("-1"))
            {
                MsgBox("عام الخطة");
            }

            else
            {
                foreach (GridViewRow grdRow in gvEquipment.Rows)
                {
                    TextBox txtCampEquipmentMemo = (TextBox)grdRow.FindControl("txtCampEquipmentMemo");
                    TextBox txtAvailableNumber = (TextBox)grdRow.FindControl("txtAvailableNumber");
                    Label lblRequiredNumber = (Label)grdRow.FindControl("lblRequiredNumber");
                    Label lblEquipmentId = (Label)grdRow.FindControl("lblEquipmentId");
                    RadioButtonList rblCampEquipmentStatus = (RadioButtonList)grdRow.FindControl("rblCampEquipmentStatus");
                    using (CampEquipment campEquipment = new CampEquipment())
                    {
                        campEquipment.AddBy = getUserId();
                        campEquipment.AvailableNumber = !txtAvailableNumber.Text.Trim().Equals(string.Empty) ?
                            Convert.ToInt16(txtAvailableNumber.Text.Trim()) : Convert.ToInt16(0);
                        campEquipment.CampId = Convert.ToInt16(ddlCamps.SelectedValue);
                        campEquipment.CampEquipmentMemo = txtCampEquipmentMemo.Text.Trim();
                        campEquipment.CampEquipmentStatus = rblCampEquipmentStatus.SelectedValue;
                        campEquipment.CountryId = Convert.ToByte(ddlCountries.SelectedValue);
                        campEquipment.EquipmentId = Convert.ToInt16(lblEquipmentId.Text);
                        campEquipment.RequiredNumber = !lblRequiredNumber.Text.Trim().Equals(string.Empty) ?
                           Convert.ToInt16(lblRequiredNumber.Text.Trim()) : Convert.ToInt16(0);
                        campEquipment.UpdatedBy = getUserId();
                        campEquipment.YearId = Convert.ToByte(ddlYear.SelectedValue);
                        int row = AddCampEquipment(campEquipment);
                        if (row > 0)
                        {
                            MsgBox("تم الحفظ");
                        }
                    }

                }
            }
        }
    }
}
