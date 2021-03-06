USE [Basar]
GO
/****** Object:  Table [dbo].[tblTour]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTour](
	[TourId] [smallint] IDENTITY(1,1) NOT NULL,
	[TeamId] [smallint] NULL,
	[TourDsecAr] [nvarchar](50) NULL,
	[TourDsecEn] [nvarchar](50) NULL,
	[CreationDate] [smalldatetime] NULL,
	[CreationBy] [smallint] NULL,
	[UpdatedDate] [smalldatetime] NULL,
	[UpdatedBy] [smallint] NULL,
	[TourOrder] [smallint] NULL,
	[TourStatus] [bit] NULL,
 CONSTRAINT [PK_tblTour] PRIMARY KEY CLUSTERED 
(
	[TourId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblTour] ON 

INSERT [dbo].[tblTour] ([TourId], [TeamId], [TourDsecAr], [TourDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [TourOrder], [TourStatus]) VALUES (26, 1, N'محلية باكستان', N'local Pakistan', CAST(N'2018-06-24T04:28:00' AS SmallDateTime), 2, CAST(N'2018-06-24T04:28:00' AS SmallDateTime), 2, 1, 1)
INSERT [dbo].[tblTour] ([TourId], [TeamId], [TourDsecAr], [TourDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [TourOrder], [TourStatus]) VALUES (27, 2, N'محلية - السودان', N'Local - Sudan', CAST(N'2018-06-24T04:29:00' AS SmallDateTime), 2, CAST(N'2018-06-24T04:29:00' AS SmallDateTime), 2, 1, 1)
INSERT [dbo].[tblTour] ([TourId], [TeamId], [TourDsecAr], [TourDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [TourOrder], [TourStatus]) VALUES (28, 3, N'محلية - نيجيريا والنيجر', N'Local -Nigeria', CAST(N'2018-06-24T04:32:00' AS SmallDateTime), 2, CAST(N'2018-06-24T04:32:00' AS SmallDateTime), 2, 1, 1)
INSERT [dbo].[tblTour] ([TourId], [TeamId], [TourDsecAr], [TourDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [TourOrder], [TourStatus]) VALUES (29, 4, N'محلية - اليمن', N'Local - Yaman', CAST(N'2018-06-24T04:33:00' AS SmallDateTime), 2, CAST(N'2018-06-24T04:33:00' AS SmallDateTime), 2, 1, 1)
INSERT [dbo].[tblTour] ([TourId], [TeamId], [TourDsecAr], [TourDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [TourOrder], [TourStatus]) VALUES (30, 5, N'محلية - بنغلاديش', N'Local - Bangladesh', CAST(N'2018-06-24T04:35:00' AS SmallDateTime), 2, CAST(N'2018-06-24T04:35:00' AS SmallDateTime), 2, 1, 1)
INSERT [dbo].[tblTour] ([TourId], [TeamId], [TourDsecAr], [TourDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [TourOrder], [TourStatus]) VALUES (32, 1, N'أفريقيا 1', N'Africa 1', CAST(N'2018-06-26T06:45:00' AS SmallDateTime), 1, CAST(N'2018-06-26T06:45:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblTour] ([TourId], [TeamId], [TourDsecAr], [TourDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [TourOrder], [TourStatus]) VALUES (33, 1, N'أفريقيا 2', N'Africa 2', CAST(N'2018-06-26T06:46:00' AS SmallDateTime), 1, CAST(N'2018-12-15T12:29:00' AS SmallDateTime), 2, 1, 1)
INSERT [dbo].[tblTour] ([TourId], [TeamId], [TourDsecAr], [TourDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [TourOrder], [TourStatus]) VALUES (34, 1, N'أفريقيا 3', N'Africa 3', CAST(N'2018-06-26T06:47:00' AS SmallDateTime), 1, CAST(N'2018-06-26T06:47:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblTour] ([TourId], [TeamId], [TourDsecAr], [TourDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [TourOrder], [TourStatus]) VALUES (35, 1, N'أفريقيا 4', N'Africa 4', CAST(N'2018-06-26T06:47:00' AS SmallDateTime), 1, CAST(N'2018-06-26T06:47:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblTour] ([TourId], [TeamId], [TourDsecAr], [TourDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [TourOrder], [TourStatus]) VALUES (36, 2, N'أفريقيا 5', N'Africa 5', CAST(N'2018-06-26T06:48:00' AS SmallDateTime), 1, CAST(N'2018-06-26T06:48:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblTour] ([TourId], [TeamId], [TourDsecAr], [TourDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [TourOrder], [TourStatus]) VALUES (37, 2, N'أفريقيا 6', N'Africa 6', CAST(N'2018-06-26T06:48:00' AS SmallDateTime), 1, CAST(N'2018-06-26T06:48:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblTour] ([TourId], [TeamId], [TourDsecAr], [TourDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [TourOrder], [TourStatus]) VALUES (38, 2, N'أفريقيا 7', N'Africa 7', CAST(N'2018-06-26T06:49:00' AS SmallDateTime), 1, CAST(N'2018-06-26T06:49:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblTour] ([TourId], [TeamId], [TourDsecAr], [TourDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [TourOrder], [TourStatus]) VALUES (39, 2, N'أفريقيا 8', N'Africa 8', CAST(N'2018-06-26T06:49:00' AS SmallDateTime), 1, CAST(N'2018-06-26T06:49:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblTour] ([TourId], [TeamId], [TourDsecAr], [TourDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [TourOrder], [TourStatus]) VALUES (40, 3, N'أفريقيا 9', N'Africa 9', CAST(N'2018-06-26T06:50:00' AS SmallDateTime), 1, CAST(N'2018-06-26T06:50:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblTour] ([TourId], [TeamId], [TourDsecAr], [TourDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [TourOrder], [TourStatus]) VALUES (41, 1, N'آسيا 1', N'Asia 1', CAST(N'2018-06-26T06:52:00' AS SmallDateTime), 1, CAST(N'2018-12-15T11:44:00' AS SmallDateTime), 2, 1, 0)
INSERT [dbo].[tblTour] ([TourId], [TeamId], [TourDsecAr], [TourDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [TourOrder], [TourStatus]) VALUES (42, 1, N'آسيا 2', N'Asia 2', CAST(N'2018-06-26T06:53:00' AS SmallDateTime), 1, CAST(N'2018-06-26T06:53:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblTour] ([TourId], [TeamId], [TourDsecAr], [TourDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [TourOrder], [TourStatus]) VALUES (43, 1, N'آسيا 3', N'Asia 3', CAST(N'2018-06-26T06:54:00' AS SmallDateTime), 1, CAST(N'2018-12-15T12:23:00' AS SmallDateTime), 2, 1, 0)
SET IDENTITY_INSERT [dbo].[tblTour] OFF
ALTER TABLE [dbo].[tblTour] ADD  CONSTRAINT [DF_tblTour_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[tblTour] ADD  CONSTRAINT [DF_Table_1_CountryStatus]  DEFAULT ((1)) FOR [TourStatus]
GO
