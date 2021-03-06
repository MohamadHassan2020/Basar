USE [Basar]
GO
/****** Object:  Table [dbo].[tblSponsors]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSponsors](
	[SponsorId] [smallint] IDENTITY(1,1) NOT NULL,
	[SponsorDsecAr] [nvarchar](50) NULL,
	[SponsorDsecEn] [nvarchar](50) NULL,
	[CreationDate] [smalldatetime] NULL,
	[CreationBy] [smallint] NULL,
	[UpdatedDate] [smalldatetime] NULL,
	[UpdatedBy] [smallint] NULL,
	[SponsorOrder] [smallint] NULL,
	[SponsorStatus] [bit] NULL,
 CONSTRAINT [PK_tblSponsors] PRIMARY KEY CLUSTERED 
(
	[SponsorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblSponsors] ON 

INSERT [dbo].[tblSponsors] ([SponsorId], [SponsorDsecAr], [SponsorDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [SponsorOrder], [SponsorStatus]) VALUES (1, N'حمعية العون المباشر', N'Direct Aid', CAST(N'2017-10-08T18:00:00' AS SmallDateTime), 1, CAST(N'2017-10-08T18:00:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblSponsors] ([SponsorId], [SponsorDsecAr], [SponsorDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [SponsorOrder], [SponsorStatus]) VALUES (2, N'هيئة الإغاثة الإسلامية العالمية', N'IIRS', CAST(N'2017-10-08T18:01:00' AS SmallDateTime), 1, CAST(N'2017-10-08T18:01:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblSponsors] ([SponsorId], [SponsorDsecAr], [SponsorDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [SponsorOrder], [SponsorStatus]) VALUES (3, N'نور دبي', N'Noor Dubai', CAST(N'2017-10-08T18:01:00' AS SmallDateTime), 1, CAST(N'2017-10-08T18:01:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblSponsors] ([SponsorId], [SponsorDsecAr], [SponsorDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [SponsorOrder], [SponsorStatus]) VALUES (7, N'مؤسسة راف الخيرية', N'RAF', CAST(N'2017-11-28T17:56:00' AS SmallDateTime), 1, CAST(N'2017-11-28T17:56:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblSponsors] ([SponsorId], [SponsorDsecAr], [SponsorDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [SponsorOrder], [SponsorStatus]) VALUES (8, N'مؤسسة السبيعي الخيرية', N'Al Subeai Charity', CAST(N'2017-11-28T18:01:00' AS SmallDateTime), 1, CAST(N'2017-11-28T18:01:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblSponsors] ([SponsorId], [SponsorDsecAr], [SponsorDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [SponsorOrder], [SponsorStatus]) VALUES (9, N'الهلال الأحمر القطري', N'Qatar Red Crescent', CAST(N'2017-11-28T18:03:00' AS SmallDateTime), 1, CAST(N'2017-11-28T18:03:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblSponsors] ([SponsorId], [SponsorDsecAr], [SponsorDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [SponsorOrder], [SponsorStatus]) VALUES (10, N'مبرة الجميح', N'AlJomih', CAST(N'2017-11-28T18:06:00' AS SmallDateTime), 1, CAST(N'2017-11-28T18:06:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblSponsors] ([SponsorId], [SponsorDsecAr], [SponsorDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [SponsorOrder], [SponsorStatus]) VALUES (11, N'أوقاف الزامل', N'ALZAMIL', CAST(N'2017-11-28T18:07:00' AS SmallDateTime), 1, CAST(N'2017-11-28T18:07:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblSponsors] ([SponsorId], [SponsorDsecAr], [SponsorDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [SponsorOrder], [SponsorStatus]) VALUES (12, N'الصناديق الإنسانية', N'OICHF', CAST(N'2017-11-28T18:10:00' AS SmallDateTime), 1, CAST(N'2017-11-28T18:10:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblSponsors] ([SponsorId], [SponsorDsecAr], [SponsorDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [SponsorOrder], [SponsorStatus]) VALUES (13, N'مركز الملك سلمان', N'King Salman Humanitatian', CAST(N'2017-11-28T18:16:00' AS SmallDateTime), 1, CAST(N'2017-11-28T18:16:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblSponsors] ([SponsorId], [SponsorDsecAr], [SponsorDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [SponsorOrder], [SponsorStatus]) VALUES (14, N'لم يحدد بعد', N'Still no sponsor', CAST(N'2017-11-28T18:35:00' AS SmallDateTime), 1, CAST(N'2017-11-28T18:35:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblSponsors] ([SponsorId], [SponsorDsecAr], [SponsorDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [SponsorOrder], [SponsorStatus]) VALUES (15, N'فاعلات خير من قطر', N'Charity from Qatar', CAST(N'2018-04-14T11:36:00' AS SmallDateTime), 1, CAST(N'2018-04-14T11:38:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblSponsors] ([SponsorId], [SponsorDsecAr], [SponsorDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [SponsorOrder], [SponsorStatus]) VALUES (16, N'فاعلات خير', N'DONOR', CAST(N'2018-06-02T03:34:00' AS SmallDateTime), 2, CAST(N'2018-06-02T03:34:00' AS SmallDateTime), 2, 1, 1)
INSERT [dbo].[tblSponsors] ([SponsorId], [SponsorDsecAr], [SponsorDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [SponsorOrder], [SponsorStatus]) VALUES (17, N'داعم محلي', N'Local Sponsor', CAST(N'2018-06-03T02:55:00' AS SmallDateTime), 1, CAST(N'2018-06-03T02:55:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblSponsors] ([SponsorId], [SponsorDsecAr], [SponsorDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [SponsorOrder], [SponsorStatus]) VALUES (18, N'دبي الخيرية', N'Dubai Charity', CAST(N'2018-06-04T13:53:00' AS SmallDateTime), 1, CAST(N'2018-06-04T13:53:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblSponsors] ([SponsorId], [SponsorDsecAr], [SponsorDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [SponsorOrder], [SponsorStatus]) VALUES (19, N'النجاة الخيرية', N'Al Najath Charity', CAST(N'2018-06-04T13:54:00' AS SmallDateTime), 1, CAST(N'2018-06-04T13:54:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblSponsors] ([SponsorId], [SponsorDsecAr], [SponsorDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [SponsorOrder], [SponsorStatus]) VALUES (20, N'البنك الاسلامي', N'Islamic Bank', CAST(N'2018-07-01T06:05:00' AS SmallDateTime), 4, CAST(N'2018-07-01T06:05:00' AS SmallDateTime), 4, 1, 1)
INSERT [dbo].[tblSponsors] ([SponsorId], [SponsorDsecAr], [SponsorDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [SponsorOrder], [SponsorStatus]) VALUES (21, N'فاعل خير', N'faal kair', CAST(N'2018-07-07T02:11:00' AS SmallDateTime), 2, CAST(N'2018-07-07T02:11:00' AS SmallDateTime), 2, 1, 1)
INSERT [dbo].[tblSponsors] ([SponsorId], [SponsorDsecAr], [SponsorDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [SponsorOrder], [SponsorStatus]) VALUES (22, N'فاعل خير', N'faal kair', CAST(N'2018-07-07T02:11:00' AS SmallDateTime), 2, CAST(N'2018-07-07T02:11:00' AS SmallDateTime), 2, 1, 1)
INSERT [dbo].[tblSponsors] ([SponsorId], [SponsorDsecAr], [SponsorDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [SponsorOrder], [SponsorStatus]) VALUES (23, N'جمعية الشارقة', N'Sharjah Association', CAST(N'2018-07-07T02:12:00' AS SmallDateTime), 4, CAST(N'2018-07-07T02:12:00' AS SmallDateTime), 4, 1, 1)
SET IDENTITY_INSERT [dbo].[tblSponsors] OFF
ALTER TABLE [dbo].[tblSponsors] ADD  CONSTRAINT [DF_tblSponsors_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[tblSponsors] ADD  CONSTRAINT [DF_Table_1_CountryStatus_2]  DEFAULT ((1)) FOR [SponsorStatus]
GO
