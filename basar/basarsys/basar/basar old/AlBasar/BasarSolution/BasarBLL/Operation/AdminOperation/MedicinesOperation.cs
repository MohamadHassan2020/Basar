using BasarBLL.Helper.AdminHelper;
using BasarDAL.DbaOperation;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace BasarBLL.Operation.AdminOperation
{
    public class MedicinesOperation : IMedicines, IDisposable
    {
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }

        public void GetMedicines(GridView gvMedicines)
        {
            using (DbaOperationClass dbOperation = new DbaOperationClass())
            {
                DataTable dt = dbOperation.GetDataTable("spGetMedicines");
                gvMedicines.DataSource = dt;
                gvMedicines.DataBind();

            };
        }
    }
}
