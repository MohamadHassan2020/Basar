USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetTeamClass]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetTeamClass]
  
AS
BEGIN

		SELECT        TOP (100) PERCENT TeamClassId, TeamClassDsecAr, TeamClassDsecEn
					FROM            dbo.tblTeamClass
					WHERE        (TeamClassStatus = 1)
					ORDER BY TeamClassOrder


END
GO
