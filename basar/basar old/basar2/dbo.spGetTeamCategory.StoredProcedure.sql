USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetTeamCategory]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetTeamCategory]
  @TeamClassId TINYINT =NULL
AS
BEGIN

		SELECT        TOP (100) PERCENT TeamCategoryId, TeamCategoryDsecAr, TeamCategoryDsecEn
			FROM            dbo.tblTeamCategory
			WHERE        (TeamClassId = @TeamClassId) AND (TeamCategoryStatus = 1)
			ORDER BY TeamCategoryOrder


END
GO
