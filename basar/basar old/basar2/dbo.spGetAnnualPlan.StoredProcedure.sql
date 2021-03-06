USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetAnnualPlan]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetAnnualPlan]

	@YearId		TINYINT					=NULL,
	@TourId		smallint				=NULL,
	@TeamId		smallint				=NULL,
	@CountryId	tinyint					=NULL,
	@CampId		smallint				=NULL,
	@SponsorId	smallint				=NULL,
	@CampStatusId	smallint			=NULL
	--@AnnualPlanStartDate	date	=NULL,
	--@AnnualPlanEndDate		date	=NULL

AS

BEGIN

			SELECT        TOP (100) PERCENT dbo.tblYears.YearNameAr, dbo.tblYears.YearNameEn, dbo.tblTeam.TeamDsecAr, dbo.tblTeam.TeamDsecEn, dbo.tblTour.TourDsecAr, dbo.tblTour.TourDsecEn, dbo.tblCamps.CampDsecAr, 
                         dbo.tblCamps.CampDsecEn, dbo.tblSponsors.SponsorDsecAr, dbo.tblSponsors.SponsorDsecEn, FORMAT(dbo.tblAnnualPlan.AnnualPlanStartDate, 'yyyy-MM-dd') AS AnnualPlanStartDateFormat, 
                         FORMAT(dbo.tblAnnualPlan.AnnualPlanEndDate, 'yyyy-MM-dd') AS AnnualPlanEndDateFormat, dbo.tblUsers.UserName AS AddBy, tblUsers_1.UserName AS UpdatedBy, dbo.tblAnnualPlan.AnnualPlanCreationDate, 
                         dbo.tblAnnualPlan.AnnualPlanUpdatedDate, dbo.tblAnnualPlan.AnnualPlanStatus, dbo.tblCountries.CountryDsecAr, dbo.tblCountries.CountryDsecEn, dbo.tblAnnualPlan.AnnualPlanId, dbo.tblAnnualPlan.YearId, 
                         dbo.tblAnnualPlan.TeamId, dbo.tblAnnualPlan.TourId, dbo.tblAnnualPlan.CountryId, dbo.tblAnnualPlan.CampId, dbo.tblAnnualPlan.SponsorId, dbo.tblAnnualPlan.AnnualPlanRemark, dbo.tblAnnualPlan.PreliminaryStatus, 
                         dbo.tblAnnualPlan.CampStatusId, dbo.tblCampStatus.CampStatusImage,dbo.tblCampStatus.CampStatusDescAR
FROM            dbo.tblAnnualPlan INNER JOIN
                         dbo.tblYears ON dbo.tblAnnualPlan.YearId = dbo.tblYears.YearId INNER JOIN
                         dbo.tblTeam ON dbo.tblAnnualPlan.TeamId = dbo.tblTeam.TeamId INNER JOIN
                         dbo.tblTour ON dbo.tblAnnualPlan.TourId = dbo.tblTour.TourId INNER JOIN
                         dbo.tblCamps ON dbo.tblAnnualPlan.CampId = dbo.tblCamps.CampId INNER JOIN
                         dbo.tblSponsors ON dbo.tblAnnualPlan.SponsorId = dbo.tblSponsors.SponsorId INNER JOIN
                         dbo.tblUsers ON dbo.tblAnnualPlan.AnnualPlanAddBy = dbo.tblUsers.UserId INNER JOIN
                         dbo.tblUsers AS tblUsers_1 ON dbo.tblAnnualPlan.AnnualPlanUpdatedBy = tblUsers_1.UserId INNER JOIN
                         dbo.tblCountries ON dbo.tblAnnualPlan.CountryId = dbo.tblCountries.CountryId LEFT OUTER JOIN
                         dbo.tblCampStatus ON dbo.tblAnnualPlan.CampStatusId = dbo.tblCampStatus.CampStatusId
WHERE        (dbo.tblAnnualPlan.YearId = @YearId OR
                         @YearId IS NULL) AND (dbo.tblAnnualPlan.TourId = @TourId OR
                         @TourId IS NULL) AND (dbo.tblAnnualPlan.TeamId = @TeamId OR
                         @TeamId IS NULL) AND (dbo.tblAnnualPlan.CountryId = @CountryId OR
                         @CountryId IS NULL) AND (dbo.tblAnnualPlan.CampId = @CampId OR
                         @CampId IS NULL) AND (dbo.tblAnnualPlan.SponsorId = @SponsorId OR
                         @SponsorId IS NULL)
						 AND(dbo.tblAnnualPlan.CampStatusId=@CampStatusId OR @CampStatusId IS NULL)
ORDER BY dbo.tblAnnualPlan.AnnualPlanStartDate 


END
GO
