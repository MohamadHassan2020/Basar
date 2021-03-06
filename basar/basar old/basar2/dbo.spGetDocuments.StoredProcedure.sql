USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetDocuments]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetDocuments]

			@DocumentTypeId			tinyint					=NULL,
			@YearId					tinyint					=NULL,
			@DocumentDate			date					=NULL,
			@DocumentNumber			nvarchar(20)			=NULL,
			@DocumentSaveNumber		nvarchar(20)			=NULL,
			@DocumentPlace			nvarchar(50)			=NULL,
			@DocumentSubject		nvarchar(100)			=NULL


AS

BEGIN



			SELECT        TOP (100) PERCENT dbo.tblDocuments.DocumentId, dbo.tblDocuments.DocumentTypeId, dbo.tblDocuments.YearId, dbo.tblDocuments.DocumentNumber, dbo.tblDocuments.DocumentNumberDaily, 
									 dbo.tblDocuments.DocumentSaveNumber, dbo.tblDocuments.DocumentDate, dbo.tblDocuments.DocumentAttachNumber, dbo.tblDocuments.DocumentPlace, dbo.tblDocuments.DocumentSubject, dbo.tblDocuments.IsModifyed, 
									 dbo.tblDocuments.CreatedBy, dbo.tblDocuments.CreationDate, dbo.tblDocuments.IsActive, dbo.tblDocuments.IsDeleted, dbo.tblDocuments.UpdatedBy, dbo.tblDocuments.UpdatedDate, dbo.tblYears.YearNameAr, 
									 dbo.tblDocumentType.DocumentTypeDescAr, dbo.vwGetLastFileAttachmentbyDocument.DocumentFileName
			FROM            dbo.tblDocuments INNER JOIN
									 dbo.tblYears ON dbo.tblDocuments.YearId = dbo.tblYears.YearId INNER JOIN
									 dbo.tblDocumentType ON dbo.tblDocuments.DocumentTypeId = dbo.tblDocumentType.DocumentTypeId LEFT OUTER JOIN
									 dbo.vwGetLastFileAttachmentbyDocument ON dbo.tblDocuments.DocumentId = dbo.vwGetLastFileAttachmentbyDocument.DocumentId
			WHERE			(dbo.tblDocuments.DocumentTypeId = @DocumentTypeId OR @DocumentTypeId IS NULL)
							AND (dbo.tblDocuments.YearId = @YearId OR @YearId IS NULL)
							AND (@DocumentNumber IN (dbo.tblDocuments.DocumentNumber,dbo.tblDocuments.DocumentNumberDaily) OR @DocumentNumber IS NULL)
							AND (dbo.tblDocuments.DocumentSaveNumber = @DocumentSaveNumber OR @DocumentSaveNumber IS NULL)
							AND (dbo.tblDocuments.DocumentDate = @DocumentDate OR @DocumentDate IS NULL) 
							AND (dbo.tblDocuments.DocumentPlace = @DocumentPlace OR @DocumentPlace IS NULL) 
							AND (dbo.tblDocuments.DocumentSubject like N'%' + @DocumentSubject + '%' OR @DocumentSubject IS NULL)
							ORDER BY dbo.tblDocuments.CreationDate DESC

END
GO
