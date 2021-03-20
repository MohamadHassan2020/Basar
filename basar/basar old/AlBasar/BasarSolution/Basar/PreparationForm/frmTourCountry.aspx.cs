using BasarBLL.Operation.AdminOperation;
using BasarBLL.Operation.SharedOperation;
using BasarBO.AdminBO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Basar.PreparationForm
{
    public partial class frmTourCountry : System.Web.UI.Page
    {
        #region Survey Category 


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
        void AddTourCountry()
        {

            using (TourCountry tourCountry = new TourCountry())
            {
                tourCountry.AddBy = getUserId();
                tourCountry.TourCountryStatus = true;
                tourCountry.UpdatedBy = getUserId();
                int row = 0;
                foreach (ListItem country in cblCountries.Items)
                {
                    if (country.Selected)
                    {
                        tourCountry.CountryId = Convert.ToByte(country.Value);
                        foreach (ListItem tour in cblTour.Items)
                        {
                            if (tour.Selected)
                            {
                                tourCountry.TourId = Convert.ToInt16(tour.Value);
                                using (CountryOperation countryOperation = new CountryOperation())
                                {
                                    row = countryOperation.AddTourCountry(tourCountry);
                                }
                            }
                           
                        }
                    }
                }
                if (row>0)
                {
                    MsgBox("تم الحفظ بنجاح");
                }
            }
        }
        void getTours()
        {
            using (ToursOperation toursOperation = new ToursOperation())
            {
                toursOperation.GetTours(cblTour);
            }
        }
        void getCountries()
        {
            using (CountryOperation countryOperation = new CountryOperation())
            {
                countryOperation.GetCountries(cblCountries);
            };
        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getTours();
                getCountries();
            }
        }
        protected void btnNew_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.Url.PathAndQuery, true);
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            AddTourCountry();
        }
    }
}