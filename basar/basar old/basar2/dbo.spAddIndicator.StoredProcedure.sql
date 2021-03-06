USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spAddIndicator]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spAddIndicator]

				@IndicatorId	smallint			=NULL,
				@IndicatorNumber	int				=NULL,
				@SurveyCategoryId	tinyint	=NULL,
				@IndicatorDescAr	nvarchar(100)	=NULL,
				@IndicatorDescEn	nvarchar(100)	=NULL,
				@IndicatorStatus	bit	=NULL,
				@IndicatorOrder	tinyint	=NULL,
				@CreationBy	smallint	=NULL,
				@IndicatorDivider	bit	=NULL,
				@UpdatedBy	smallint	=NULL,
				@IndicatorIdOut			tinyint OUT	,
				@MsgOut					NVARCHAR(100) OUT
AS
			BEGIN
			 
										IF NOT EXISTS (SELECT IndicatorId FROM    dbo.tblIndicator WHERE    (IndicatorId = @IndicatorId))

											BEGIN
			
												INSERT INTO dbo.tblIndicator (IndicatorNumber, SurveyCategoryId, IndicatorDescAr, IndicatorDescEn, IndicatorStatus, IndicatorOrder, CreationDate, CreationBy, UpdatedDate, 
															IndicatorDivider, UpdatedBy)
										VALUES			(@IndicatorNumber, @SurveyCategoryId, @IndicatorDescAr, @IndicatorDescEn, @IndicatorStatus, @IndicatorOrder, GETDATE(), @CreationBy, GETDATE(), 
															@IndicatorDivider, @UpdatedBy)
																SELECT @IndicatorIdOut=SCOPE_IDENTITY()
																SELECT @MsgOut=N'تم الحفظ بنجاح'
												END
												ELSE
												BEGIN
																UPDATE dbo.tblIndicator SET IndicatorNumber=@IndicatorNumber,
																SurveyCategoryId=@SurveyCategoryId,
																IndicatorDescAr=@IndicatorDescAr,
																 IndicatorDescEn=@IndicatorDescEn,
																 IndicatorStatus=@IndicatorStatus,
																 IndicatorOrder=@IndicatorOrder,
																 IndicatorDivider=@IndicatorDivider,
																	UpdatedDate=GETDATE(),
																	UpdatedBy=@UpdatedBy
																WHERE IndicatorId=@IndicatorId
																SELECT @IndicatorIdOut =@IndicatorId
																SELECT @MsgOut=N'تم التعديل بنجاح'
												END
					END
GO
