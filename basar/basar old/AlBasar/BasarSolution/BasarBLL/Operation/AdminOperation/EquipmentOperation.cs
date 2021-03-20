using BasarBLL.Helper.AdminHelper;
using BasarDAL.DbaOperation;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace BasarBLL.Operation.AdminOperation
{
    public class EquipmentOperation : IEquipment, IDisposable
    {
        public void Dispose()
        {
            GC.SuppressFinalize(this);
        }

        public void GetEquipment(GridView gvEquipment, bool equipmentDivider)
        {

            List<SqlParameter> sqlparm = new List<SqlParameter>()
                {
                    new SqlParameter("@EquipmentDivider", equipmentDivider)
                    };
            using (DbaOperationClass dbOperation = new DbaOperationClass())
            {
                DataTable dt = dbOperation.GetDataTable("spGetEquipmentByDivider", sqlparm);
                gvEquipment.DataSource = dt;
                gvEquipment.DataBind();

            };
        }
    }
}
