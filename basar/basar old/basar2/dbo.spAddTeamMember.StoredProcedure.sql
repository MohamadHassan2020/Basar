USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spAddTeamMember]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spAddTeamMember]

				@TeamMemberId				int				=NULL,
				@TeamCategoryId				smallint		=NULL,
				@SpecializationId			smallint		=NULL,
				@TeamId						smallint		=NULL,
				@NationalityId				tinyint			=NULL,
				@TeamMemberNameAr			nvarchar(50)	=NULL,
				@TeamMemberNameEn			nvarchar(50)	=NULL,
				@PassportNumber				nvarchar(20)	=NULL,
				@IssuerPlaceAr				nvarchar(50)	=NULL,
				@IssuerPlaceEn				nvarchar(50)	=NULL,
				@DateOfIssue				smalldatetime	=NULL,
				@DateOfBirth				smalldatetime	=NULL,
				@ExpiryDate					smalldatetime	=NULL,
				@TeamMemberStatus			bit				=NULL,
				@AddBy						smallint		=NULL,
				@UpdatedBy					smallint		=NULL,
 				@TeamMemberIdOut			smallint OUT	,
				@MsgOut						NVARCHAR(100) OUT
AS
			BEGIN
			 
										IF NOT EXISTS (SELECT TeamMemberId FROM     dbo.tblTeamMember WHERE    (TeamMemberId = @TeamMemberId))

											BEGIN
			
								INSERT INTO dbo.tblTeamMember (TeamCategoryId, SpecializationId, TeamId, NationalityId,TeamMemberNameAr, TeamMemberNameEn, PassportNumber, 
								IssuerPlaceAr, IssuerPlaceEn, DateOfIssue, DateOfBirth, ExpiryDate, AddBy, CreationDate, UpdatedBy, UpdatedDate,TeamMemberStatus)
							VALUES			( @TeamCategoryId, @SpecializationId, @TeamId,@NationalityId, @TeamMemberNameAr, @TeamMemberNameEn, @PassportNumber, @IssuerPlaceAr, @IssuerPlaceEn, 
                         @DateOfIssue, @DateOfBirth, @ExpiryDate, @AddBy, GETDATE(), @UpdatedBy, GETDATE(),@TeamMemberStatus)
																SELECT @TeamMemberIdOut=SCOPE_IDENTITY()
																SELECT @MsgOut=N'تم الحفظ بنجاح'
												END
											ELSE
												BEGIN
																UPDATE dbo.tblTeamMember SET
																TeamCategoryId=@TeamCategoryId,
																SpecializationId=@SpecializationId,
																TeamId=@TeamId,
																NationalityId=@NationalityId,
																TeamMemberNameEn=@TeamMemberNameEn,
																TeamMemberNameAr=@TeamMemberNameAr,
																PassportNumber=@PassportNumber,
																IssuerPlaceAr=@IssuerPlaceAr,
																IssuerPlaceEn=@IssuerPlaceEn,
																DateOfIssue=@DateOfIssue,
																DateOfBirth=@DateOfBirth,
																ExpiryDate=@ExpiryDate,
																UpdatedBy=@UpdatedBy,
																UpdatedDate=GETDATE(),
																TeamMemberStatus=@TeamMemberStatus
																WHERE TeamMemberId=@TeamMemberId
																SELECT @TeamMemberIdOut =@TeamMemberId
																SELECT @MsgOut=N'تم التعديل بنجاح'
												END
					END
GO
