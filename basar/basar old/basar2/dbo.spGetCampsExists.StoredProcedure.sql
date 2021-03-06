USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetCampsExists]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spGetCampsExists]


@CountryId TINYINT=NULL
AS

BEGIN

SELECT        TOP (100) PERCENT dbo.tblCamps.CampId, dbo.tblCamps.CountryId, dbo.tblCamps.CampDsecAr, dbo.tblCamps.CampDsecEn, dbo.tblCamps.CreationDate, dbo.tblCamps.CampStatus, dbo.tblCountries.CountryDsecAr, 
                         dbo.tblCamps.CampOrder
FROM            dbo.tblCamps INNER JOIN
                         dbo.tblCountries ON dbo.tblCamps.CountryId = dbo.tblCountries.CountryId
WHERE        (dbo.tblCamps.CountryId = @CountryId OR @CountryId  IS NULL)
ORDER BY dbo.tblCamps.CampOrder, dbo.tblCamps.CampDsecAr


END
GO
