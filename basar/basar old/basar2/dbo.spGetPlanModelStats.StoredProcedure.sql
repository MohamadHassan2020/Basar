USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetPlanModelStats]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetPlanModelStats]

AS

BEGIN

SELECT        TotalCamps, YearNameEn, YearId
FROM            dbo.vwGetTotalCamps

END
GO
