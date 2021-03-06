USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetCampMembers]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetCampMembers]


@YearId			tinyint		=NULL,
@TeamId			smallint	=NULL,
@CampId	smallint			=NULL
--@TeamMemberId	int			=NULL,
--@CountryId	tinyint			=NULL

AS

BEGIN

				SELECT        dbo.tblCampMembers.YearId, dbo.tblCampMembers.TeamId, dbo.tblCampMembers.TeamMemberId, dbo.tblCampMembers.CampId, 
										 dbo.tblTeamMember.TeamMemberNameAr, dbo.tblTeamMember.PassportNumber,
										 dbo.tblTeam.TeamDsecAr
				FROM             dbo.tblCampMembers INNER JOIN
                         dbo.tblTeamMember ON dbo.tblCampMembers.TeamMemberId = dbo.tblTeamMember.TeamMemberId INNER JOIN
                         dbo.tblTeam ON dbo.tblTeamMember.TeamId = dbo.tblTeam.TeamId

				WHERE        (dbo.tblCampMembers.YearId = @YearId) AND (dbo.tblCampMembers.TeamId = @TeamId OR @TeamId IS NULL)  AND 
										 (dbo.tblCampMembers.CampId = @CampId)

END
GO
