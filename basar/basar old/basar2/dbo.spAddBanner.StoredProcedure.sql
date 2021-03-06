USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spAddBanner]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spAddBanner]


	 
			@CampId				smallint		=NULL,
			@CountryId			tinyint			=NULL,
			@TourId				smallint		=NULL,
			@YearId				tinyint			=NULL,
			@AddBy				smallint		=NULL,
			@UpdatedBy			smallint		=NULL,
			@BannerDesc			nvarchar(100)	=NULL,
			@BannerStatus		BIT				=NULL,
			@MsgOut				NVARCHAR(100)	OUT


AS

BEGIN


IF   EXISTS (SELECT BannerAttachmentId FROM  dbo.tblBannerAttachment 
					WHERE   (YearId = @YearId) 
					AND (TourId = @TourId) 
					AND (CountryId = @CountryId) 
					AND (CampId = @CampId))
 
BEGIN


IF NOT EXISTS (SELECT BannerId FROM  dbo.tblBanner  WHERE   (YearId = @YearId)  AND (TourId = @TourId)  AND (CountryId = @CountryId)  AND (CampId = @CampId))

		BEGIN
															DECLARE @BannerId	int
															SELECT   @BannerId= ISNULL (MAX(BannerId),0)+1 FROM            dbo.tblBanner


															INSERT INTO dbo.tblBanner (BannerId, CampId, CountryId, TourId, YearId, CreationDate, AddBy, BannerDesc, BannerStatus)
															VALUES (@BannerId,@CampId, @CountryId, @TourId, @YearId, GETDATE(), @AddBy, @BannerDesc, @BannerStatus)
															SELECT @MsgOut=N'تم الحفظ بنجاح'
		END
		ELSE
		BEGIN

		IF  EXISTS (SELECT BannerId FROM  dbo.tblBanner  WHERE   (YearId = @YearId)  AND (TourId = @TourId)  AND (CountryId = @CountryId)  AND (CampId = @CampId)
				AND ISNULL(BannerStatus,0)=0)
					BEGIN

							 ------CHECK APPROVED BANNER
									IF @BannerStatus=0
									BEGIN

																	UPDATE dbo.tblBanner SET 
																	BannerDesc=@BannerDesc,
																	BannerStatus=@BannerStatus,
																	UpdatedDate=GETDATE(),
																	UpdatedBy=@UpdatedBy
																	WHERE   (YearId = @YearId)  AND (TourId = @TourId)  AND (CountryId = @CountryId)  AND (CampId = @CampId)
																	SELECT @MsgOut=N'تم التعديل بنجاح'
									END
									ELSE

									BEGIN

																	UPDATE dbo.tblBanner SET 
																	BannerDesc=@BannerDesc,
																	BannerStatus=@BannerStatus,
																	UpdatedDate=GETDATE(),
																	ApprovedDate=GETDATE(),
																	ApprovedBy=@UpdatedBy,
																	ApprovedStatus=@BannerStatus,
																	UpdatedBy=@UpdatedBy
																	WHERE   (YearId = @YearId)  AND (TourId = @TourId)  AND (CountryId = @CountryId)  AND (CampId = @CampId)
																	SELECT @MsgOut=N'تم اعتماد البنر بشكل نهائي'
									END
					END
					ELSE
					BEGIN
						SELECT @MsgOut=N'تمت الموافقة على البنر من قبل بشكل نهائي'
					END
					

		
		END

END
ELSE
BEGIN

SELECT @MsgOut=N'يجب تحميل البنر قبل ارساله للطباعة'

END

END
GO
