USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetCamps]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetCamps] 
@CountryId TINYINT =NULL
AS
BEGIN

			SELECT        TOP (100) PERCENT CampId, CampDsecAr, CampDsecEn, CampOrder, CampStatus
				FROM            dbo.tblCamps
				WHERE        (CampStatus = 1) AND (CountryId = @CountryId)
				ORDER BY CampOrder

END
GO
