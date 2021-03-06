USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spAddUsers]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spAddUsers]

		@UserId	smallint	=NULL,
		@UserName	nvarchar(50)	=NULL,
		@UserPassword	nvarchar(100)	=NULL,
		@UserEmail	nvarchar(100)	=NULL,
		@UserCode	nvarchar(20)	=NULL,
		@CreationBy	smallint	=NULL,
		@UpdatedBy	smallint	=NULL

AS 

	BEGIN

		DECLARE @Count			TINYINT
		DECLARE @ReturnCode		INT
		SELECT @Count=COUNT(UserCode) from tblUsers where UserCode=@UserCode
		if(@Count>0)
		BEGIN
				set @ReturnCode=-1
		END
		else
		BEGIN
			set @ReturnCode=1
			INSERT INTO tblUsers (UserName, UserPassword, UserEmail, UserCode, CreationDate, CreationBy, UpdatedDate, UpdatedBy)
			VALUES
			(@UserName, @UserPassword, @UserEmail, @UserCode, GETDATE(), @CreationBy, GETDATE(), @UpdatedBy)
		END
				SELECT @ReturnCode AS ReturnValue


END
GO
