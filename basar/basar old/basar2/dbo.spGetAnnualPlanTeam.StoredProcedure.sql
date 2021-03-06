USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetAnnualPlanTeam]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetAnnualPlanTeam]

			@YearId			tinyint			=null,
			@TourId			SMALLINT		=NULL,
			@CampId			SMALLINT		=NULL,
			@CountryId		tinyint			=NULL
AS

BEGIN

			SELECT        dbo.tblTeam.TeamId, dbo.tblTeam.TeamDsecAr, dbo.tblTeam.TeamDsecEn
				FROM            dbo.tblAnnualPlan INNER JOIN
										 dbo.tblTeam ON dbo.tblAnnualPlan.TeamId = dbo.tblTeam.TeamId
				WHERE        (dbo.tblAnnualPlan.YearId = @YearId) AND (dbo.tblAnnualPlan.TourId = @TourId) AND (dbo.tblAnnualPlan.CountryId = @CountryId) AND (dbo.tblAnnualPlan.CampId = @CampId)
				GROUP BY dbo.tblTeam.TeamId, dbo.tblTeam.TeamDsecAr, dbo.tblTeam.TeamDsecEn

END
GO
