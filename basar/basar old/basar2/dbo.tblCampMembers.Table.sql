USE [Basar]
GO
/****** Object:  Table [dbo].[tblCampMembers]    Script Date: 4/29/2020 2:10:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCampMembers](
	[CampMembersId] [int] IDENTITY(1,1) NOT NULL,
	[YearId] [tinyint] NOT NULL,
	[TeamId] [smallint] NOT NULL,
	[TeamMemberId] [int] NOT NULL,
	[CampId] [smallint] NOT NULL,
	[CountryId] [tinyint] NOT NULL,
	[CreationDate] [smalldatetime] NULL,
	[AddBy] [smallint] NULL,
	[UpdatedDate] [smalldatetime] NULL,
	[UpdatedBy] [smallint] NULL,
 CONSTRAINT [PK_tblCampMembers] PRIMARY KEY CLUSTERED 
(
	[CampMembersId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblCampMembers] ON 

INSERT [dbo].[tblCampMembers] ([CampMembersId], [YearId], [TeamId], [TeamMemberId], [CampId], [CountryId], [CreationDate], [AddBy], [UpdatedDate], [UpdatedBy]) VALUES (177, 2, 1, 31, 41, 2, CAST(N'2018-07-17T19:49:00' AS SmallDateTime), 2, CAST(N'2018-07-17T19:49:00' AS SmallDateTime), 2)
INSERT [dbo].[tblCampMembers] ([CampMembersId], [YearId], [TeamId], [TeamMemberId], [CampId], [CountryId], [CreationDate], [AddBy], [UpdatedDate], [UpdatedBy]) VALUES (178, 2, 1, 32, 41, 2, CAST(N'2018-07-17T19:49:00' AS SmallDateTime), 2, CAST(N'2018-07-17T19:49:00' AS SmallDateTime), 2)
INSERT [dbo].[tblCampMembers] ([CampMembersId], [YearId], [TeamId], [TeamMemberId], [CampId], [CountryId], [CreationDate], [AddBy], [UpdatedDate], [UpdatedBy]) VALUES (179, 2, 1, 53, 41, 2, CAST(N'2018-07-17T20:02:00' AS SmallDateTime), 2, CAST(N'2018-07-17T20:02:00' AS SmallDateTime), 2)
INSERT [dbo].[tblCampMembers] ([CampMembersId], [YearId], [TeamId], [TeamMemberId], [CampId], [CountryId], [CreationDate], [AddBy], [UpdatedDate], [UpdatedBy]) VALUES (180, 2, 6, 9, 41, 2, CAST(N'2018-07-17T20:02:00' AS SmallDateTime), 2, CAST(N'2018-07-17T20:02:00' AS SmallDateTime), 2)
INSERT [dbo].[tblCampMembers] ([CampMembersId], [YearId], [TeamId], [TeamMemberId], [CampId], [CountryId], [CreationDate], [AddBy], [UpdatedDate], [UpdatedBy]) VALUES (181, 2, 6, 10, 41, 2, CAST(N'2018-07-17T20:02:00' AS SmallDateTime), 2, CAST(N'2018-07-17T20:02:00' AS SmallDateTime), 2)
SET IDENTITY_INSERT [dbo].[tblCampMembers] OFF
