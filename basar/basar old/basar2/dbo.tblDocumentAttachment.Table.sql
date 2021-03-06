USE [Basar]
GO
/****** Object:  Table [dbo].[tblDocumentAttachment]    Script Date: 4/29/2020 2:10:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDocumentAttachment](
	[ArchiveAttachmentId] [int] NOT NULL,
	[DocumentId] [int] NOT NULL,
	[CreationDate] [smalldatetime] NULL,
	[AddBy] [smallint] NULL,
	[UpdatedDate] [smalldatetime] NULL,
	[UpdatedBy] [smallint] NULL,
	[DocumentFileName] [nvarchar](100) NULL,
	[DocumentFilePath] [nvarchar](500) NULL,
 CONSTRAINT [PK_tblDocumentAttachment] PRIMARY KEY CLUSTERED 
(
	[ArchiveAttachmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblDocumentAttachment] ([ArchiveAttachmentId], [DocumentId], [CreationDate], [AddBy], [UpdatedDate], [UpdatedBy], [DocumentFileName], [DocumentFilePath]) VALUES (1, 9, CAST(N'2018-10-08T08:29:00' AS SmallDateTime), 2, NULL, NULL, N'01.JPG', N'/الأرشيف/2018/2018100801/2018-10-08/')
INSERT [dbo].[tblDocumentAttachment] ([ArchiveAttachmentId], [DocumentId], [CreationDate], [AddBy], [UpdatedDate], [UpdatedBy], [DocumentFileName], [DocumentFilePath]) VALUES (2, 11, CAST(N'2018-10-08T09:36:00' AS SmallDateTime), 2, NULL, NULL, N'1.jpg', N'/الأرشيف/2018/10080201/2018-10-08/')
INSERT [dbo].[tblDocumentAttachment] ([ArchiveAttachmentId], [DocumentId], [CreationDate], [AddBy], [UpdatedDate], [UpdatedBy], [DocumentFileName], [DocumentFilePath]) VALUES (3, 11, CAST(N'2018-10-08T09:36:00' AS SmallDateTime), 2, NULL, NULL, N'01.JPG', N'/الأرشيف/2018/10080201/2018-10-08/')
INSERT [dbo].[tblDocumentAttachment] ([ArchiveAttachmentId], [DocumentId], [CreationDate], [AddBy], [UpdatedDate], [UpdatedBy], [DocumentFileName], [DocumentFilePath]) VALUES (4, 11, CAST(N'2018-10-08T09:37:00' AS SmallDateTime), 2, NULL, NULL, N'04.JPG', N'/الأرشيف/2018/10080201/2018-10-08/')
INSERT [dbo].[tblDocumentAttachment] ([ArchiveAttachmentId], [DocumentId], [CreationDate], [AddBy], [UpdatedDate], [UpdatedBy], [DocumentFileName], [DocumentFilePath]) VALUES (5, 12, CAST(N'2018-10-09T13:16:00' AS SmallDateTime), 2, NULL, NULL, N'01.pdf', N'/الأرشيف/2018/2018100901/2018-10-09/')
INSERT [dbo].[tblDocumentAttachment] ([ArchiveAttachmentId], [DocumentId], [CreationDate], [AddBy], [UpdatedDate], [UpdatedBy], [DocumentFileName], [DocumentFilePath]) VALUES (6, 13, CAST(N'2018-10-09T13:18:00' AS SmallDateTime), 2, NULL, NULL, N'1014782146.pdf', N'/الأرشيف/2018/18100902/2018-10-09/')
INSERT [dbo].[tblDocumentAttachment] ([ArchiveAttachmentId], [DocumentId], [CreationDate], [AddBy], [UpdatedDate], [UpdatedBy], [DocumentFileName], [DocumentFilePath]) VALUES (7, 13, CAST(N'2018-10-10T08:58:00' AS SmallDateTime), 2, NULL, NULL, N'01.pdf', N'/الأرشيف/2018/18100902/2018-10-10/')
ALTER TABLE [dbo].[tblDocumentAttachment] ADD  CONSTRAINT [DF_tblDocumentAttachment_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
