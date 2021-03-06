USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetCountries]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetCountries]
@TourId SMALLINT =NULL
AS
BEGIN
				

				SELECT    DISTINCT     TOP (100) PERCENT dbo.tblCountries.CountryId, dbo.tblCountries.CountryDsecEn, dbo.tblCountries.CountryOrder, dbo.tblCountries.CountryDsecAr
FROM            dbo.tblCountries LEFT OUTER JOIN
                         dbo.tblTourCountry ON dbo.tblCountries.CountryId = dbo.tblTourCountry.CountryId
WHERE        (dbo.tblCountries.CountryStatus = 1) AND (dbo.tblTourCountry.TourId = @TourId) OR
                         (dbo.tblCountries.CountryStatus = 1) AND (@TourId IS NULL)
ORDER BY dbo.tblCountries.CountryOrder ,dbo.tblCountries.CountryDsecAr

END
GO
