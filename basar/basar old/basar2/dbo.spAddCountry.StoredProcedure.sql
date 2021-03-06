USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spAddCountry]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spAddCountry]

				@CountryId	tinyint	=NULL,
				@TeamId	smallint		=NULL,
				@TourId	smallint		=NULL,
				@CountryDsecAr	nvarchar(50)		=NULL,
				@CountryDsecEn	nvarchar(50)		=NULL,
				@CreationBy	smallint		=NULL,
				@UpdatedBy	smallint		=NULL,
				@CountryOrder	tinyint		=NULL,
				@CountryStatus	bit		=NULL,
				@CountryIdOut		tinyint OUT	,
				@MsgOut					NVARCHAR(100) OUT
AS
			BEGIN
			 
										IF NOT EXISTS (SELECT CountryId FROM     dbo.tblCountries WHERE    (CountryId = @CountryId))

											BEGIN
			
												INSERT INTO dbo.tblCountries (TourId, CountryDsecAr, CountryDsecEn, CreationDate, CreationBy, UpdatedDate, UpdatedBy, CountryOrder, CountryStatus)
												VALUES			( @TourId, @CountryDsecAr, @CountryDsecEn, GETDATE(), @CreationBy, GETDATE(), @UpdatedBy, @CountryOrder, @CountryStatus)
																SELECT @CountryIdOut=SCOPE_IDENTITY()
																SELECT @MsgOut=N'تم الحفظ بنجاح'
												END
												ELSE
												BEGIN
																UPDATE dbo.tblCountries SET 
																TourId=@TourId,
																CountryDsecAr=@CountryDsecAr,
																CountryDsecEn=@CountryDsecEn,
																UpdatedDate=GETDATE(),
																UpdatedBy=@UpdatedBy,
																CountryOrder=@CountryOrder,
																CountryStatus=@CountryStatus
																WHERE CountryId=@CountryId
																SELECT @CountryIdOut =@CountryId
																SELECT @MsgOut=N'تم التعديل بنجاح'
												END
					END
GO
