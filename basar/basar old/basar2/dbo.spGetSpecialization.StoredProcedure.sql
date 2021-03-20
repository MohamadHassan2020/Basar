USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetSpecialization]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetSpecialization]
  
AS
BEGIN

		SELECT        TOP (100) PERCENT SpecializationId, SpecializationDsecAr, SpecializationDsecEn
FROM            dbo.tblSpecialization
WHERE        (SpecializationStatus = 1)
ORDER BY SpecializationOrder


END
GO
