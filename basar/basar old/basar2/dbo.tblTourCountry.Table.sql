USE [Basar]
GO
/****** Object:  Table [dbo].[tblTourCountry]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTourCountry](
	[TourCountryId] [smallint] NOT NULL,
	[TourId] [smallint] NOT NULL,
	[CountryId] [tinyint] NOT NULL,
	[CreationDate] [smalldatetime] NULL,
	[AddBy] [smallint] NULL,
	[TourCountryStatus] [bit] NULL,
	[UpdatedDate] [smalldatetime] NULL,
	[UpdatedBy] [smallint] NULL,
 CONSTRAINT [PK_tblTourCountryId] PRIMARY KEY CLUSTERED 
(
	[TourCountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblTourCountry] ([TourCountryId], [TourId], [CountryId], [CreationDate], [AddBy], [TourCountryStatus], [UpdatedDate], [UpdatedBy]) VALUES (1, 12, 96, CAST(N'2018-06-02T04:01:00' AS SmallDateTime), 2, 1, CAST(N'2018-06-02T04:04:00' AS SmallDateTime), 2)
INSERT [dbo].[tblTourCountry] ([TourCountryId], [TourId], [CountryId], [CreationDate], [AddBy], [TourCountryStatus], [UpdatedDate], [UpdatedBy]) VALUES (2, 3, 5, CAST(N'2018-06-02T04:02:00' AS SmallDateTime), 2, 1, NULL, NULL)
INSERT [dbo].[tblTourCountry] ([TourCountryId], [TourId], [CountryId], [CreationDate], [AddBy], [TourCountryStatus], [UpdatedDate], [UpdatedBy]) VALUES (3, 2, 2, CAST(N'2018-06-02T04:03:00' AS SmallDateTime), 2, 1, NULL, NULL)
INSERT [dbo].[tblTourCountry] ([TourCountryId], [TourId], [CountryId], [CreationDate], [AddBy], [TourCountryStatus], [UpdatedDate], [UpdatedBy]) VALUES (4, 11, 103, CAST(N'2018-06-03T02:47:00' AS SmallDateTime), 1, 1, NULL, NULL)
INSERT [dbo].[tblTourCountry] ([TourCountryId], [TourId], [CountryId], [CreationDate], [AddBy], [TourCountryStatus], [UpdatedDate], [UpdatedBy]) VALUES (5, 4, 7, CAST(N'2018-06-04T13:47:00' AS SmallDateTime), 1, 1, NULL, NULL)
INSERT [dbo].[tblTourCountry] ([TourCountryId], [TourId], [CountryId], [CreationDate], [AddBy], [TourCountryStatus], [UpdatedDate], [UpdatedBy]) VALUES (6, 8, 7, CAST(N'2018-06-04T13:47:00' AS SmallDateTime), 1, 1, NULL, NULL)
INSERT [dbo].[tblTourCountry] ([TourCountryId], [TourId], [CountryId], [CreationDate], [AddBy], [TourCountryStatus], [UpdatedDate], [UpdatedBy]) VALUES (7, 5, 1, CAST(N'2018-06-11T04:34:00' AS SmallDateTime), 1, 1, CAST(N'2018-06-23T01:02:00' AS SmallDateTime), 1)
INSERT [dbo].[tblTourCountry] ([TourCountryId], [TourId], [CountryId], [CreationDate], [AddBy], [TourCountryStatus], [UpdatedDate], [UpdatedBy]) VALUES (8, 7, 1, CAST(N'2018-06-11T04:34:00' AS SmallDateTime), 1, 1, CAST(N'2018-06-23T01:02:00' AS SmallDateTime), 1)
INSERT [dbo].[tblTourCountry] ([TourCountryId], [TourId], [CountryId], [CreationDate], [AddBy], [TourCountryStatus], [UpdatedDate], [UpdatedBy]) VALUES (9, 2, 108, CAST(N'2018-06-23T02:27:00' AS SmallDateTime), 2, 1, NULL, NULL)
INSERT [dbo].[tblTourCountry] ([TourCountryId], [TourId], [CountryId], [CreationDate], [AddBy], [TourCountryStatus], [UpdatedDate], [UpdatedBy]) VALUES (10, 2, 24, CAST(N'2018-06-23T02:27:00' AS SmallDateTime), 2, 1, NULL, NULL)
INSERT [dbo].[tblTourCountry] ([TourCountryId], [TourId], [CountryId], [CreationDate], [AddBy], [TourCountryStatus], [UpdatedDate], [UpdatedBy]) VALUES (11, 27, 36, CAST(N'2018-06-25T09:29:00' AS SmallDateTime), 2, 1, NULL, NULL)
INSERT [dbo].[tblTourCountry] ([TourCountryId], [TourId], [CountryId], [CreationDate], [AddBy], [TourCountryStatus], [UpdatedDate], [UpdatedBy]) VALUES (12, 32, 2, CAST(N'2018-06-26T07:20:00' AS SmallDateTime), 1, 1, NULL, NULL)
INSERT [dbo].[tblTourCountry] ([TourCountryId], [TourId], [CountryId], [CreationDate], [AddBy], [TourCountryStatus], [UpdatedDate], [UpdatedBy]) VALUES (13, 32, 24, CAST(N'2018-06-26T07:20:00' AS SmallDateTime), 1, 1, NULL, NULL)
INSERT [dbo].[tblTourCountry] ([TourCountryId], [TourId], [CountryId], [CreationDate], [AddBy], [TourCountryStatus], [UpdatedDate], [UpdatedBy]) VALUES (14, 32, 25, CAST(N'2018-06-26T07:20:00' AS SmallDateTime), 1, 1, NULL, NULL)
INSERT [dbo].[tblTourCountry] ([TourCountryId], [TourId], [CountryId], [CreationDate], [AddBy], [TourCountryStatus], [UpdatedDate], [UpdatedBy]) VALUES (15, 33, 1, CAST(N'2018-06-26T07:21:00' AS SmallDateTime), 1, 1, NULL, NULL)
INSERT [dbo].[tblTourCountry] ([TourCountryId], [TourId], [CountryId], [CreationDate], [AddBy], [TourCountryStatus], [UpdatedDate], [UpdatedBy]) VALUES (16, 33, 3, CAST(N'2018-06-26T07:21:00' AS SmallDateTime), 1, 1, NULL, NULL)
INSERT [dbo].[tblTourCountry] ([TourCountryId], [TourId], [CountryId], [CreationDate], [AddBy], [TourCountryStatus], [UpdatedDate], [UpdatedBy]) VALUES (17, 34, 10, CAST(N'2018-06-26T07:21:00' AS SmallDateTime), 1, 1, NULL, NULL)
INSERT [dbo].[tblTourCountry] ([TourCountryId], [TourId], [CountryId], [CreationDate], [AddBy], [TourCountryStatus], [UpdatedDate], [UpdatedBy]) VALUES (18, 34, 11, CAST(N'2018-06-26T07:21:00' AS SmallDateTime), 1, 1, NULL, NULL)
INSERT [dbo].[tblTourCountry] ([TourCountryId], [TourId], [CountryId], [CreationDate], [AddBy], [TourCountryStatus], [UpdatedDate], [UpdatedBy]) VALUES (19, 34, 13, CAST(N'2018-06-26T07:21:00' AS SmallDateTime), 1, 1, NULL, NULL)
INSERT [dbo].[tblTourCountry] ([TourCountryId], [TourId], [CountryId], [CreationDate], [AddBy], [TourCountryStatus], [UpdatedDate], [UpdatedBy]) VALUES (20, 35, 21, CAST(N'2018-06-26T07:22:00' AS SmallDateTime), 1, 1, NULL, NULL)
INSERT [dbo].[tblTourCountry] ([TourCountryId], [TourId], [CountryId], [CreationDate], [AddBy], [TourCountryStatus], [UpdatedDate], [UpdatedBy]) VALUES (21, 35, 22, CAST(N'2018-06-26T07:22:00' AS SmallDateTime), 1, 1, NULL, NULL)
INSERT [dbo].[tblTourCountry] ([TourCountryId], [TourId], [CountryId], [CreationDate], [AddBy], [TourCountryStatus], [UpdatedDate], [UpdatedBy]) VALUES (22, 35, 27, CAST(N'2018-06-26T07:22:00' AS SmallDateTime), 1, 1, NULL, NULL)
INSERT [dbo].[tblTourCountry] ([TourCountryId], [TourId], [CountryId], [CreationDate], [AddBy], [TourCountryStatus], [UpdatedDate], [UpdatedBy]) VALUES (23, 35, 23, CAST(N'2018-06-26T07:22:00' AS SmallDateTime), 1, 1, NULL, NULL)
INSERT [dbo].[tblTourCountry] ([TourCountryId], [TourId], [CountryId], [CreationDate], [AddBy], [TourCountryStatus], [UpdatedDate], [UpdatedBy]) VALUES (24, 36, 96, CAST(N'2018-06-26T07:22:00' AS SmallDateTime), 1, 1, NULL, NULL)
INSERT [dbo].[tblTourCountry] ([TourCountryId], [TourId], [CountryId], [CreationDate], [AddBy], [TourCountryStatus], [UpdatedDate], [UpdatedBy]) VALUES (25, 37, 95, CAST(N'2018-06-26T07:22:00' AS SmallDateTime), 1, 1, NULL, NULL)
INSERT [dbo].[tblTourCountry] ([TourCountryId], [TourId], [CountryId], [CreationDate], [AddBy], [TourCountryStatus], [UpdatedDate], [UpdatedBy]) VALUES (26, 38, 42, CAST(N'2018-06-26T07:23:00' AS SmallDateTime), 1, 1, NULL, NULL)
INSERT [dbo].[tblTourCountry] ([TourCountryId], [TourId], [CountryId], [CreationDate], [AddBy], [TourCountryStatus], [UpdatedDate], [UpdatedBy]) VALUES (27, 38, 45, CAST(N'2018-06-26T07:23:00' AS SmallDateTime), 1, 1, NULL, NULL)
INSERT [dbo].[tblTourCountry] ([TourCountryId], [TourId], [CountryId], [CreationDate], [AddBy], [TourCountryStatus], [UpdatedDate], [UpdatedBy]) VALUES (28, 38, 44, CAST(N'2018-06-26T07:23:00' AS SmallDateTime), 1, 1, NULL, NULL)
INSERT [dbo].[tblTourCountry] ([TourCountryId], [TourId], [CountryId], [CreationDate], [AddBy], [TourCountryStatus], [UpdatedDate], [UpdatedBy]) VALUES (29, 38, 43, CAST(N'2018-06-26T07:23:00' AS SmallDateTime), 1, 1, NULL, NULL)
INSERT [dbo].[tblTourCountry] ([TourCountryId], [TourId], [CountryId], [CreationDate], [AddBy], [TourCountryStatus], [UpdatedDate], [UpdatedBy]) VALUES (30, 39, 112, CAST(N'2018-06-26T07:26:00' AS SmallDateTime), 1, 1, NULL, NULL)
INSERT [dbo].[tblTourCountry] ([TourCountryId], [TourId], [CountryId], [CreationDate], [AddBy], [TourCountryStatus], [UpdatedDate], [UpdatedBy]) VALUES (31, 39, 59, CAST(N'2018-06-26T07:26:00' AS SmallDateTime), 1, 1, NULL, NULL)
INSERT [dbo].[tblTourCountry] ([TourCountryId], [TourId], [CountryId], [CreationDate], [AddBy], [TourCountryStatus], [UpdatedDate], [UpdatedBy]) VALUES (32, 40, 99, CAST(N'2018-06-26T07:26:00' AS SmallDateTime), 1, 1, NULL, NULL)
INSERT [dbo].[tblTourCountry] ([TourCountryId], [TourId], [CountryId], [CreationDate], [AddBy], [TourCountryStatus], [UpdatedDate], [UpdatedBy]) VALUES (33, 40, 100, CAST(N'2018-06-26T07:26:00' AS SmallDateTime), 1, 1, NULL, NULL)
INSERT [dbo].[tblTourCountry] ([TourCountryId], [TourId], [CountryId], [CreationDate], [AddBy], [TourCountryStatus], [UpdatedDate], [UpdatedBy]) VALUES (34, 41, 7, CAST(N'2018-06-26T07:27:00' AS SmallDateTime), 1, 1, NULL, NULL)
INSERT [dbo].[tblTourCountry] ([TourCountryId], [TourId], [CountryId], [CreationDate], [AddBy], [TourCountryStatus], [UpdatedDate], [UpdatedBy]) VALUES (35, 42, 5, CAST(N'2018-06-26T07:27:00' AS SmallDateTime), 1, 1, NULL, NULL)
INSERT [dbo].[tblTourCountry] ([TourCountryId], [TourId], [CountryId], [CreationDate], [AddBy], [TourCountryStatus], [UpdatedDate], [UpdatedBy]) VALUES (36, 43, 4, CAST(N'2018-06-26T07:28:00' AS SmallDateTime), 1, 1, NULL, NULL)
INSERT [dbo].[tblTourCountry] ([TourCountryId], [TourId], [CountryId], [CreationDate], [AddBy], [TourCountryStatus], [UpdatedDate], [UpdatedBy]) VALUES (37, 43, 6, CAST(N'2018-06-26T07:28:00' AS SmallDateTime), 1, 1, NULL, NULL)
INSERT [dbo].[tblTourCountry] ([TourCountryId], [TourId], [CountryId], [CreationDate], [AddBy], [TourCountryStatus], [UpdatedDate], [UpdatedBy]) VALUES (38, 26, 103, CAST(N'2018-07-16T07:17:00' AS SmallDateTime), 1, 1, NULL, NULL)
INSERT [dbo].[tblTourCountry] ([TourCountryId], [TourId], [CountryId], [CreationDate], [AddBy], [TourCountryStatus], [UpdatedDate], [UpdatedBy]) VALUES (39, 30, 101, CAST(N'2018-07-16T12:20:00' AS SmallDateTime), 1, 1, NULL, NULL)
INSERT [dbo].[tblTourCountry] ([TourCountryId], [TourId], [CountryId], [CreationDate], [AddBy], [TourCountryStatus], [UpdatedDate], [UpdatedBy]) VALUES (40, 29, 102, CAST(N'2018-07-16T13:29:00' AS SmallDateTime), 1, 1, NULL, NULL)
