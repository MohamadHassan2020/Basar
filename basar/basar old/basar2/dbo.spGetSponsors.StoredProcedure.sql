USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetSponsors]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetSponsors]

AS
BEGIN

			SELECT        TOP (100) PERCENT SponsorId, SponsorDsecAr, SponsorDsecEn, SponsorOrder, SponsorStatus
				FROM            dbo.tblSponsors
				WHERE        (SponsorStatus = 1)
				ORDER BY SponsorOrder

END
GO
