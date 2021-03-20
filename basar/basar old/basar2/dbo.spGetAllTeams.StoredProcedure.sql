USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetAllTeams]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetAllTeams]


AS

BEGIN

			SELECT        TOP (100) PERCENT TeamId, TeamDsecAr
			FROM            dbo.tblTeam
			WHERE        (TeamStatus = 1)
			ORDER BY TeamOrder, TeamDsecAr

END
GO
