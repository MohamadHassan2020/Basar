USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetUserById]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetUserById] 
	@UserId	smallint 	=NULL
	AS

		BEGIN

				SELECT        UserId, UserName, UserPassword, UserEmail, UserCode, CreationDate, CreationBy, UpdatedDate, UpdatedBy
					FROM            dbo.tblUsers
					WHERE        (UserId = @UserId)


		END
GO
