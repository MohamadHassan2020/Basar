USE [Basar]
GO
/****** Object:  Table [dbo].[tblNationality]    Script Date: 4/29/2020 2:10:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNationality](
	[NationalityId] [tinyint] NOT NULL,
	[NationalityAr] [nvarchar](50) NULL,
	[NationalityEn] [nvarchar](50) NULL,
	[CreationDate] [smalldatetime] NULL,
	[CreationBy] [smallint] NULL,
	[UpdatedDate] [smalldatetime] NULL,
	[UpdatedBy] [smallint] NULL,
	[NationalityOrder] [smallint] NULL,
	[NationalityStatus] [bit] NULL,
 CONSTRAINT [PK_tblNationality] PRIMARY KEY CLUSTERED 
(
	[NationalityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblNationality] ([NationalityId], [NationalityAr], [NationalityEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [NationalityOrder], [NationalityStatus]) VALUES (1, N'سوداني', N'Sudan', CAST(N'2018-05-08T01:14:00' AS SmallDateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[tblNationality] ([NationalityId], [NationalityAr], [NationalityEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [NationalityOrder], [NationalityStatus]) VALUES (2, N'باكستاني', N'Pakstan', CAST(N'2018-05-08T01:15:00' AS SmallDateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[tblNationality] ([NationalityId], [NationalityAr], [NationalityEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [NationalityOrder], [NationalityStatus]) VALUES (3, N'يمني', N'Yamen', CAST(N'2018-05-08T01:15:00' AS SmallDateTime), 1, NULL, 1, 1, 1)
INSERT [dbo].[tblNationality] ([NationalityId], [NationalityAr], [NationalityEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [NationalityOrder], [NationalityStatus]) VALUES (4, N'سعودي', N'Saudi', CAST(N'2018-05-08T01:15:00' AS SmallDateTime), 1, NULL, 1, 1, 1)
ALTER TABLE [dbo].[tblNationality] ADD  CONSTRAINT [DF_tblNationality_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[tblNationality] ADD  CONSTRAINT [DF_Table_1_SponsorStatus]  DEFAULT ((1)) FOR [NationalityStatus]
GO
