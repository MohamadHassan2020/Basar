USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spAddCampClinicalReport]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spAddCampClinicalReport]

			@YearId				tinyint			=NULL,
			@TourId				smallint		=NULL,
			@TeamId				smallint		=NULL,
			@CountryId			tinyint			=NULL,
			@CampId				smallint		=NULL,
			@ManagerId			smallint		=NULL,
			@ChiefSurgeonId		smallint		=NULL,
			@CampReportNote		nvarchar(500)	=NULL,
			@InvolvedAgencies	nvarchar(100)	=NULL,
			@CreationBy			smallint		=NULL,
			@UpdatedBy			smallint		=NULL

AS


BEGIN
BEGIN -------PARRENT
IF NOT EXISTS (SELECT        YearId FROM            dbo.tblCampClinicalReport WHERE        (YearId = @YearId) AND (TourId = @TourId) AND (TeamId = @TeamId) AND (CampId = @CampId) AND (CountryId = @CountryId))

BEGIN


		INSERT INTO dbo.tblCampClinicalReport (YearId, TourId, TeamId, CountryId, CampId, ManagerId, ChiefSurgeonId, InvolvedAgencies,CampReportNote, CreationDate, CreationBy)
						VALUES(@YearId, @TourId, @TeamId, @CountryId, @CampId, @ManagerId, @ChiefSurgeonId, @InvolvedAgencies,@CampReportNote, GETDATE(), @CreationBy)

END
ELSE
BEGIN
			UPDATE dbo.tblCampClinicalReport SET ManagerId=@ManagerId,
											ChiefSurgeonId=@ChiefSurgeonId,
											InvolvedAgencies=@InvolvedAgencies,
											CampReportNote=@CampReportNote,
											UpdatedDate=GETDATE(),
											UpdatedBy=@UpdatedBy
											 WHERE        (YearId = @YearId) AND (TourId = @TourId) AND (TeamId = @TeamId) AND (CampId = @CampId) AND (CountryId = @CountryId)

END  -------------------PARRENT
END
 END
GO
