USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetToursExists]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spGetToursExists]

@TeamId TINYINT =NULL

AS

BEGIN


SELECT        TOP (100) PERCENT dbo.tblTour.TourId, dbo.tblTour.TeamId, dbo.tblTour.TourDsecAr, dbo.tblTour.TourDsecEn, dbo.tblTour.TourStatus, dbo.tblTour.TourOrder,
 dbo.tblTeam.TeamDsecAr,dbo.tblTeam.TeamFlag
FROM            dbo.tblTour LEFT OUTER JOIN
                         dbo.tblTeam ON dbo.tblTour.TeamId = dbo.tblTeam.TeamId
WHERE        (dbo.tblTour.TeamId = @TeamId) OR
                         (@TeamId IS NULL)
ORDER BY dbo.tblTour.TourOrder, dbo.tblTour.TourDsecAr, dbo.tblTour.TourDsecEn



END
GO
