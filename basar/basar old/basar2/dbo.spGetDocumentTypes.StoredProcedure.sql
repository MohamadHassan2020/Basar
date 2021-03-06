USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetDocumentTypes]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetDocumentTypes]

AS
BEGIN

			SELECT        TOP (100) PERCENT DocumentTypeId, DocumentTypeDescAr, DocumentTypeDescEn 
				FROM            dbo.tblDocumentType
				WHERE        (DocumentTypeStatus = 1)
				ORDER BY DocumentTypeOrder

END
GO
