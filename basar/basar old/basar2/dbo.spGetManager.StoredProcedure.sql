USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetManager]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetManager]

	@ManagerType	varchar(1)	=NULL
AS


BEGIN

				SELECT        TOP (100) PERCENT ManagerId, ManagerName, ManagerNameEN
				FROM            dbo.tblManager
				WHERE        (ManagerType = @ManagerType)
							AND (ISNULL(ManagerStatus,0)=1)
ORDER BY ManagerOrder

END
GO
