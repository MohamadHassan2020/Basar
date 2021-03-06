USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetAnnualPlanTour]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetAnnualPlanTour]

			@YearId			tinyint		=null
AS

BEGIN

			SELECT        dbo.tblTour.TourId, dbo.tblTour.TourDsecAr, dbo.tblTour.TourDsecEn
				FROM            dbo.tblAnnualPlan INNER JOIN
										 dbo.tblTour ON dbo.tblAnnualPlan.TourId = dbo.tblTour.TourId
				WHERE        (dbo.tblAnnualPlan.YearId = @YearId)
				GROUP BY dbo.tblTour.TourId, dbo.tblTour.TourDsecAr, dbo.tblTour.TourDsecEn

END
GO
