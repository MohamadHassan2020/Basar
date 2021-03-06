USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spAddSponsor]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spAddSponsor]

				@SponsorId			smallint			=NULL,
				@SponsorDsecAr		nvarchar(50)		=NULL,
				@SponsorDsecEn		nvarchar(50)		=NULL,
				@CreationBy			smallint			=NULL,
				@UpdatedBy			smallint			=NULL,
				@SponsorOrder		smallint			=NULL,
				@SponsorStatus		bit					=NULL,
				@SponsorIdOut		smallint OUT	,
				@MsgOut					NVARCHAR(100) OUT
AS
			BEGIN
			 
										IF NOT EXISTS (SELECT SponsorId FROM     dbo.tblSponsors WHERE    (SponsorId = @SponsorId))

											BEGIN
			
								INSERT INTO dbo.tblSponsors (SponsorDsecAr, SponsorDsecEn, CreationDate, CreationBy, UpdatedDate, UpdatedBy, SponsorOrder, SponsorStatus)
							VALUES			(@SponsorDsecAr, @SponsorDsecEn, GETDATE(), @CreationBy, GETDATE(), @UpdatedBy, @SponsorOrder, @SponsorStatus)
																SELECT @SponsorIdOut=SCOPE_IDENTITY()
																SELECT @MsgOut=N'تم الحفظ بنجاح'
												END
												ELSE
												BEGIN
																UPDATE dbo.tblSponsors SET
																SponsorDsecAr=@SponsorDsecAr,
																SponsorDsecEn=@SponsorDsecEn,
																UpdatedDate=GETDATE(),
																UpdatedBy=@UpdatedBy,
																SponsorOrder=@SponsorOrder,
																SponsorStatus=@SponsorStatus
																WHERE SponsorId=@SponsorId
																SELECT @SponsorIdOut =@SponsorId
																SELECT @MsgOut=N'تم التعديل بنجاح'
												END
					END
GO
