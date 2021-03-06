USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetCampsPreliminary]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetCampsPreliminary] 
@CountryId	TINYINT =NULL,
@YearId		TINYINT =NULL	
AS
BEGIN

			SELECT        TOP (100) PERCENT dbo.tblCamps.CampId, dbo.tblCamps.CampDsecAr, dbo.tblCamps.CampDsecEn, dbo.tblCamps.CampOrder, dbo.tblCamps.CampStatus, dbo.tblAnnualPlan.PreliminaryStatus, dbo.tblAnnualPlan.YearId
FROM            dbo.tblCamps INNER JOIN
                         dbo.tblAnnualPlan ON dbo.tblCamps.CampId = dbo.tblAnnualPlan.CampId
WHERE        (dbo.tblCamps.CampStatus = 1) AND (dbo.tblCamps.CountryId = @CountryId) AND (dbo.tblAnnualPlan.PreliminaryStatus = 1) AND (dbo.tblAnnualPlan.YearId = @YearId)
ORDER BY dbo.tblCamps.CampOrder

END
GO
