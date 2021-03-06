USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetTeams]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetTeams]
 @TourId tinyint =null
AS
BEGIN

		SELECT        TOP (100) PERCENT dbo.tblTeam.TeamDsecAr, dbo.tblTeam.TeamDsecEn, dbo.tblTeam.TeamId
FROM            dbo.tblTeam LEFT OUTER JOIN
                         dbo.tblTour ON dbo.tblTeam.TeamId = dbo.tblTour.TeamId
WHERE        (dbo.tblTeam.TeamStatus = 1) AND (ISNULL(CAST(@TourId AS NVARCHAR), N'NULL') IN (CAST(dbo.tblTour.TourId AS NVARCHAR), 'NULL'))
GROUP BY dbo.tblTeam.TeamDsecAr, dbo.tblTeam.TeamDsecEn, dbo.tblTeam.TeamId, dbo.tblTeam.TeamOrder
ORDER BY dbo.tblTeam.TeamOrder


END
GO
