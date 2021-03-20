using BasarBLL.Operation.AdminOperation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Basar.PreparationForm
{
    public partial class frmCooperator : System.Web.UI.Page
    {
        #region Cooperator

        void getCountries()
        {
            using (CountryOperation countryOperation=new CountryOperation())
            {
                countryOperation.GetCountries(ddlCountries);
            }
        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getCountries();
            }
        }
    }
}