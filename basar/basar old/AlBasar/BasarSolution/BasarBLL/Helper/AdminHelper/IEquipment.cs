﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace BasarBLL.Helper.AdminHelper
{
    interface IEquipment
    {
        void GetEquipment(GridView gvEquipment,bool equipmentDivider);
    }
}
