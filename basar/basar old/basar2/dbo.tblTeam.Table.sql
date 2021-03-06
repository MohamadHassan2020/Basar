USE [Basar]
GO
/****** Object:  Table [dbo].[tblTeam]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTeam](
	[TeamId] [smallint] IDENTITY(1,1) NOT NULL,
	[TeamDsecAr] [nvarchar](50) NULL,
	[TeamDsecEn] [nvarchar](50) NULL,
	[CreationDate] [smalldatetime] NULL,
	[CreationBy] [smallint] NULL,
	[UpdatedDate] [smalldatetime] NULL,
	[UpdatedBy] [smallint] NULL,
	[TeamOrder] [smallint] NULL,
	[TeamStatus] [bit] NULL,
	[TeamFlag] [nvarchar](100) NULL,
 CONSTRAINT [PK_tblTeam] PRIMARY KEY CLUSTERED 
(
	[TeamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblTeam] ON 

INSERT [dbo].[tblTeam] ([TeamId], [TeamDsecAr], [TeamDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [TeamOrder], [TeamStatus], [TeamFlag]) VALUES (1, N'الفريق الباكستاني', N'Pakistani Team', CAST(N'2017-10-08T18:29:00' AS SmallDateTime), 1, CAST(N'2017-10-08T18:29:00' AS SmallDateTime), 1, 1, 1, N'../images/pak.png')
INSERT [dbo].[tblTeam] ([TeamId], [TeamDsecAr], [TeamDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [TeamOrder], [TeamStatus], [TeamFlag]) VALUES (2, N'الفريق السوداني', N'Sudani Team', CAST(N'2017-10-08T18:29:00' AS SmallDateTime), 1, CAST(N'2017-10-08T18:29:00' AS SmallDateTime), 1, 1, 1, N'../images/sud.png')
INSERT [dbo].[tblTeam] ([TeamId], [TeamDsecAr], [TeamDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [TeamOrder], [TeamStatus], [TeamFlag]) VALUES (3, N'الفريق النيجيري', N'Nigerian Team', CAST(N'2017-10-08T18:30:00' AS SmallDateTime), 1, CAST(N'2017-10-08T18:30:00' AS SmallDateTime), 1, 1, 1, N'../images/nig.png')
INSERT [dbo].[tblTeam] ([TeamId], [TeamDsecAr], [TeamDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [TeamOrder], [TeamStatus], [TeamFlag]) VALUES (4, N'الفريق اليمني المحلي', N'(YEMEN TEAM(LOCAL', CAST(N'2017-11-28T17:32:00' AS SmallDateTime), 1, CAST(N'2017-11-28T17:32:00' AS SmallDateTime), 1, 1, 1, N'../images/yam.png')
INSERT [dbo].[tblTeam] ([TeamId], [TeamDsecAr], [TeamDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [TeamOrder], [TeamStatus], [TeamFlag]) VALUES (5, N'الفريق البنجلاديشي (محلي)', N'Bangladeshi Team -Local', CAST(N'2017-11-28T17:35:00' AS SmallDateTime), 1, CAST(N'2017-11-28T17:35:00' AS SmallDateTime), 1, 1, 1, N'../images/bang.png')
INSERT [dbo].[tblTeam] ([TeamId], [TeamDsecAr], [TeamDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [TeamOrder], [TeamStatus], [TeamFlag]) VALUES (6, N'المكتب الرئيسي', N'Head Office', CAST(N'2018-04-08T19:45:00' AS SmallDateTime), 1, NULL, 1, 1, 1, N'../images/sa.png')
SET IDENTITY_INSERT [dbo].[tblTeam] OFF
ALTER TABLE [dbo].[tblTeam] ADD  CONSTRAINT [DF_tblTeam_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[tblTeam] ADD  CONSTRAINT [DF_tblTeam_TourStatus]  DEFAULT ((1)) FOR [TeamStatus]
GO
