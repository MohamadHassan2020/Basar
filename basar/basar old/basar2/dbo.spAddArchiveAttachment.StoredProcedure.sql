USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spAddArchiveAttachment]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spAddArchiveAttachment]


	 
			@DocumentNumberDaily	NVARCHAR(20)	=NULL,
			@AddBy					smallint		=NULL,
			@UpdatedBy				smallint		=NULL,
			@DocumentFileName		nvarchar(100)	=NULL,
			@DocumentFilePath		nvarchar(500)	=NULL

AS
BEGIN

--IF NOT EXISTS (SELECT ArchiveAttachmentId FROM  dbo.tblDocumentAttachment 
--WHERE (DocumentId = @DocumentId))


--BEGIN

													DECLARE		@DocumentId				INT				 
													SELECT @DocumentId=(SELECT DocumentId FROM tblDocuments WHERE DocumentNumberDaily=@DocumentNumberDaily)
													IF (@DocumentId>0)
													BEGIN


															DECLARE @ArchiveAttachmentId	int
															SELECT   @ArchiveAttachmentId= ISNULL (MAX(ArchiveAttachmentId),0)+1 FROM            dbo.tblDocumentAttachment


															INSERT INTO dbo.tblDocumentAttachment (ArchiveAttachmentId, DocumentId, CreationDate, AddBy, DocumentFileName, DocumentFilePath)
															VALUES (@ArchiveAttachmentId,@DocumentId, GETDATE(), @AddBy, @DocumentFileName, @DocumentFilePath)

													END

--END

END
GO
