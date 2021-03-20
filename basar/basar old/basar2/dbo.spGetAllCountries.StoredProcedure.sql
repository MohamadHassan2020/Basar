USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetAllCountries]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetAllCountries]

AS
BEGIN

		SELECT        TOP (100) PERCENT CountryId, CountryDsecAr
		FROM            dbo.tblCountries
		WHERE        (ISNULL(CountryStatus,0) = 1)
		ORDER BY CountryOrder

END
GO
