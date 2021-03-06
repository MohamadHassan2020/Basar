USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetTeamMember]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spGetTeamMember]

AS

BEGIN


SELECT        dbo.tblTeamMember.TeamMemberId, dbo.tblTeamMember.TeamCategoryId, dbo.tblTeamMember.SpecializationId, dbo.tblTeamMember.TeamId, 
                         dbo.tblTeamMember.TeamMemberNameAr, dbo.tblTeamMember.TeamMemberNameEn, dbo.tblTeamMember.PassportNumber, dbo.tblTeamMember.IssuerPlaceAr, 
                         dbo.tblTeamMember.IssuerPlaceEn, dbo.tblTeamMember.DateOfIssue, dbo.tblTeamMember.DateOfBirth, dbo.tblTeamMember.ExpiryDate, 
                         dbo.tblTeamMember.AddBy, dbo.tblTeamMember.CreationDate, dbo.tblTeamMember.UpdatedBy, dbo.tblTeamMember.UpdatedDate, 
                         dbo.tblTeamCategory.TeamCategoryDsecAr, dbo.tblTeamClass.TeamClassDsecAr, dbo.tblTeam.TeamDsecAr, dbo.tblSpecialization.SpecializationDsecAr, 
                         dbo.tblTeamMember.TeamMemberStatus
FROM            dbo.tblTeamMember INNER JOIN
                         dbo.tblTeamCategory ON dbo.tblTeamMember.TeamCategoryId = dbo.tblTeamCategory.TeamCategoryId INNER JOIN
                         dbo.tblTeam ON dbo.tblTeamMember.TeamId = dbo.tblTeam.TeamId INNER JOIN
                         dbo.tblSpecialization ON dbo.tblTeamMember.SpecializationId = dbo.tblSpecialization.SpecializationId INNER JOIN
                         dbo.tblTeamClass ON dbo.tblTeamCategory.TeamClassId = dbo.tblTeamClass.TeamClassId

END
GO
