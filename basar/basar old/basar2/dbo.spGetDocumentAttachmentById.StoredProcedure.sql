USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetDocumentAttachmentById]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetDocumentAttachmentById]

@DocumentId			INT

AS

BEGIN
			SELECT        DocumentFileName, DocumentFilePath,DocumentFilePath + DocumentFileName AS MyFile
			FROM            dbo.tblDocumentAttachment
			WHERE        (DocumentId = @DocumentId)
END
GO
