USE [Basar]
GO
/****** Object:  Table [dbo].[tblTeamCategory]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTeamCategory](
	[TeamCategoryId] [smallint] IDENTITY(1,1) NOT NULL,
	[TeamClassId] [tinyint] NOT NULL,
	[TeamCategoryDsecAr] [nvarchar](50) NULL,
	[TeamCategoryDsecEn] [nvarchar](50) NULL,
	[CreationDate] [smalldatetime] NULL,
	[CreationBy] [smallint] NULL,
	[UpdatedDate] [smalldatetime] NULL,
	[UpdatedBy] [smallint] NULL,
	[TeamCategoryOrder] [smallint] NULL,
	[TeamCategoryStatus] [bit] NULL,
 CONSTRAINT [PK_tblTeamCategory] PRIMARY KEY CLUSTERED 
(
	[TeamCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblTeamCategory] ON 

INSERT [dbo].[tblTeamCategory] ([TeamCategoryId], [TeamClassId], [TeamCategoryDsecAr], [TeamCategoryDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [TeamCategoryOrder], [TeamCategoryStatus]) VALUES (1, 1, N'A', N'A', CAST(N'2017-12-03T17:58:00' AS SmallDateTime), 1, NULL, 1, NULL, 1)
INSERT [dbo].[tblTeamCategory] ([TeamCategoryId], [TeamClassId], [TeamCategoryDsecAr], [TeamCategoryDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [TeamCategoryOrder], [TeamCategoryStatus]) VALUES (2, 1, N'B', N'B', CAST(N'2017-12-03T17:58:00' AS SmallDateTime), 1, NULL, 1, NULL, 1)
INSERT [dbo].[tblTeamCategory] ([TeamCategoryId], [TeamClassId], [TeamCategoryDsecAr], [TeamCategoryDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [TeamCategoryOrder], [TeamCategoryStatus]) VALUES (3, 1, N'C', N'C', CAST(N'2017-12-03T17:58:00' AS SmallDateTime), 1, NULL, 1, NULL, 1)
INSERT [dbo].[tblTeamCategory] ([TeamCategoryId], [TeamClassId], [TeamCategoryDsecAr], [TeamCategoryDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [TeamCategoryOrder], [TeamCategoryStatus]) VALUES (4, 2, N'A', N'A', CAST(N'2017-12-03T17:58:00' AS SmallDateTime), 1, NULL, 1, NULL, 1)
INSERT [dbo].[tblTeamCategory] ([TeamCategoryId], [TeamClassId], [TeamCategoryDsecAr], [TeamCategoryDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [TeamCategoryOrder], [TeamCategoryStatus]) VALUES (5, 2, N'B', N'B', CAST(N'2018-04-08T19:24:00' AS SmallDateTime), 1, NULL, 1, NULL, 1)
INSERT [dbo].[tblTeamCategory] ([TeamCategoryId], [TeamClassId], [TeamCategoryDsecAr], [TeamCategoryDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [TeamCategoryOrder], [TeamCategoryStatus]) VALUES (6, 3, N'A', N'A', CAST(N'2018-04-08T19:24:00' AS SmallDateTime), 1, NULL, 1, NULL, 1)
INSERT [dbo].[tblTeamCategory] ([TeamCategoryId], [TeamClassId], [TeamCategoryDsecAr], [TeamCategoryDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [TeamCategoryOrder], [TeamCategoryStatus]) VALUES (7, 3, N'B', N'B', CAST(N'2018-04-08T19:25:00' AS SmallDateTime), 1, NULL, 1, NULL, 1)
INSERT [dbo].[tblTeamCategory] ([TeamCategoryId], [TeamClassId], [TeamCategoryDsecAr], [TeamCategoryDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [TeamCategoryOrder], [TeamCategoryStatus]) VALUES (9, 3, N'C', N'C', CAST(N'2018-04-08T19:25:00' AS SmallDateTime), 1, NULL, 1, NULL, 1)
INSERT [dbo].[tblTeamCategory] ([TeamCategoryId], [TeamClassId], [TeamCategoryDsecAr], [TeamCategoryDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [TeamCategoryOrder], [TeamCategoryStatus]) VALUES (10, 4, N'A', N'A', CAST(N'2018-04-08T19:25:00' AS SmallDateTime), 1, NULL, 1, NULL, 1)
INSERT [dbo].[tblTeamCategory] ([TeamCategoryId], [TeamClassId], [TeamCategoryDsecAr], [TeamCategoryDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [TeamCategoryOrder], [TeamCategoryStatus]) VALUES (11, 4, N'B', N'B', CAST(N'2018-04-08T19:25:00' AS SmallDateTime), 1, NULL, 1, NULL, 1)
INSERT [dbo].[tblTeamCategory] ([TeamCategoryId], [TeamClassId], [TeamCategoryDsecAr], [TeamCategoryDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [TeamCategoryOrder], [TeamCategoryStatus]) VALUES (14, 4, N'C', N'C', CAST(N'2018-04-08T19:25:00' AS SmallDateTime), 1, NULL, 1, NULL, 1)
SET IDENTITY_INSERT [dbo].[tblTeamCategory] OFF
ALTER TABLE [dbo].[tblTeamCategory] ADD  CONSTRAINT [DF_tblTeamCategory_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[tblTeamCategory] ADD  CONSTRAINT [DF_Table_1_TeamClassStatus]  DEFAULT ((1)) FOR [TeamCategoryStatus]
GO
