USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetClinicalReportByCamp]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetClinicalReportByCamp]

			@YearId				tinyint			=NULL,
			@TourId				smallint		=NULL,
			@TeamId				smallint		=NULL,
			@CountryId			tinyint			=NULL,
			@CampId				smallint		=NULL

AS

BEGIN

				SELECT        TOP (100) PERCENT ManagerId, ChiefSurgeonId, InvolvedAgencies, CampReportNote
				FROM            dbo.tblCampClinicalReport
				WHERE        (YearId = @YearId) AND (TourId = @TourId) AND (TeamId = @TeamId) AND (CountryId = @CountryId) AND (CampId = @CampId)

END
GO
