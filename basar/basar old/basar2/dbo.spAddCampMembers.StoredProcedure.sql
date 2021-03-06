USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spAddCampMembers]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spAddCampMembers]

@CampMembersId		int			=null,
@TeamMemberId		int			=null,
@YearId				tinyint		=null,
@TeamId				smallint	=null,
@CampId				smallint	=null,
@CountryId			tinyint		=null,
@AddBy				smallint	=null,
@UpdatedBy			smallint	=null,
@MsgOut				nvarchar(100) out

AS

BEGIN

IF NOT EXISTS (SELECT        CampMembersId FROM  dbo.tblCampMembers WHERE        (TeamId = @TeamId) 
		AND (CampId = @CampId) AND (YearId = @YearId) AND (CountryId = @CountryId) AND (TeamMemberId = @TeamMemberId))
		BEGIN

		INSERT INTO dbo.tblCampMembers ( YearId, TeamId, TeamMemberId, CampId, CountryId, CreationDate, AddBy, UpdatedDate, UpdatedBy)
					VALUES	(@YearId, @TeamId, @TeamMemberId, @CampId, @CountryId, GETDATE(), @AddBy, GETDATE(), @UpdatedBy)
					SELECT @MsgOut=N'تم الحفظ';
		END
ELSE
BEGIN

			UPDATE dbo.tblCampMembers SET 
			UpdatedDate=GETDATE(),
			UpdatedBy=@UpdatedBy
			WHERE        (TeamId = @TeamId) 
					AND (CampId = @CampId) AND (YearId = @YearId) AND (CountryId = @CountryId) AND (TeamMemberId = @TeamMemberId)
					SELECT @MsgOut=N'تم التحديث';
END

END
GO
