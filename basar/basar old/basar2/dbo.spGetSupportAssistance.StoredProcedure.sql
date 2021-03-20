USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetSupportAssistance]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetSupportAssistance]

 AS

BEGIN

			SELECT        TOP (100) PERCENT SupportAssistanceId, SupportAssistanceDsecAr, SupportAssistanceDsecEn, SupportAssistanceOrder, SupportAssistanceStatus
				FROM            dbo.tblSupportAssistance
				WHERE        (SupportAssistanceStatus = 1)
				ORDER BY SupportAssistanceOrder


END
GO
