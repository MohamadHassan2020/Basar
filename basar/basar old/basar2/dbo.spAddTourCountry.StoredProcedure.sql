USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spAddTourCountry]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spAddTourCountry]

				@TourCountryId		smallint	=NULL,
				@TourId				smallint	=NULL,
				@CountryId			tinyint		=NULL,
				@AddBy				smallint	=NULL,
				@TourCountryStatus	bit			=NULL,
				@UpdatedBy			smallint	=NULL,
				@MsgOut				NVARCHAR(100) OUT
AS
			BEGIN
			 
										IF NOT EXISTS (SELECT TourCountryId FROM   dbo.tblTourCountry WHERE     (CountryId = @CountryId) AND (TourId = @TourId))

											BEGIN
												SELECT   @TourCountryId= ISNULL (MAX(TourCountryId),0)+1 FROM            dbo.tblTourCountry 


								INSERT  INTO dbo.tblTourCountry (TourCountryId, TourId, CountryId, CreationDate, AddBy, TourCountryStatus)
										VALUES			(@TourCountryId, @TourId, @CountryId, GETDATE(), @AddBy, @TourCountryStatus)
																SELECT @MsgOut=N'تم الحفظ بنجاح'
												END
												ELSE
												BEGIN
																UPDATE dbo.tblTourCountry SET
																TourCountryStatus=@TourCountryStatus,
																UpdatedDate=GETDATE(),
																UpdatedBy=@UpdatedBy
																WHERE
																(CountryId = @CountryId) AND (TourId = @TourId)
																SELECT @MsgOut=N'تم التعديل بنجاح'
												END
					END
GO
