USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spAddTeam]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spAddTeam]

				@TeamId	smallint	=NULL,
				@TeamDsecAr	nvarchar(50)	=NULL,
				@TeamDsecEn	nvarchar(50)	=NULL,
 				@CreationBy	smallint		=NULL,
				@UpdatedBy	smallint		=NULL,
				@TeamOrder	smallint		=NULL,
				@TeamStatus	bit				=NULL,
				@TeamIdOut		smallint OUT	,
				@MsgOut					NVARCHAR(100) OUT
AS
			BEGIN
			 
										IF NOT EXISTS (SELECT TeamId FROM     dbo.tblTeam WHERE    (TeamId = @TeamId))

											BEGIN
			
								INSERT INTO dbo.tblTeam (TeamDsecAr, TeamDsecEn, CreationDate, CreationBy, UpdatedDate, UpdatedBy, TeamOrder, TeamStatus)
							VALUES			( @TeamDsecAr, @TeamDsecEn, GETDATE(), @CreationBy, GETDATE(), @UpdatedBy, @TeamOrder, @TeamStatus)
																SELECT @TeamIdOut=SCOPE_IDENTITY()
																SELECT @MsgOut=N'تم الحفظ بنجاح'
												END
												ELSE
												BEGIN
																UPDATE dbo.tblTeam SET
																TeamDsecAr=@TeamDsecAr,
																TeamDsecEn=@TeamDsecEn,
																UpdatedDate=GETDATE(),
																UpdatedBy=@UpdatedBy,
																TeamOrder=@TeamOrder,
																TeamStatus=@TeamStatus
																WHERE TeamId=@TeamId
																SELECT @TeamIdOut =@TeamId
																SELECT @MsgOut=N'تم التعديل بنجاح'
												END
					END
GO
