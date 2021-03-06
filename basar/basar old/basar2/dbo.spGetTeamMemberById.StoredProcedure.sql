USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetTeamMemberById]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC  [dbo].[spGetTeamMemberById] 
@TeamMemberId INT =NULL
AS

BEGIN

SELECT        TOP (1) dbo.tblTeamMember.TeamCategoryId, dbo.tblTeamMember.SpecializationId, dbo.tblTeamMember.TeamId, dbo.tblTeamMember.NationalityId, dbo.tblTeamMember.TeamMemberNameAr, 
                         dbo.tblTeamMember.TeamMemberNameEn, dbo.tblTeamMember.PassportNumber, dbo.tblTeamMember.IssuerPlaceAr, dbo.tblTeamMember.IssuerPlaceEn, FORMAT(dbo.tblTeamMember.DateOfIssue, 'yyyy-MM-dd') 
                         AS DateOfIssueStr, FORMAT(dbo.tblTeamMember.DateOfBirth, 'yyyy-MM-dd') AS DateOfBirthStr, FORMAT(dbo.tblTeamMember.ExpiryDate, 'yyyy-MM-dd') AS ExpiryDateStr, dbo.tblTeamMember.DateOfIssue, 
                         dbo.tblTeamMember.DateOfBirth, dbo.tblTeamMember.ExpiryDate, dbo.tblTeamMember.TeamMemberStatus, dbo.tblTeamCategory.TeamClassId
FROM            dbo.tblTeamMember LEFT OUTER JOIN
                         dbo.tblTeamCategory ON dbo.tblTeamMember.TeamCategoryId = dbo.tblTeamCategory.TeamCategoryId
WHERE        (dbo.tblTeamMember.TeamMemberId = @TeamMemberId)

END
GO
