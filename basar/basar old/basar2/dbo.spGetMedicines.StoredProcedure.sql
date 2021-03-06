USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetMedicines]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetMedicines]

 
AS

BEGIN

		SELECT        TOP (100) PERCENT dbo.tblMedicinesCategory.MedicinesCategoryNameAr, dbo.tblMedicinesCategory.MedicinesCategoryNameEn, 
                         dbo.tblMedicinesCategory.MedicinesCategoryOrder, dbo.tblMedicines.MedicinesNameAr, dbo.tblMedicines.MedicinesNameEn, dbo.tblMedicines.MedicinesOrder, 
                         dbo.tblMedicines.MedicinesStatus, dbo.tblMedicinesCategory.MedicinesCategoryStatus, dbo.tblMedicines.MedicinesRequiredNumber, 
                         dbo.tblMedicines.MedicinesId, dbo.tblMedicinesCategory.MedicinesCategoryId
FROM            dbo.tblMedicinesCategory INNER JOIN
                         dbo.tblMedicines ON dbo.tblMedicinesCategory.MedicinesCategoryId = dbo.tblMedicines.MedicinesCategoryId
WHERE        (dbo.tblMedicines.MedicinesStatus = 1) AND (dbo.tblMedicinesCategory.MedicinesCategoryStatus = 1)
ORDER BY dbo.tblMedicinesCategory.MedicinesCategoryOrder, dbo.tblMedicines.MedicinesOrder



END
GO
