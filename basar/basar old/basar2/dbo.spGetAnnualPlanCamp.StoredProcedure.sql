USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetAnnualPlanCamp]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetAnnualPlanCamp]

			@YearId			tinyint			=null,
			@TourId			SMALLINT		=NULL,
			@CountryId		tinyint			=NULL
AS

BEGIN

					SELECT        dbo.tblCamps.CampId, dbo.tblCamps.CampDsecAr, dbo.tblCamps.CampDsecEn
			FROM            dbo.tblAnnualPlan INNER JOIN
									 dbo.tblCamps ON dbo.tblAnnualPlan.CampId = dbo.tblCamps.CampId
			WHERE        (dbo.tblAnnualPlan.YearId = @YearId) AND (dbo.tblAnnualPlan.TourId = @TourId) AND (dbo.tblAnnualPlan.CountryId = @CountryId)
			GROUP BY dbo.tblCamps.CampId, dbo.tblCamps.CampDsecAr, dbo.tblCamps.CampDsecEn

END
GO
