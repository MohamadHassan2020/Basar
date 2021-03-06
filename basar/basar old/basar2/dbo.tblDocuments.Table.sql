USE [Basar]
GO
/****** Object:  Table [dbo].[tblDocuments]    Script Date: 4/29/2020 2:10:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDocuments](
	[DocumentId] [int] NOT NULL,
	[DocumentTypeId] [tinyint] NOT NULL,
	[YearId] [tinyint] NOT NULL,
	[DocumentNumber] [nvarchar](20) NULL,
	[DocumentNumberDaily] [nvarchar](20) NULL,
	[DocumentSaveNumber] [nvarchar](20) NULL,
	[DocumentDate] [date] NULL,
	[DocumentAttachNumber] [nvarchar](20) NULL,
	[DocumentPlace] [nvarchar](50) NULL,
	[DocumentSubject] [nvarchar](100) NULL,
	[IsModifyed] [bit] NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedBy] [smallint] NULL,
	[CreationDate] [smalldatetime] NULL,
	[UpdatedBy] [smallint] NULL,
	[UpdatedDate] [smalldatetime] NULL,
 CONSTRAINT [PK_tblDocuments] PRIMARY KEY CLUSTERED 
(
	[DocumentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblDocuments] ([DocumentId], [DocumentTypeId], [YearId], [DocumentNumber], [DocumentNumberDaily], [DocumentSaveNumber], [DocumentDate], [DocumentAttachNumber], [DocumentPlace], [DocumentSubject], [IsModifyed], [IsActive], [IsDeleted], [CreatedBy], [CreationDate], [UpdatedBy], [UpdatedDate]) VALUES (1, 3, 2, N'', N'2018100201', N'13', NULL, N'', N'', N'', 0, NULL, NULL, 2, CAST(N'2018-10-02T12:29:00' AS SmallDateTime), 2, CAST(N'2018-10-02T12:29:00' AS SmallDateTime))
INSERT [dbo].[tblDocuments] ([DocumentId], [DocumentTypeId], [YearId], [DocumentNumber], [DocumentNumberDaily], [DocumentSaveNumber], [DocumentDate], [DocumentAttachNumber], [DocumentPlace], [DocumentSubject], [IsModifyed], [IsActive], [IsDeleted], [CreatedBy], [CreationDate], [UpdatedBy], [UpdatedDate]) VALUES (2, 3, 2, N'', N'2018100202', N'2', NULL, N'', N'', N'', 0, NULL, NULL, 2, CAST(N'2018-10-02T12:30:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[tblDocuments] ([DocumentId], [DocumentTypeId], [YearId], [DocumentNumber], [DocumentNumberDaily], [DocumentSaveNumber], [DocumentDate], [DocumentAttachNumber], [DocumentPlace], [DocumentSubject], [IsModifyed], [IsActive], [IsDeleted], [CreatedBy], [CreationDate], [UpdatedBy], [UpdatedDate]) VALUES (3, 1, 2, N'', N'2018100201', N'3', NULL, N'', N'', N'', 0, NULL, NULL, 2, CAST(N'2018-10-02T12:30:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[tblDocuments] ([DocumentId], [DocumentTypeId], [YearId], [DocumentNumber], [DocumentNumberDaily], [DocumentSaveNumber], [DocumentDate], [DocumentAttachNumber], [DocumentPlace], [DocumentSubject], [IsModifyed], [IsActive], [IsDeleted], [CreatedBy], [CreationDate], [UpdatedBy], [UpdatedDate]) VALUES (4, 3, 2, N'', N'2018100301', N'10', NULL, N'', N'', N'', 0, NULL, NULL, 2, CAST(N'2018-10-03T06:44:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[tblDocuments] ([DocumentId], [DocumentTypeId], [YearId], [DocumentNumber], [DocumentNumberDaily], [DocumentSaveNumber], [DocumentDate], [DocumentAttachNumber], [DocumentPlace], [DocumentSubject], [IsModifyed], [IsActive], [IsDeleted], [CreatedBy], [CreationDate], [UpdatedBy], [UpdatedDate]) VALUES (5, 3, 2, N'18102', N'2018100302', N'16', CAST(N'2018-10-03' AS Date), N'', N'', N'احصائية المخيمات', 0, NULL, NULL, 2, CAST(N'2018-10-03T06:45:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[tblDocuments] ([DocumentId], [DocumentTypeId], [YearId], [DocumentNumber], [DocumentNumberDaily], [DocumentSaveNumber], [DocumentDate], [DocumentAttachNumber], [DocumentPlace], [DocumentSubject], [IsModifyed], [IsActive], [IsDeleted], [CreatedBy], [CreationDate], [UpdatedBy], [UpdatedDate]) VALUES (6, 3, 1, N'صادر عام', N'2018100701', N'1', NULL, N'', N'', N'', 0, NULL, NULL, 2, CAST(N'2018-10-07T08:23:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[tblDocuments] ([DocumentId], [DocumentTypeId], [YearId], [DocumentNumber], [DocumentNumberDaily], [DocumentSaveNumber], [DocumentDate], [DocumentAttachNumber], [DocumentPlace], [DocumentSubject], [IsModifyed], [IsActive], [IsDeleted], [CreatedBy], [CreationDate], [UpdatedBy], [UpdatedDate]) VALUES (7, 3, 1, N'وارد عام', N'2018100702', N'2', NULL, N'', N'', N'', 0, NULL, NULL, 2, CAST(N'2018-10-07T08:24:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[tblDocuments] ([DocumentId], [DocumentTypeId], [YearId], [DocumentNumber], [DocumentNumberDaily], [DocumentSaveNumber], [DocumentDate], [DocumentAttachNumber], [DocumentPlace], [DocumentSubject], [IsModifyed], [IsActive], [IsDeleted], [CreatedBy], [CreationDate], [UpdatedBy], [UpdatedDate]) VALUES (8, 3, 2, N'قطاع السودان', N'2018100703', N'3', NULL, N'', N'', N'', 0, NULL, NULL, 2, CAST(N'2018-10-07T09:17:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[tblDocuments] ([DocumentId], [DocumentTypeId], [YearId], [DocumentNumber], [DocumentNumberDaily], [DocumentSaveNumber], [DocumentDate], [DocumentAttachNumber], [DocumentPlace], [DocumentSubject], [IsModifyed], [IsActive], [IsDeleted], [CreatedBy], [CreationDate], [UpdatedBy], [UpdatedDate]) VALUES (9, 3, 2, N'', N'2018100801', N'2055', NULL, N'', N'', N'', 0, NULL, NULL, 2, CAST(N'2018-10-08T08:29:00' AS SmallDateTime), 2, CAST(N'2018-10-10T08:39:00' AS SmallDateTime))
INSERT [dbo].[tblDocuments] ([DocumentId], [DocumentTypeId], [YearId], [DocumentNumber], [DocumentNumberDaily], [DocumentSaveNumber], [DocumentDate], [DocumentAttachNumber], [DocumentPlace], [DocumentSubject], [IsModifyed], [IsActive], [IsDeleted], [CreatedBy], [CreationDate], [UpdatedBy], [UpdatedDate]) VALUES (10, 3, 2, N'', N'18100802', N'256002', NULL, N'', N'', N'', 0, NULL, NULL, 2, CAST(N'2018-10-08T08:36:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[tblDocuments] ([DocumentId], [DocumentTypeId], [YearId], [DocumentNumber], [DocumentNumberDaily], [DocumentSaveNumber], [DocumentDate], [DocumentAttachNumber], [DocumentPlace], [DocumentSubject], [IsModifyed], [IsActive], [IsDeleted], [CreatedBy], [CreationDate], [UpdatedBy], [UpdatedDate]) VALUES (11, 3, 2, N'', N'10080201', N'', NULL, N'', N'', N'', 0, NULL, NULL, 2, CAST(N'2018-10-08T09:36:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[tblDocuments] ([DocumentId], [DocumentTypeId], [YearId], [DocumentNumber], [DocumentNumberDaily], [DocumentSaveNumber], [DocumentDate], [DocumentAttachNumber], [DocumentPlace], [DocumentSubject], [IsModifyed], [IsActive], [IsDeleted], [CreatedBy], [CreationDate], [UpdatedBy], [UpdatedDate]) VALUES (12, 3, 2, N'', N'2018100901', N'', NULL, N'', N'', N'', 0, NULL, NULL, 2, CAST(N'2018-10-09T13:16:00' AS SmallDateTime), NULL, NULL)
INSERT [dbo].[tblDocuments] ([DocumentId], [DocumentTypeId], [YearId], [DocumentNumber], [DocumentNumberDaily], [DocumentSaveNumber], [DocumentDate], [DocumentAttachNumber], [DocumentPlace], [DocumentSubject], [IsModifyed], [IsActive], [IsDeleted], [CreatedBy], [CreationDate], [UpdatedBy], [UpdatedDate]) VALUES (13, 3, 2, N'25001', N'18100902', N'25', CAST(N'2018-10-10' AS Date), N'7', N'مسشتفى أم درمان', N'بحث احصائية العيادات الخارجية بالقطاع', 1, NULL, NULL, 2, CAST(N'2018-10-09T13:18:00' AS SmallDateTime), 2, CAST(N'2018-10-10T08:40:00' AS SmallDateTime))
