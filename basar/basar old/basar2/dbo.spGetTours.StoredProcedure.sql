USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetTours]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetTours]

AS
BEGIN

			SELECT        TOP (100) PERCENT TourId, TourDsecAr, TourDsecEn, TourOrder, TourStatus
			FROM            dbo.tblTour
			WHERE        (TourStatus = 1)
			ORDER BY TourOrder,TourDsecAr

END
GO
