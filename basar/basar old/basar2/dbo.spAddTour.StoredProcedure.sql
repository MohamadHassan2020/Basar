USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spAddTour]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spAddTour]

				@TourId	smallint			=NULL,
				@TourDsecAr	nvarchar(50)	=NULL,
				@TourDsecEn	nvarchar(50)	=NULL,
				@CreationBy	smallint		=NULL,
				@UpdatedBy	smallint		=NULL,
				@TourOrder	smallint		=NULL,
				@TourStatus	bit				=NULL,
				@TeamId	smallint			=NULL,
				@TourIdOut			tinyint OUT	,
				@MsgOut					NVARCHAR(100) OUT
AS
			BEGIN
			 
										IF NOT EXISTS (SELECT TourId FROM     dbo.tblTour WHERE    (TourId = @TourId))

											BEGIN
			
												INSERT INTO dbo.tblTour (TeamId,TourDsecAr, TourDsecEn, CreationDate, CreationBy, UpdatedDate, UpdatedBy, TourOrder, TourStatus)
										VALUES			(@TeamId,@TourDsecAr, @TourDsecEn, GETDATE(), @CreationBy, GETDATE(), @UpdatedBy, @TourOrder, @TourStatus)
																SELECT @TourIdOut=SCOPE_IDENTITY()
																SELECT @MsgOut=N'تم الحفظ بنجاح'
												END
												ELSE
												BEGIN
																UPDATE dbo.tblTour SET TeamId=@TeamId,
																TourDsecAr=@TourDsecAr,
																TourDsecEn=@TourDsecEn,
																 
																UpdatedDate=GETDATE(),
																UpdatedBy=@UpdatedBy,
																TourOrder=@TourOrder,
																TourStatus=@TourStatus
																WHERE TourId=@TourId
																SELECT @TourIdOut =@TourId
																SELECT @MsgOut=N'تم التعديل بنجاح'
												END
					END
GO
