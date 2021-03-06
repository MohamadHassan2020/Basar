USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spAddCamp]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spAddCamp]

				@CampId	smallint			=NULL,
				@CountryId	tinyint			=NULL,
				@CampDsecAr	nvarchar(50)	=NULL,
				@CampDsecEn	nvarchar(50)	=NULL,
				@CreationBy	smallint		=NULL,
				@UpdatedBy	smallint		=NULL,
				@CampOrder	smallint		=NULL,
				@CampStatus	bit				=NULL,
				@CampIdOut		tinyint OUT	,
				@MsgOut					NVARCHAR(100) OUT
AS
			BEGIN
			 
										IF NOT EXISTS (SELECT CampId FROM     dbo.tblCamps WHERE    (CampId = @CampId))

											BEGIN
			
								INSERT INTO dbo.tblCamps (CountryId, CampDsecAr, CampDsecEn, CreationDate, CreationBy, UpdatedDate, UpdatedBy, CampOrder, CampStatus)
							VALUES			(@CountryId, @CampDsecAr, @CampDsecEn, GETDATE(), @CreationBy, GETDATE(), @UpdatedBy, @CampOrder, @CampStatus)
																SELECT @CampIdOut=SCOPE_IDENTITY()
																SELECT @MsgOut=N'تم الحفظ بنجاح'
												END
												ELSE
												BEGIN
																UPDATE dbo.tblCamps SET
																CountryId=@CountryId,
																CampDsecAr=@CampDsecAr,
																CampDsecEn=@CampDsecEn,
																UpdatedDate=GETDATE(),
																UpdatedBy=@UpdatedBy,
																CampOrder=@CampOrder,
																CampStatus=@CampStatus
																WHERE CampId=@CampId
																SELECT @CampIdOut =@CampId
																SELECT @MsgOut=N'تم التعديل بنجاح'
												END
					END
GO
