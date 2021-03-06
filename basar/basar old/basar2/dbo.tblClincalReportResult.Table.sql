USE [Basar]
GO
/****** Object:  Table [dbo].[tblClincalReportResult]    Script Date: 4/29/2020 2:10:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblClincalReportResult](
	[YearId] [tinyint] NOT NULL,
	[TourId] [smallint] NOT NULL,
	[TeamId] [smallint] NOT NULL,
	[CountryId] [tinyint] NOT NULL,
	[CampId] [smallint] NOT NULL,
	[AxesId] [smallint] NOT NULL,
	[MaleAxes] [int] NULL,
	[FemaleAxes] [int] NULL,
	[AxesNote] [nvarchar](100) NULL,
	[CreationDate] [smalldatetime] NULL,
	[CreationBy] [smallint] NULL,
	[UpdatedDate] [smalldatetime] NULL,
	[UpdatedBy] [smallint] NULL,
 CONSTRAINT [PK_tblClincalReportResult] PRIMARY KEY CLUSTERED 
(
	[YearId] ASC,
	[TourId] ASC,
	[TeamId] ASC,
	[CountryId] ASC,
	[CampId] ASC,
	[AxesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblClincalReportResult] ([YearId], [TourId], [TeamId], [CountryId], [CampId], [AxesId], [MaleAxes], [FemaleAxes], [AxesNote], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy]) VALUES (2, 26, 1, 103, 48, 1, 13, 8, N'M3', CAST(N'2019-03-31T07:53:00' AS SmallDateTime), NULL, CAST(N'2019-03-31T07:54:00' AS SmallDateTime), NULL)
INSERT [dbo].[tblClincalReportResult] ([YearId], [TourId], [TeamId], [CountryId], [CampId], [AxesId], [MaleAxes], [FemaleAxes], [AxesNote], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy]) VALUES (2, 26, 1, 103, 48, 2, 11, 230, N'M4', CAST(N'2019-03-31T07:53:00' AS SmallDateTime), NULL, CAST(N'2019-03-31T07:54:00' AS SmallDateTime), NULL)
INSERT [dbo].[tblClincalReportResult] ([YearId], [TourId], [TeamId], [CountryId], [CampId], [AxesId], [MaleAxes], [FemaleAxes], [AxesNote], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy]) VALUES (2, 26, 1, 103, 48, 3, 9, 6, N'M1', CAST(N'2019-03-31T07:53:00' AS SmallDateTime), NULL, CAST(N'2019-03-31T07:54:00' AS SmallDateTime), NULL)
INSERT [dbo].[tblClincalReportResult] ([YearId], [TourId], [TeamId], [CountryId], [CampId], [AxesId], [MaleAxes], [FemaleAxes], [AxesNote], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy]) VALUES (2, 26, 1, 103, 48, 4, 7, 22, N'M2', CAST(N'2019-03-31T07:53:00' AS SmallDateTime), NULL, CAST(N'2019-03-31T07:54:00' AS SmallDateTime), NULL)
INSERT [dbo].[tblClincalReportResult] ([YearId], [TourId], [TeamId], [CountryId], [CampId], [AxesId], [MaleAxes], [FemaleAxes], [AxesNote], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy]) VALUES (2, 27, 2, 36, 100, 1, 360, 147, N'mmm', CAST(N'2019-03-31T08:39:00' AS SmallDateTime), 2, CAST(N'2019-03-31T10:01:00' AS SmallDateTime), 2)
INSERT [dbo].[tblClincalReportResult] ([YearId], [TourId], [TeamId], [CountryId], [CampId], [AxesId], [MaleAxes], [FemaleAxes], [AxesNote], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy]) VALUES (2, 27, 2, 36, 100, 2, 650, 128, N'xcvxcvxcv', CAST(N'2019-03-31T08:39:00' AS SmallDateTime), 2, CAST(N'2019-03-31T10:01:00' AS SmallDateTime), 2)
INSERT [dbo].[tblClincalReportResult] ([YearId], [TourId], [TeamId], [CountryId], [CampId], [AxesId], [MaleAxes], [FemaleAxes], [AxesNote], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy]) VALUES (2, 27, 2, 36, 100, 3, 9, 22, N'ccxc', CAST(N'2019-03-31T08:39:00' AS SmallDateTime), 2, CAST(N'2019-03-31T10:01:00' AS SmallDateTime), 2)
INSERT [dbo].[tblClincalReportResult] ([YearId], [TourId], [TeamId], [CountryId], [CampId], [AxesId], [MaleAxes], [FemaleAxes], [AxesNote], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy]) VALUES (2, 27, 2, 36, 100, 4, 152, 241, N'dfgdfgdfg', CAST(N'2019-03-31T08:39:00' AS SmallDateTime), 2, CAST(N'2019-03-31T10:01:00' AS SmallDateTime), 2)
ALTER TABLE [dbo].[tblClincalReportResult] ADD  CONSTRAINT [DF_tblClincalReportResult_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[tblClincalReportResult]  WITH CHECK ADD  CONSTRAINT [FK_tblClincalReportResult_tblCamps] FOREIGN KEY([CampId])
REFERENCES [dbo].[tblCamps] ([CampId])
GO
ALTER TABLE [dbo].[tblClincalReportResult] CHECK CONSTRAINT [FK_tblClincalReportResult_tblCamps]
GO
ALTER TABLE [dbo].[tblClincalReportResult]  WITH CHECK ADD  CONSTRAINT [FK_tblClincalReportResult_tblClinicalReportAxes] FOREIGN KEY([AxesId])
REFERENCES [dbo].[tblClinicalReportAxes] ([AxesId])
GO
ALTER TABLE [dbo].[tblClincalReportResult] CHECK CONSTRAINT [FK_tblClincalReportResult_tblClinicalReportAxes]
GO
ALTER TABLE [dbo].[tblClincalReportResult]  WITH CHECK ADD  CONSTRAINT [FK_tblClincalReportResult_tblCountries] FOREIGN KEY([CountryId])
REFERENCES [dbo].[tblCountries] ([CountryId])
GO
ALTER TABLE [dbo].[tblClincalReportResult] CHECK CONSTRAINT [FK_tblClincalReportResult_tblCountries]
GO
ALTER TABLE [dbo].[tblClincalReportResult]  WITH CHECK ADD  CONSTRAINT [FK_tblClincalReportResult_tblTeam] FOREIGN KEY([TeamId])
REFERENCES [dbo].[tblTeam] ([TeamId])
GO
ALTER TABLE [dbo].[tblClincalReportResult] CHECK CONSTRAINT [FK_tblClincalReportResult_tblTeam]
GO
ALTER TABLE [dbo].[tblClincalReportResult]  WITH CHECK ADD  CONSTRAINT [FK_tblClincalReportResult_tblTour] FOREIGN KEY([TourId])
REFERENCES [dbo].[tblTour] ([TourId])
GO
ALTER TABLE [dbo].[tblClincalReportResult] CHECK CONSTRAINT [FK_tblClincalReportResult_tblTour]
GO
ALTER TABLE [dbo].[tblClincalReportResult]  WITH CHECK ADD  CONSTRAINT [FK_tblClincalReportResult_tblYears] FOREIGN KEY([YearId])
REFERENCES [dbo].[tblYears] ([YearId])
GO
ALTER TABLE [dbo].[tblClincalReportResult] CHECK CONSTRAINT [FK_tblClincalReportResult_tblYears]
GO
