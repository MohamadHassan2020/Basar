USE [Basar]
GO
/****** Object:  Table [dbo].[tblTeamClass]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTeamClass](
	[TeamClassId] [tinyint] IDENTITY(1,1) NOT NULL,
	[TeamClassDsecAr] [nvarchar](50) NULL,
	[TeamClassDsecEn] [nvarchar](50) NULL,
	[CreationDate] [smalldatetime] NULL,
	[CreationBy] [smallint] NULL,
	[UpdatedDate] [smalldatetime] NULL,
	[UpdatedBy] [smallint] NULL,
	[TeamClassOrder] [smallint] NULL,
	[TeamClassStatus] [bit] NULL,
 CONSTRAINT [PK_tblTeamClass] PRIMARY KEY CLUSTERED 
(
	[TeamClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblTeamClass] ON 

INSERT [dbo].[tblTeamClass] ([TeamClassId], [TeamClassDsecAr], [TeamClassDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [TeamClassOrder], [TeamClassStatus]) VALUES (1, N'طبيب', N'Doctor', CAST(N'2017-12-03T17:52:00' AS SmallDateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[tblTeamClass] ([TeamClassId], [TeamClassDsecAr], [TeamClassDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [TeamClassOrder], [TeamClassStatus]) VALUES (2, N'إداري', N'Administration', CAST(N'2017-12-03T17:52:00' AS SmallDateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[tblTeamClass] ([TeamClassId], [TeamClassDsecAr], [TeamClassDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [TeamClassOrder], [TeamClassStatus]) VALUES (3, N'زائر', N'Visitor', CAST(N'2017-12-03T17:53:00' AS SmallDateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[tblTeamClass] ([TeamClassId], [TeamClassDsecAr], [TeamClassDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [TeamClassOrder], [TeamClassStatus]) VALUES (4, N'فني', N'Techniation', CAST(N'2017-12-03T17:53:00' AS SmallDateTime), 1, NULL, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[tblTeamClass] OFF
ALTER TABLE [dbo].[tblTeamClass] ADD  CONSTRAINT [DF_tblTeamClass_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[tblTeamClass] ADD  CONSTRAINT [DF_Table_1_TeamStatus_1]  DEFAULT ((1)) FOR [TeamClassStatus]
GO
