USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetCampStatus]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetCampStatus]


AS

BEGIN


		SELECT      CampStatusId,  CampStatusDescAR, CampStatusEnabled, CampStatusOrder, CampStatusImage
		FROM            dbo.tblCampStatus
		ORDER BY CampStatusOrder DESC


END
GO
