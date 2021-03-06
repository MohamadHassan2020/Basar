USE [Basar]
GO
/****** Object:  Table [dbo].[tblBannerAttachment]    Script Date: 4/29/2020 2:10:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBannerAttachment](
	[BannerAttachmentId] [int] NOT NULL,
	[CampId] [smallint] NOT NULL,
	[CountryId] [tinyint] NOT NULL,
	[TourId] [smallint] NOT NULL,
	[YearId] [tinyint] NOT NULL,
	[CreationDate] [smalldatetime] NULL,
	[AddBy] [smallint] NULL,
	[UpdatedDate] [smalldatetime] NULL,
	[UpdatedBy] [smallint] NULL,
	[BannerFileName] [nvarchar](100) NULL,
	[BannerFilePath] [nvarchar](500) NULL,
 CONSTRAINT [PK_tblBannerAttachment] PRIMARY KEY CLUSTERED 
(
	[BannerAttachmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblBannerAttachment] ([BannerAttachmentId], [CampId], [CountryId], [TourId], [YearId], [CreationDate], [AddBy], [UpdatedDate], [UpdatedBy], [BannerFileName], [BannerFilePath]) VALUES (1, 52, 7, 41, 2, CAST(N'2018-09-04T07:52:00' AS SmallDateTime), 2, NULL, NULL, N'payslips.pdf', N'/2018/آسيا 1/سريلانكا/بتلم/2018-09-04/')
ALTER TABLE [dbo].[tblBannerAttachment] ADD  CONSTRAINT [DF_tblBannerAttachment_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
