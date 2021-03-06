USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spAddClincalReportResult]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spAddClincalReportResult]

			@YearId				tinyint			=NULL,
			@TourId				smallint		=NULL,
			@TeamId				smallint		=NULL,
			@CountryId			tinyint			=NULL,
			@CampId				smallint		=NULL,
			@CreationBy			smallint		=NULL,
			@UpdatedBy			smallint		=NULL,
			-----
			@AxesId				smallint		=NULL,
			@MaleAxes			int				=NULL,
			@FemaleAxes			int				=NULL,
			@AxesNote			nvarchar(100)	=NULL
		------

AS


BEGIN

IF NOT EXISTS(SELECT        YearId FROM            dbo.tblClincalReportResult WHERE        (AxesId = @AxesId) AND (CampId = @CampId) AND (CountryId = @CountryId) AND (TeamId = @TeamId) AND (TourId = @TourId) AND (YearId = @YearId))
		BEGIN
		INSERT INTO dbo.tblClincalReportResult (YearId, TourId, TeamId, CountryId, CampId, AxesId, MaleAxes, FemaleAxes,AxesNote, CreationDate, CreationBy)
												VALUES(@YearId, @TourId, @TeamId, @CountryId, @CampId, @AxesId, @MaleAxes, @FemaleAxes,@AxesNote, GETDATE(), @CreationBy)
		END
		ELSE
		BEGIN
		UPDATE dbo.tblClincalReportResult SET MaleAxes=@MaleAxes,
												FemaleAxes=@FemaleAxes,
												AxesNote=@AxesNote,
												UpdatedDate=GETDATE(),
												UpdatedBy=@UpdatedBy
										WHERE (AxesId = @AxesId) AND (CampId = @CampId) AND (CountryId = @CountryId) AND (TeamId = @TeamId) AND (TourId = @TourId) AND (YearId = @YearId)
		END
END

GO
