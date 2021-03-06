USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetClinicalReportAxesData]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetClinicalReportAxesData]

			@YearId				tinyint			=NULL,
			@TourId				smallint		=NULL,
			@TeamId				smallint		=NULL,
			@CountryId			tinyint			=NULL,
			@CampId				smallint		=NULL

AS

BEGIN

					SELECT        TOP (100) PERCENT dbo.tblClinicalReportAxes.AxesName, dbo.tblClinicalReportAxes.AxesId, dbo.tblClinicalReportAxes.AxesEN, dbo.tblClinicalReportAxes.AxesOrder, dbo.tblClinicalReportAxes.AxesStatus, 
											 dbo.tblClincalReportResult.MaleAxes, dbo.tblClincalReportResult.FemaleAxes, dbo.tblClincalReportResult.AxesNote
					FROM            dbo.tblClinicalReportAxes LEFT OUTER JOIN
											 dbo.tblClincalReportResult ON dbo.tblClinicalReportAxes.AxesId = dbo.tblClincalReportResult.AxesId
					WHERE        (ISNULL(dbo.tblClinicalReportAxes.AxesStatus, 0) = 1) 
					AND (dbo.tblClincalReportResult.CampId = @CampId) 
					AND (dbo.tblClincalReportResult.CountryId = @CountryId ) 
					AND (dbo.tblClincalReportResult.TeamId = @TeamId ) 
					AND (dbo.tblClincalReportResult.TourId = @TourId) 
					AND (dbo.tblClincalReportResult.YearId = @YearId )
					ORDER BY CAST(dbo.tblClinicalReportAxes.AxesOrder AS INT)

END
GO
