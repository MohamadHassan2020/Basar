USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetProcedureType]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetProcedureType]


@ProcedureTypeDivider			varchar(1)		=NULL
 
AS

BEGIN

					 SELECT        TOP (100) PERCENT ProcedureTypeId, ProcedureTypeDsecAr, ProcedureTypeDsecEn, ProcedureTypeDivider
					FROM            dbo.tblProcedureType
					WHERE        (ProcedureTypeStatus = 1) AND (ProcedureTypeDivider = @ProcedureTypeDivider)
					ORDER BY ProcedureTypeOrder

END
GO
