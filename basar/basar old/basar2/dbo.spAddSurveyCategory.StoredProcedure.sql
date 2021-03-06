USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spAddSurveyCategory]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spAddSurveyCategory]

				@SurveyCategoryId	tinyint				=NULL,
				@SurveyCategoryDescAr	nvarchar(50)	=NULL,
				@SurveyCategoryDescEn	nvarchar(50)	=NULL,
				@SurveyCategoryStatus	bit				=NULL,
				@SurveyCategoryOrder	tinyint			=NULL,
				@CreationBy	smallint					=NULL,
				@UpdatedBy	smallint					=NULL,
				@SurveyCategoryIdOut			tinyint OUT	,
				@MsgOut					NVARCHAR(100) OUT
AS
			BEGIN
			 
										IF NOT EXISTS (SELECT SurveyCategoryId FROM     dbo.tblSurveyCategory WHERE    (SurveyCategoryId = @SurveyCategoryId))

											BEGIN
			
												INSERT INTO dbo.tblSurveyCategory (SurveyCategoryDescAr, SurveyCategoryDescEn, SurveyCategoryStatus, SurveyCategoryOrder, CreationDate, CreationBy, UpdatedDate, UpdatedBy)
										VALUES			(@SurveyCategoryDescAr, @SurveyCategoryDescEn, @SurveyCategoryStatus, @SurveyCategoryOrder, GETDATE(), @CreationBy, GETDATE(), @UpdatedBy)
																SELECT @SurveyCategoryIdOut=SCOPE_IDENTITY()
																SELECT @MsgOut=N'تم الحفظ بنجاح'
												END
												ELSE
												BEGIN
																UPDATE dbo.tblSurveyCategory SET SurveyCategoryDescAr=@SurveyCategoryDescAr,
																SurveyCategoryDescEn=@SurveyCategoryDescEn,
																SurveyCategoryStatus=@SurveyCategoryStatus,
																 SurveyCategoryOrder=@SurveyCategoryOrder,
																UpdatedDate=GETDATE(),
																UpdatedBy=@UpdatedBy
																WHERE SurveyCategoryId=@SurveyCategoryId
																SELECT @SurveyCategoryIdOut =@SurveyCategoryId
																SELECT @MsgOut=N'تم التعديل بنجاح'
												END
					END
GO
