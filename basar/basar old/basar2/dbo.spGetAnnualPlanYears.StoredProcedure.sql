USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetAnnualPlanYears]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetAnnualPlanYears]


AS

BEGIN

			SELECT        dbo.tblYears.YearId, dbo.tblYears.YearNameAr, dbo.tblYears.YearNameEn
			FROM            dbo.tblAnnualPlan INNER JOIN
									 dbo.tblYears ON dbo.tblAnnualPlan.YearId = dbo.tblYears.YearId
			GROUP BY dbo.tblYears.YearId, dbo.tblYears.YearNameAr, dbo.tblYears.YearNameEn

END
GO
