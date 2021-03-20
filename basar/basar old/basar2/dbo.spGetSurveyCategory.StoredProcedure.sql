USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetSurveyCategory]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetSurveyCategory]
 
AS
BEGIN

			SELECT        TOP (100) PERCENT SurveyCategoryId, SurveyCategoryDescAr, SurveyCategoryDescEn
FROM            dbo.tblSurveyCategory
WHERE        (SurveyCategoryStatus = 1)
ORDER BY SurveyCategoryOrder

END
GO
