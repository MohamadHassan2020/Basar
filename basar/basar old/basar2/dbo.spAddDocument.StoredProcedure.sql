USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spAddDocument]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spAddDocument]



			@DocumentId				int								=NULL,
			@DocumentTypeId			tinyint							=NULL,
			@YearId					tinyint							=NULL,
			@DocumentNumber			nvarchar(20)					=NULL,
			
			@DocumentSaveNumber		nvarchar(20)					=NULL,
			@DocumentDate			date							=NULL,
			@DocumentAttachNumber	nvarchar(20)					=NULL,
			@DocumentPlace			nvarchar(50)				=NULL,
			@DocumentSubject		nvarchar(100)				=NULL,
			@CreatedBy				smallint					=NULL,
			@UpdatedBy				smallint					=NULL,
			@IsModifyed				bit							=NULL,
			@IsActive				bit							=NULL,
			@IsDeleted				bit							=NULL,
			@DocumentIdOut			int							OUT,
			@DocumentNumberDailyOut	nvarchar(20)				OUT,
			@MsgOut					NVARCHAR(100)				OUT


AS

BEGIN

 
				DECLARE @DocumentNumberDaily	nvarchar(20)


				IF NOT EXISTS (SELECT DocumentId FROM  dbo.tblDocuments  WHERE   (DocumentId=@DocumentId))

						BEGIN
															
															
																			SELECT   @DocumentId= ISNULL (MAX(DocumentId),0)+1 FROM            dbo.tblDocuments
																			
																			IF   EXISTS  (SELECT TOP 1 DocumentNumberDaily FROM dbo.tblDocuments WHERE ISNULL(IsDeleted,0)=0 AND dbo.tblDocuments.DocumentTypeId=@DocumentTypeId  AND (FORMAT(dbo.tblDocuments.Creationdate,'yyyy-MM-dd')=format(GETDATE(),'yyyy-MM-dd'))
   																							ORDER BY Creationdate DESC)
																							BEGIN

																							SELECT   @DocumentNumberDaily= [dbo].[fnSerialNumber](
																							(SELECT TOP 1 DocumentNumberDaily FROM dbo.tblDocuments WHERE dbo.tblDocuments.DocumentTypeId=@DocumentTypeId AND ISNULL(IsDeleted,0)=0
																								ORDER BY Creationdate DESC
																							))
																			END
																			ELSE
																			BEGIN
																				SELECT   @DocumentNumberDaily=(SELECT FORMAT(GETDATE(),'yyyyMMdd01') )
																			END

																			INSERT INTO dbo.tblDocuments(
																			DocumentId, DocumentTypeId, YearId, DocumentNumber, DocumentNumberDaily, DocumentSaveNumber, DocumentDate, DocumentAttachNumber, DocumentPlace, DocumentSubject, IsModifyed, CreatedBy, CreationDate)
																			VALUES (@DocumentId, @DocumentTypeId, @YearId, @DocumentNumber, @DocumentNumberDaily, @DocumentSaveNumber, @DocumentDate, @DocumentAttachNumber, @DocumentPlace, @DocumentSubject, @IsModifyed, @CreatedBy, GETDATE())
																			SELECT @DocumentNumberDailyOut=@DocumentNumberDaily
																			SELECT @DocumentIdOut=@DocumentId
																			SELECT @MsgOut=N'تم الحفظ بنجاح'
						END
						ELSE
					BEGIN

 								UPDATE dbo.tblDocuments SET 
															YearId=@YearId,
															DocumentNumber=@DocumentNumber,
															DocumentSaveNumber=@DocumentSaveNumber,
															DocumentDate=@DocumentDate,
															DocumentAttachNumber=@DocumentAttachNumber,
															DocumentPlace=@DocumentPlace,
															DocumentSubject=@DocumentSubject, 
															IsModifyed=@IsModifyed,
															UpdatedBy=@UpdatedBy,
															UpdatedDate=GETDATE()
															 WHERE   (DocumentId=@DocumentId)
															 SELECT @DocumentNumberDailyOut=''
															 SELECT @DocumentIdOut=@DocumentId
															SELECT @MsgOut=N'تم الحفظ بنجاح'




		
		END

END
 

 
GO
