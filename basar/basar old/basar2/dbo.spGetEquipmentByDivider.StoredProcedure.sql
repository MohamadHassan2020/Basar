USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetEquipmentByDivider]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetEquipmentByDivider]

@EquipmentDivider BIT =NULL

AS

BEGIN

		SELECT        EquipmentId, EquipmentDescEn, EquipmentDescEnAr, EquipmentRequiredNumber, EquipmentStatus, EquipmentDivider, EquipmentOrder
		FROM            dbo.tblEquipment
		WHERE        (EquipmentOrder = 1) AND (EquipmentDivider = @EquipmentDivider)



END
GO
