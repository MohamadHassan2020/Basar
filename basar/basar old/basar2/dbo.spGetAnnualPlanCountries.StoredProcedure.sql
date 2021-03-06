USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetAnnualPlanCountries]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetAnnualPlanCountries]

			@YearId			tinyint			=null,
			@TourId			SMALLINT		=NULL
AS

BEGIN

			SELECT        dbo.tblCountries.CountryId, dbo.tblCountries.CountryDsecAr, dbo.tblCountries.CountryDsecEn
FROM            dbo.tblAnnualPlan INNER JOIN
                         dbo.tblCountries ON dbo.tblAnnualPlan.CountryId = dbo.tblCountries.CountryId
WHERE        (dbo.tblAnnualPlan.YearId = @YearId) AND (dbo.tblAnnualPlan.TourId = @TourId)
GROUP BY dbo.tblCountries.CountryId, dbo.tblCountries.CountryDsecAr, dbo.tblCountries.CountryDsecEn

END
GO
