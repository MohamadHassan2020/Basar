USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetLoginAuthentication]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetLoginAuthentication] 



	@UserCode		nvarchar(20)		=NULL,
	@UserPassword	nvarchar(100)		=NULL

	AS

		BEGIN

					SELECT        UserId, UserName, UserPassword, UserEmail, UserCode, CreationDate, CreationBy, UpdatedDate, UpdatedBy, 1 AS Authenticated, 
					ISNULL(OutlineStatus,0) AS IsOutlineStatus, ISNULL(AdminStatus,0) AS IsAdminStatus , ISNULL(TeamStatus,0) AS IsTeamStatus,
					ISNULL(IsHome,0) AS IsHome,ISNULL(IsArchive,0) AS IsArchive,ISNULL(IsReported,0) AS IsReported
					FROM            dbo.tblUsers
					WHERE        (UserCode = @UserCode) AND (UserPassword = @UserPassword)
		END
GO
