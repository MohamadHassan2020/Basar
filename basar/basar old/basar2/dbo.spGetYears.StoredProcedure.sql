USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetYears]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetYears]

AS
BEGIN

			SELECT        TOP (100) PERCENT YearId, YearNameAr, YearStatus, YearOrder
			FROM            dbo.tblYears
			WHERE        (YearStatus = 1)
			ORDER BY YearOrder

END
GO
