USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetAllCamps]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetAllCamps]


AS


BEGIN

			SELECT        TOP (100) PERCENT CampId, CampDsecAr
			FROM            dbo.tblCamps
			WHERE        (ISNULL(CampStatus,0) = 1)
			ORDER BY CampOrder, CampDsecAr


END
GO
