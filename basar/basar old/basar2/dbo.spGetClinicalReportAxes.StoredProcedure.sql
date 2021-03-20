USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetClinicalReportAxes]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetClinicalReportAxes]

			 

AS

BEGIN

					 

			SELECT        AxesName, AxesId, AxesEN, AxesOrder, AxesStatus,'' AS MaleAxes,'' AS FemaleAxes,'' AS AxesNote
			FROM            dbo.tblClinicalReportAxes
				WHERE ISNULL(AxesStatus,0)=1 ORDER BY AxesOrder 

END
GO
