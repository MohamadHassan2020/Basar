USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetDocumentById]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[spGetDocumentById]


@DocumentId INT =NULL
AS


BEGIN



SELECT        DocumentId, DocumentTypeId, YearId, DocumentNumber, DocumentNumberDaily, DocumentSaveNumber, FORMAT (DocumentDate,'yyyy-MM-dd') AS DocumentDateFormat , DocumentAttachNumber, DocumentPlace, DocumentSubject, IsModifyed
FROM            dbo.tblDocuments
WHERE        (DocumentId = @DocumentId)


END
GO
