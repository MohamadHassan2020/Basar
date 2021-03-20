USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetNationalities]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetNationalities]
AS
BEGIN

			SELECT        TOP (100) PERCENT NationalityId, NationalityAr, NationalityEn, NationalityOrder
				FROM            dbo.tblNationality
				WHERE        (NationalityStatus = 1)
				ORDER BY NationalityOrder, NationalityAr

END
GO
