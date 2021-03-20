USE [Basar]
GO
/****** Object:  Table [dbo].[tblCamps]    Script Date: 4/29/2020 2:10:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCamps](
	[CampId] [smallint] IDENTITY(1,1) NOT NULL,
	[CountryId] [tinyint] NULL,
	[CampDsecAr] [nvarchar](50) NULL,
	[CampDsecEn] [nvarchar](50) NULL,
	[CreationDate] [smalldatetime] NULL,
	[CreationBy] [smallint] NULL,
	[UpdatedDate] [smalldatetime] NULL,
	[UpdatedBy] [smallint] NULL,
	[CampOrder] [smallint] NULL,
	[CampStatus] [bit] NULL,
 CONSTRAINT [PK_tblCamps] PRIMARY KEY CLUSTERED 
(
	[CampId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblCamps] ON 

INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (41, 2, N'تيجراي', N'Tigray', CAST(N'2018-06-02T04:09:00' AS SmallDateTime), 2, CAST(N'2018-06-02T04:09:00' AS SmallDateTime), 2, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (42, 2, N'عفار', N'Afar', CAST(N'2018-06-02T04:10:00' AS SmallDateTime), 2, CAST(N'2018-06-02T04:10:00' AS SmallDateTime), 2, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (43, 2, N'بن شنقول', N'Benishangul', CAST(N'2018-06-02T04:12:00' AS SmallDateTime), 2, CAST(N'2018-06-02T04:12:00' AS SmallDateTime), 2, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (44, 96, N'مصوع', N'Musawa', CAST(N'2018-06-02T04:20:00' AS SmallDateTime), 2, CAST(N'2018-06-02T04:20:00' AS SmallDateTime), 2, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (45, 96, N'كرن', N'Karen', CAST(N'2018-06-02T04:21:00' AS SmallDateTime), 2, CAST(N'2018-06-02T04:21:00' AS SmallDateTime), 2, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (46, 5, N'دافاو', N'Davao', CAST(N'2018-06-03T02:38:00' AS SmallDateTime), 1, CAST(N'2018-06-03T02:38:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (47, 103, N'كي ان شاه', N'K N Shah', CAST(N'2018-06-03T02:53:00' AS SmallDateTime), 1, CAST(N'2018-06-03T02:53:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (48, 103, N'تاندوجام', N'Tandojam', CAST(N'2018-06-03T03:55:00' AS SmallDateTime), 1, CAST(N'2018-06-03T03:55:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (49, 103, N'بادين', N'Badin', CAST(N'2018-06-03T03:56:00' AS SmallDateTime), 1, CAST(N'2018-06-03T03:56:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (50, 103, N'جلهم', N'Jehlum', CAST(N'2018-06-03T03:57:00' AS SmallDateTime), 1, CAST(N'2018-06-03T03:57:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (51, 7, N'كاتانكودي', N'Kattankudy', CAST(N'2018-06-04T13:49:00' AS SmallDateTime), 1, CAST(N'2018-06-04T13:49:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (52, 7, N'بتلم', N'Puttalam', CAST(N'2018-06-04T13:51:00' AS SmallDateTime), 1, CAST(N'2018-06-04T13:51:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (53, 1, N'بربرة', N'Berbera', CAST(N'2018-06-23T01:09:00' AS SmallDateTime), 1, CAST(N'2018-06-23T01:09:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (54, 1, N'بوراما', N'Borama', CAST(N'2018-06-23T01:09:00' AS SmallDateTime), 1, CAST(N'2018-06-23T01:09:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (55, 1, N'برعو', N'Burco', CAST(N'2018-06-23T01:10:00' AS SmallDateTime), 1, CAST(N'2018-06-23T01:10:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (56, 1, N'غابيلي', N'Gebilay', CAST(N'2018-06-23T01:13:00' AS SmallDateTime), 1, CAST(N'2018-06-23T01:13:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (57, 1, N'مقديشو', N'Muqdisho', CAST(N'2018-06-23T02:16:00' AS SmallDateTime), 1, CAST(N'2018-06-23T02:16:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (58, 24, N'تلكو', N'telco', CAST(N'2018-06-24T02:58:00' AS SmallDateTime), 2, CAST(N'2018-06-24T02:58:00' AS SmallDateTime), 2, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (59, 24, N'تلكو', N'telco', CAST(N'2018-06-24T02:59:00' AS SmallDateTime), 2, CAST(N'2018-06-24T02:59:00' AS SmallDateTime), 2, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (60, 109, N'نيجيريا 2', N'Nigeria 2', CAST(N'2018-06-24T04:44:00' AS SmallDateTime), 2, CAST(N'2018-06-24T04:44:00' AS SmallDateTime), 2, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (61, 109, N'نيجيريا 1', N'Nigeria 1', CAST(N'2018-06-24T04:45:00' AS SmallDateTime), 2, CAST(N'2018-06-24T04:45:00' AS SmallDateTime), 2, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (62, 109, N'نيجيريا 3', N'Nigeria 3', CAST(N'2018-06-24T04:45:00' AS SmallDateTime), 2, CAST(N'2018-06-24T04:45:00' AS SmallDateTime), 2, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (63, 36, N'SUDAN', N'السودان 6', CAST(N'2018-06-26T03:01:00' AS SmallDateTime), 4, CAST(N'2018-06-26T03:02:00' AS SmallDateTime), 4, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (64, 36, N'السودان 2', N'sudan 2', CAST(N'2018-06-26T03:04:00' AS SmallDateTime), 4, CAST(N'2018-06-26T03:05:00' AS SmallDateTime), 4, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (65, 36, N'نيالا', N'NAYLA', CAST(N'2018-06-26T03:26:00' AS SmallDateTime), 4, CAST(N'2018-06-26T03:26:00' AS SmallDateTime), 4, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (66, 36, N'ود العباس', N'Wad Alabass', CAST(N'2018-07-01T01:35:00' AS SmallDateTime), 4, CAST(N'2018-07-01T01:35:00' AS SmallDateTime), 4, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (67, 36, N'ام القري', N'Umm Alqura', CAST(N'2018-07-01T01:59:00' AS SmallDateTime), 4, CAST(N'2018-07-01T01:59:00' AS SmallDateTime), 4, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (68, 36, N'تشاد-1', N'Chad-1', CAST(N'2018-07-01T02:05:00' AS SmallDateTime), 4, CAST(N'2018-07-01T02:05:00' AS SmallDateTime), 4, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (69, 36, N'تشاد-2', N'Chad-2', CAST(N'2018-07-01T02:09:00' AS SmallDateTime), 4, CAST(N'2018-07-01T02:09:00' AS SmallDateTime), 4, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (70, 114, N'تشاد-1', N'Chad-1', CAST(N'2018-07-01T02:12:00' AS SmallDateTime), 4, CAST(N'2018-07-01T02:12:00' AS SmallDateTime), 4, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (71, 95, N'تشاد-2', N'Chad-2', CAST(N'2018-07-01T02:14:00' AS SmallDateTime), 4, CAST(N'2018-07-01T02:14:00' AS SmallDateTime), 4, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (72, 95, N'تشاد-3', N'Chad-3', CAST(N'2018-07-01T02:17:00' AS SmallDateTime), 4, CAST(N'2018-07-01T02:17:00' AS SmallDateTime), 4, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (73, 95, N'تشاد-1', N'Chad-1', CAST(N'2018-07-01T02:18:00' AS SmallDateTime), 4, CAST(N'2018-07-01T02:18:00' AS SmallDateTime), 4, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (74, 95, N'تشاد-4', N'Chad-4', CAST(N'2018-07-01T02:21:00' AS SmallDateTime), 4, CAST(N'2018-07-01T02:21:00' AS SmallDateTime), 4, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (75, 36, N'ابوجبيهه', N'Abojbyhuh', CAST(N'2018-07-01T02:25:00' AS SmallDateTime), 4, CAST(N'2018-07-01T02:25:00' AS SmallDateTime), 4, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (76, 36, N'الدلنج', N'Aldalanaj', CAST(N'2018-07-01T02:30:00' AS SmallDateTime), 4, CAST(N'2018-07-01T02:30:00' AS SmallDateTime), 4, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (77, 112, N'المغرب-1', N'Morocco-1', CAST(N'2018-07-01T02:36:00' AS SmallDateTime), 4, CAST(N'2018-07-01T02:36:00' AS SmallDateTime), 4, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (78, 112, N'المغرب-2', N'Morocco-2', CAST(N'2018-07-01T02:38:00' AS SmallDateTime), 4, CAST(N'2018-07-01T02:38:00' AS SmallDateTime), 4, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (79, 112, N'المغرب-1', N'Morocco-1', CAST(N'2018-07-01T06:11:00' AS SmallDateTime), 4, CAST(N'2018-07-01T06:11:00' AS SmallDateTime), 4, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (80, 112, N'المغرب-3', N'Morocco-3', CAST(N'2018-07-01T06:14:00' AS SmallDateTime), 4, CAST(N'2018-07-01T06:14:00' AS SmallDateTime), 4, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (81, 59, N'موريتانيا', N'Mauritania-1', CAST(N'2018-07-01T06:17:00' AS SmallDateTime), 4, CAST(N'2018-07-01T06:18:00' AS SmallDateTime), 4, 1, 0)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (82, 59, N'موريتانيا -1', N'Mauritania-1', CAST(N'2018-07-01T06:22:00' AS SmallDateTime), 4, CAST(N'2018-07-01T06:22:00' AS SmallDateTime), 4, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (83, 59, N'موريتانيا-2', N'Mauritania-2', CAST(N'2018-07-01T06:25:00' AS SmallDateTime), 4, CAST(N'2018-07-01T06:25:00' AS SmallDateTime), 4, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (84, 44, N'كونغو 1', N'kongo 1', CAST(N'2018-07-07T02:02:00' AS SmallDateTime), 2, CAST(N'2018-07-07T02:02:00' AS SmallDateTime), 2, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (85, 10, N'جنوب افريقيا - ١', N'South Africa  - 1', CAST(N'2018-07-16T09:41:00' AS SmallDateTime), 1, CAST(N'2018-07-16T09:41:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (86, 10, N'جنوب افريقيا - ٢', N'South Africa - ٢', CAST(N'2018-07-16T09:42:00' AS SmallDateTime), 1, CAST(N'2018-07-16T09:42:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (87, 13, N'م - موزنبيق', N'Mozambique - C', CAST(N'2018-07-16T09:48:00' AS SmallDateTime), 1, CAST(N'2018-07-16T09:48:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (88, 11, N'م - زيمابوي', N'Zimbabwe - C', CAST(N'2018-07-16T09:50:00' AS SmallDateTime), 1, CAST(N'2018-07-16T09:50:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (89, 2, N'م - أثيوبيا - ١', N'Ethiopia - 1 - C', CAST(N'2018-07-16T10:00:00' AS SmallDateTime), 1, CAST(N'2018-07-16T10:00:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (90, 2, N'م - أثيوبيا - ٢', N'Ethiopia - 2 - C', CAST(N'2018-07-16T10:01:00' AS SmallDateTime), 1, CAST(N'2018-07-16T10:01:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (91, 2, N'م - أثيوبيا - ٣', N'Ethiopia - 3 - C', CAST(N'2018-07-16T10:02:00' AS SmallDateTime), 1, CAST(N'2018-07-16T10:02:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (92, 25, N'م- مالي', N'Mali - C', CAST(N'2018-07-16T10:10:00' AS SmallDateTime), 1, CAST(N'2018-07-16T10:10:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (93, 25, N'م- مالي ( كانكان - كوناكري )', N'Mali ( Kankan - Conakry ) - C', CAST(N'2018-07-16T10:15:00' AS SmallDateTime), 1, CAST(N'2018-07-16T10:15:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (94, 21, N'م -السينقال', N'Senegal - 1', CAST(N'2018-07-16T10:20:00' AS SmallDateTime), 1, CAST(N'2018-07-16T10:20:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (95, 21, N'م - السينقال ٢', N'Senegal - 2 - C', CAST(N'2018-07-16T10:23:00' AS SmallDateTime), 1, CAST(N'2018-07-16T10:23:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (96, 22, N'م - غامبيا', N'Gambia - C', CAST(N'2018-07-16T10:25:00' AS SmallDateTime), 1, CAST(N'2018-07-16T10:25:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (97, 23, N'م - غينيا بيساو', N'Guinea Bissau - C', CAST(N'2018-07-16T10:29:00' AS SmallDateTime), 1, CAST(N'2018-07-16T10:29:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (98, 27, N'م - غانا', N'Ghana - C', CAST(N'2018-07-16T10:30:00' AS SmallDateTime), 1, CAST(N'2018-07-16T10:30:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (99, 36, N'سينار', N'Sinar', CAST(N'2018-07-16T10:49:00' AS SmallDateTime), 1, CAST(N'2018-07-16T10:49:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (100, 36, N'داندير', N'Dander', CAST(N'2018-07-16T11:15:00' AS SmallDateTime), 1, CAST(N'2018-07-16T11:15:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (101, 36, N'جبل اوليا', N'Jabal Awlia', CAST(N'2018-07-16T11:17:00' AS SmallDateTime), 1, CAST(N'2018-07-16T11:17:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (102, 36, N'جينينا', N'Genena', CAST(N'2018-07-16T11:18:00' AS SmallDateTime), 1, CAST(N'2018-07-16T11:18:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (103, 95, N'أتيا', N'أتيا', CAST(N'2018-07-16T11:29:00' AS SmallDateTime), 1, CAST(N'2018-12-18T14:46:00' AS SmallDateTime), 2, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (104, 95, N'ماندو', N'Mandu', CAST(N'2018-07-16T11:30:00' AS SmallDateTime), 1, CAST(N'2018-07-16T11:30:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (105, 42, N'م - أفريقيا الوسطى', N'Central Africa - C', CAST(N'2018-07-16T12:00:00' AS SmallDateTime), 1, CAST(N'2018-07-16T12:00:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (106, 43, N'م - الكنغو كنشاسا', N'Congo - Kinshasa - C', CAST(N'2018-07-16T12:01:00' AS SmallDateTime), 1, CAST(N'2018-07-16T12:01:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (107, 44, N'الكنغو برازافيل', N'Congo-Brazzaville - C', CAST(N'2018-07-16T12:02:00' AS SmallDateTime), 1, CAST(N'2018-07-16T12:02:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (108, 45, N'م - الغابون', N'Gabon - C', CAST(N'2018-07-16T12:03:00' AS SmallDateTime), 1, CAST(N'2018-07-16T12:03:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (109, 59, N'موريتانيا - ٣', N'Mauritania - 3', CAST(N'2018-07-16T12:17:00' AS SmallDateTime), 1, CAST(N'2018-07-16T12:17:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (110, 101, N'تاكورغون', N'Thakurgaon', CAST(N'2018-07-16T13:15:00' AS SmallDateTime), 1, CAST(N'2018-07-16T13:15:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (111, 101, N'كوكسيس بازار', N'Coxes Bazar', CAST(N'2018-07-16T13:18:00' AS SmallDateTime), 1, CAST(N'2018-07-16T13:18:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (112, 101, N'راجشاهي - ١', N'Rajshahi - 1', CAST(N'2018-07-16T13:19:00' AS SmallDateTime), 1, CAST(N'2018-07-16T13:19:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (113, 101, N'راجشاهي - ٢', N'Rajshahi - 2', CAST(N'2018-07-16T13:19:00' AS SmallDateTime), 1, CAST(N'2018-07-16T13:19:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblCamps] ([CampId], [CountryId], [CampDsecAr], [CampDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [CampOrder], [CampStatus]) VALUES (114, 102, N'لحج', N'Lahej', CAST(N'2018-07-16T13:30:00' AS SmallDateTime), 1, CAST(N'2018-07-16T13:30:00' AS SmallDateTime), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[tblCamps] OFF
ALTER TABLE [dbo].[tblCamps] ADD  CONSTRAINT [DF_tblCamps_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[tblCamps] ADD  CONSTRAINT [DF_Table_1_CountryStatus_1]  DEFAULT ((1)) FOR [CampStatus]
GO
