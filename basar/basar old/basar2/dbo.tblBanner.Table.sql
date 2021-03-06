USE [Basar]
GO
/****** Object:  Table [dbo].[tblBanner]    Script Date: 4/29/2020 2:10:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBanner](
	[BannerId] [int] NOT NULL,
	[CampId] [smallint] NOT NULL,
	[CountryId] [tinyint] NOT NULL,
	[TourId] [smallint] NOT NULL,
	[YearId] [tinyint] NOT NULL,
	[CreationDate] [smalldatetime] NULL,
	[AddBy] [smallint] NULL,
	[UpdatedDate] [smalldatetime] NULL,
	[UpdatedBy] [smallint] NULL,
	[BannerDesc] [nvarchar](100) NULL,
	[BannerStatus] [bit] NULL,
	[ApprovedDate] [smalldatetime] NULL,
	[ApprovedBy] [smallint] NULL,
	[ApprovedStatus] [bit] NULL,
 CONSTRAINT [PK_tblBanner] PRIMARY KEY CLUSTERED 
(
	[BannerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblBanner] ([BannerId], [CampId], [CountryId], [TourId], [YearId], [CreationDate], [AddBy], [UpdatedDate], [UpdatedBy], [BannerDesc], [BannerStatus], [ApprovedDate], [ApprovedBy], [ApprovedStatus]) VALUES (1, 52, 7, 41, 2, CAST(N'2018-09-04T07:52:00' AS SmallDateTime), 2, CAST(N'2018-09-04T07:57:00' AS SmallDateTime), NULL, N'هذا البنر النهائي رجاء طباعة المحتوى بدون تعديل', 1, CAST(N'2018-09-04T07:57:00' AS SmallDateTime), NULL, 1)
ALTER TABLE [dbo].[tblBanner] ADD  CONSTRAINT [DF_tblBanner_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
