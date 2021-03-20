USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetTeamMemberByTeam]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetTeamMemberByTeam]

@TeamId		smallint =null
AS

BEGIN

			SELECT        TOP (100) PERCENT TeamMemberId, TeamMemberNameAr
			FROM            dbo.tblTeamMember
			WHERE        (TeamId = @TeamId)
			ORDER BY TeamMemberStatus

END
GO
