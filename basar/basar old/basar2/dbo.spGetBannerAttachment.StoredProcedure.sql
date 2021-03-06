USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetBannerAttachment]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetBannerAttachment]


	 
			@CampId				smallint		=NULL,
			@CountryId			tinyint			=NULL,
			@TourId				smallint		=NULL,
			@YearId				tinyint			=NULL


AS

BEGIN


			SELECT        BannerFileName, BannerFilePath, BannerAttachmentId, dbo.tblBannerAttachment.CreationDate,
			dbo.tblYears.YearNameAr, dbo.tblCountries.CountryDsecAr, dbo.tblTour.TourDsecAr, dbo.tblCamps.CampDsecAr


			FROM            dbo.tblBannerAttachment INNER JOIN
                         dbo.tblCamps ON dbo.tblBannerAttachment.CampId = dbo.tblCamps.CampId INNER JOIN
                         dbo.tblCountries ON dbo.tblBannerAttachment.CountryId = dbo.tblCountries.CountryId INNER JOIN
                         dbo.tblTour ON dbo.tblBannerAttachment.TourId = dbo.tblTour.TourId INNER JOIN
                         dbo.tblYears ON dbo.tblBannerAttachment.YearId = dbo.tblYears.YearId


			WHERE        (dbo.tblBannerAttachment.CampId = @CampId OR @CampId IS NULL) AND (dbo.tblBannerAttachment.CountryId = @CountryId OR @CountryId IS NULL) 
			AND (dbo.tblBannerAttachment.TourId = @TourId OR @TourId IS NULL)
			 AND (dbo.tblBannerAttachment.YearId = @YearId OR @YearId IS NULL)

END
GO
