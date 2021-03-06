USE [Basar]
GO
/****** Object:  Table [dbo].[tblDocumentType]    Script Date: 4/29/2020 2:10:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDocumentType](
	[DocumentTypeId] [tinyint] NOT NULL,
	[DocumentTypeDescAr] [nvarchar](50) NULL,
	[DocumentTypeDescEn] [nvarchar](50) NULL,
	[CreationDate] [smalldatetime] NULL,
	[CreationBy] [smallint] NULL,
	[UpdatedDate] [smalldatetime] NULL,
	[UpdatedBy] [smallint] NULL,
	[DocumentTypeOrder] [smallint] NULL,
	[DocumentTypeStatus] [bit] NULL,
 CONSTRAINT [PK_tblDocumentType] PRIMARY KEY CLUSTERED 
(
	[DocumentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblDocumentType] ([DocumentTypeId], [DocumentTypeDescAr], [DocumentTypeDescEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [DocumentTypeOrder], [DocumentTypeStatus]) VALUES (1, N'الصادر', N'Out', CAST(N'2018-09-29T10:43:00' AS SmallDateTime), 1, NULL, NULL, 2, 1)
INSERT [dbo].[tblDocumentType] ([DocumentTypeId], [DocumentTypeDescAr], [DocumentTypeDescEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [DocumentTypeOrder], [DocumentTypeStatus]) VALUES (2, N'الوارد', N'IN', CAST(N'2018-09-29T10:43:00' AS SmallDateTime), 1, NULL, NULL, 3, 1)
INSERT [dbo].[tblDocumentType] ([DocumentTypeId], [DocumentTypeDescAr], [DocumentTypeDescEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [DocumentTypeOrder], [DocumentTypeStatus]) VALUES (3, N'الأرشيف', N'Archive', CAST(N'2018-09-29T10:43:00' AS SmallDateTime), 1, NULL, NULL, 1, 1)
ALTER TABLE [dbo].[tblDocumentType] ADD  CONSTRAINT [DF_tblDocumentType_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[tblDocumentType] ADD  CONSTRAINT [DF_Table_1_SponsorStatus_1]  DEFAULT ((1)) FOR [DocumentTypeStatus]
GO
