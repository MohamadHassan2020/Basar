USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spAddBannerAttachment]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spAddBannerAttachment]


	 
			@CampId				smallint		=NULL,
			@CountryId			tinyint			=NULL,
			@TourId				smallint		=NULL,
			@YearId				tinyint			=NULL,
			@AddBy				smallint		=NULL,
			@UpdatedBy			smallint		=NULL,
			@BannerFileName		nvarchar(100)	=NULL,
			@BannerFilePath		nvarchar(500)	=NULL
AS

BEGIN



IF NOT EXISTS (SELECT BannerAttachmentId FROM  dbo.tblBannerAttachment 
WHERE   (YearId = @YearId) 
AND (TourId = @TourId) 
AND (CountryId = @CountryId) 
AND (CampId = @CampId)
AND (BannerFileName=@BannerFileName))

BEGIN
													DECLARE @BannerAttachmentId	int
													SELECT   @BannerAttachmentId= ISNULL (MAX(BannerAttachmentId),0)+1 FROM            dbo.tblBannerAttachment


													INSERT INTO dbo.tblBannerAttachment (BannerAttachmentId, CampId, CountryId, TourId, YearId, CreationDate, AddBy, BannerFileName, BannerFilePath)
													VALUES (@BannerAttachmentId,@CampId, @CountryId, @TourId, @YearId, GETDATE(), @AddBy, @BannerFileName, @BannerFilePath)

END

END
GO
