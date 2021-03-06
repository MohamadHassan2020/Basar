USE [Basar]
GO
/****** Object:  Table [dbo].[tblSpecialization]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSpecialization](
	[SpecializationId] [smallint] IDENTITY(1,1) NOT NULL,
	[SpecializationDsecAr] [nvarchar](50) NULL,
	[SpecializationDsecEn] [nvarchar](50) NULL,
	[CreationDate] [smalldatetime] NULL,
	[CreationBy] [smallint] NULL,
	[UpdatedDate] [smalldatetime] NULL,
	[UpdatedBy] [smallint] NULL,
	[SpecializationOrder] [smallint] NULL,
	[SpecializationStatus] [bit] NULL,
 CONSTRAINT [PK_tblSpecialization] PRIMARY KEY CLUSTERED 
(
	[SpecializationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblSpecialization] ON 

INSERT [dbo].[tblSpecialization] ([SpecializationId], [SpecializationDsecAr], [SpecializationDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [SpecializationOrder], [SpecializationStatus]) VALUES (1, N'مدير المخيم', N'Doctor Eye', CAST(N'2017-07-14T21:10:00' AS SmallDateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[tblSpecialization] ([SpecializationId], [SpecializationDsecAr], [SpecializationDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [SpecializationOrder], [SpecializationStatus]) VALUES (2, N'اخصائي شبكية', N'Specialist', CAST(N'2017-07-14T21:10:00' AS SmallDateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[tblSpecialization] ([SpecializationId], [SpecializationDsecAr], [SpecializationDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [SpecializationOrder], [SpecializationStatus]) VALUES (3, N'اخصائي قرنية', N'Interior', CAST(N'2018-04-08T19:37:00' AS SmallDateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[tblSpecialization] ([SpecializationId], [SpecializationDsecAr], [SpecializationDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [SpecializationOrder], [SpecializationStatus]) VALUES (4, N'استشاري شبكية', NULL, CAST(N'2018-04-08T19:38:00' AS SmallDateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[tblSpecialization] ([SpecializationId], [SpecializationDsecAr], [SpecializationDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [SpecializationOrder], [SpecializationStatus]) VALUES (5, N'استشاري قرنية', NULL, CAST(N'2018-04-08T19:38:00' AS SmallDateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[tblSpecialization] ([SpecializationId], [SpecializationDsecAr], [SpecializationDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [SpecializationOrder], [SpecializationStatus]) VALUES (6, N'فني عمليات', NULL, CAST(N'2018-04-08T19:38:00' AS SmallDateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[tblSpecialization] ([SpecializationId], [SpecializationDsecAr], [SpecializationDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [SpecializationOrder], [SpecializationStatus]) VALUES (7, N'فني بصريات', NULL, CAST(N'2018-04-08T19:38:00' AS SmallDateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[tblSpecialization] ([SpecializationId], [SpecializationDsecAr], [SpecializationDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [SpecializationOrder], [SpecializationStatus]) VALUES (8, N'مساعد طبيب', NULL, CAST(N'2018-04-08T19:39:00' AS SmallDateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[tblSpecialization] ([SpecializationId], [SpecializationDsecAr], [SpecializationDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [SpecializationOrder], [SpecializationStatus]) VALUES (9, N'نائب مدير المخيم', NULL, CAST(N'2018-04-08T19:39:00' AS SmallDateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[tblSpecialization] ([SpecializationId], [SpecializationDsecAr], [SpecializationDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [SpecializationOrder], [SpecializationStatus]) VALUES (10, N'المدير الفني للأطباء', NULL, CAST(N'2018-04-08T19:39:00' AS SmallDateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[tblSpecialization] ([SpecializationId], [SpecializationDsecAr], [SpecializationDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [SpecializationOrder], [SpecializationStatus]) VALUES (11, N'المسئول الإعلامي', NULL, CAST(N'2018-04-08T19:40:00' AS SmallDateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[tblSpecialization] ([SpecializationId], [SpecializationDsecAr], [SpecializationDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [SpecializationOrder], [SpecializationStatus]) VALUES (12, N'مسؤل الاحصاء الطبي', NULL, CAST(N'2018-04-08T19:40:00' AS SmallDateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[tblSpecialization] ([SpecializationId], [SpecializationDsecAr], [SpecializationDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [SpecializationOrder], [SpecializationStatus]) VALUES (13, N'مصور', NULL, CAST(N'2018-04-08T19:40:00' AS SmallDateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[tblSpecialization] ([SpecializationId], [SpecializationDsecAr], [SpecializationDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [SpecializationOrder], [SpecializationStatus]) VALUES (14, N'طبيب ', NULL, CAST(N'2018-04-08T19:43:00' AS SmallDateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[tblSpecialization] ([SpecializationId], [SpecializationDsecAr], [SpecializationDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [SpecializationOrder], [SpecializationStatus]) VALUES (15, N'اخصائي عيون عام', NULL, CAST(N'2018-04-08T19:43:00' AS SmallDateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[tblSpecialization] ([SpecializationId], [SpecializationDsecAr], [SpecializationDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [SpecializationOrder], [SpecializationStatus]) VALUES (16, N'نائب إخصائي عيون', NULL, CAST(N'2018-04-08T19:43:00' AS SmallDateTime), 1, NULL, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[tblSpecialization] OFF
ALTER TABLE [dbo].[tblSpecialization] ADD  CONSTRAINT [DF_tblSpecialization_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[tblSpecialization] ADD  CONSTRAINT [DF_Table_1_TeamStatus_2]  DEFAULT ((1)) FOR [SpecializationStatus]
GO
