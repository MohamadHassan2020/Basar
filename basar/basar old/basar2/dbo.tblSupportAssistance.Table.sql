USE [Basar]
GO
/****** Object:  Table [dbo].[tblSupportAssistance]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSupportAssistance](
	[SupportAssistanceId] [smallint] IDENTITY(1,1) NOT NULL,
	[SupportAssistanceDsecAr] [nvarchar](50) NULL,
	[SupportAssistanceDsecEn] [nvarchar](50) NULL,
	[CreationDate] [smalldatetime] NULL,
	[CreationBy] [smallint] NULL,
	[UpdatedDate] [smalldatetime] NULL,
	[UpdatedBy] [smallint] NULL,
	[SupportAssistanceOrder] [smallint] NULL,
	[SupportAssistanceStatus] [bit] NULL,
 CONSTRAINT [PK_tblSupportAssistance] PRIMARY KEY CLUSTERED 
(
	[SupportAssistanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblSupportAssistance] ON 

INSERT [dbo].[tblSupportAssistance] ([SupportAssistanceId], [SupportAssistanceDsecAr], [SupportAssistanceDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [SupportAssistanceOrder], [SupportAssistanceStatus]) VALUES (1, N'الجهة الداعمه', NULL, CAST(N'2017-07-04T10:30:00' AS SmallDateTime), NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSupportAssistance] ([SupportAssistanceId], [SupportAssistanceDsecAr], [SupportAssistanceDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [SupportAssistanceOrder], [SupportAssistanceStatus]) VALUES (2, N'إدارة المخيمات', NULL, CAST(N'2017-07-04T10:30:00' AS SmallDateTime), NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSupportAssistance] ([SupportAssistanceId], [SupportAssistanceDsecAr], [SupportAssistanceDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [SupportAssistanceOrder], [SupportAssistanceStatus]) VALUES (3, N'وزارة الصحة', NULL, CAST(N'2017-07-04T10:30:00' AS SmallDateTime), NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSupportAssistance] ([SupportAssistanceId], [SupportAssistanceDsecAr], [SupportAssistanceDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [SupportAssistanceOrder], [SupportAssistanceStatus]) VALUES (4, N'الجهة الراعية', NULL, CAST(N'2017-07-04T10:30:00' AS SmallDateTime), NULL, NULL, NULL, 1, 1)
INSERT [dbo].[tblSupportAssistance] ([SupportAssistanceId], [SupportAssistanceDsecAr], [SupportAssistanceDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [SupportAssistanceOrder], [SupportAssistanceStatus]) VALUES (5, N'أخرى', NULL, CAST(N'2017-07-04T10:30:00' AS SmallDateTime), NULL, NULL, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[tblSupportAssistance] OFF
ALTER TABLE [dbo].[tblSupportAssistance] ADD  CONSTRAINT [DF_tblSupportAssistance_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[tblSupportAssistance] ADD  CONSTRAINT [DF_Table_1_TeamStatus]  DEFAULT ((1)) FOR [SupportAssistanceStatus]
GO
