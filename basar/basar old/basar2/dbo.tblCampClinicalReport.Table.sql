USE [Basar]
GO
/****** Object:  Table [dbo].[tblCampClinicalReport]    Script Date: 4/29/2020 2:10:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCampClinicalReport](
	[YearId] [tinyint] NOT NULL,
	[TourId] [smallint] NOT NULL,
	[TeamId] [smallint] NOT NULL,
	[CountryId] [tinyint] NOT NULL,
	[CampId] [smallint] NOT NULL,
	[ManagerId] [smallint] NOT NULL,
	[ChiefSurgeonId] [smallint] NOT NULL,
	[InvolvedAgencies] [bit] NULL,
	[CampReportNote] [nvarchar](500) NULL,
	[CreationDate] [smalldatetime] NULL,
	[CreationBy] [smallint] NULL,
	[UpdatedDate] [smalldatetime] NULL,
	[UpdatedBy] [smallint] NULL,
 CONSTRAINT [PK_tblCampClinicalReport] PRIMARY KEY CLUSTERED 
(
	[YearId] ASC,
	[TourId] ASC,
	[TeamId] ASC,
	[CountryId] ASC,
	[CampId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblCampClinicalReport] ([YearId], [TourId], [TeamId], [CountryId], [CampId], [ManagerId], [ChiefSurgeonId], [InvolvedAgencies], [CampReportNote], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy]) VALUES (2, 26, 1, 103, 48, 1, 2, 0, NULL, CAST(N'2019-03-31T07:53:00' AS SmallDateTime), 2, CAST(N'2019-03-31T07:54:00' AS SmallDateTime), 2)
INSERT [dbo].[tblCampClinicalReport] ([YearId], [TourId], [TeamId], [CountryId], [CampId], [ManagerId], [ChiefSurgeonId], [InvolvedAgencies], [CampReportNote], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy]) VALUES (2, 27, 2, 36, 100, 1, 2, 1, N'ملاحظات جديدة يتم من خلالها العمل على تفعيل تسجيل المخيمات', CAST(N'2019-03-31T08:39:00' AS SmallDateTime), 2, CAST(N'2019-03-31T10:01:00' AS SmallDateTime), 2)
ALTER TABLE [dbo].[tblCampClinicalReport] ADD  CONSTRAINT [DF_tblCampClinicalReport_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[tblCampClinicalReport] ADD  CONSTRAINT [DF_tblCampClinicalReport_CreationDate1]  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[tblCampClinicalReport]  WITH CHECK ADD  CONSTRAINT [FK_tblCampClinicalReport_tblCamps] FOREIGN KEY([CampId])
REFERENCES [dbo].[tblCamps] ([CampId])
GO
ALTER TABLE [dbo].[tblCampClinicalReport] CHECK CONSTRAINT [FK_tblCampClinicalReport_tblCamps]
GO
ALTER TABLE [dbo].[tblCampClinicalReport]  WITH CHECK ADD  CONSTRAINT [FK_tblCampClinicalReport_tblCountries] FOREIGN KEY([CountryId])
REFERENCES [dbo].[tblCountries] ([CountryId])
GO
ALTER TABLE [dbo].[tblCampClinicalReport] CHECK CONSTRAINT [FK_tblCampClinicalReport_tblCountries]
GO
ALTER TABLE [dbo].[tblCampClinicalReport]  WITH CHECK ADD  CONSTRAINT [FK_tblCampClinicalReport_tblManager] FOREIGN KEY([ManagerId])
REFERENCES [dbo].[tblManager] ([ManagerId])
GO
ALTER TABLE [dbo].[tblCampClinicalReport] CHECK CONSTRAINT [FK_tblCampClinicalReport_tblManager]
GO
ALTER TABLE [dbo].[tblCampClinicalReport]  WITH CHECK ADD  CONSTRAINT [FK_tblCampClinicalReport_tblManager1] FOREIGN KEY([ChiefSurgeonId])
REFERENCES [dbo].[tblManager] ([ManagerId])
GO
ALTER TABLE [dbo].[tblCampClinicalReport] CHECK CONSTRAINT [FK_tblCampClinicalReport_tblManager1]
GO
ALTER TABLE [dbo].[tblCampClinicalReport]  WITH CHECK ADD  CONSTRAINT [FK_tblCampClinicalReport_tblTeam] FOREIGN KEY([TeamId])
REFERENCES [dbo].[tblTeam] ([TeamId])
GO
ALTER TABLE [dbo].[tblCampClinicalReport] CHECK CONSTRAINT [FK_tblCampClinicalReport_tblTeam]
GO
ALTER TABLE [dbo].[tblCampClinicalReport]  WITH CHECK ADD  CONSTRAINT [FK_tblCampClinicalReport_tblTour] FOREIGN KEY([TourId])
REFERENCES [dbo].[tblTour] ([TourId])
GO
ALTER TABLE [dbo].[tblCampClinicalReport] CHECK CONSTRAINT [FK_tblCampClinicalReport_tblTour]
GO
ALTER TABLE [dbo].[tblCampClinicalReport]  WITH CHECK ADD  CONSTRAINT [FK_tblCampClinicalReport_tblYears] FOREIGN KEY([YearId])
REFERENCES [dbo].[tblYears] ([YearId])
GO
ALTER TABLE [dbo].[tblCampClinicalReport] CHECK CONSTRAINT [FK_tblCampClinicalReport_tblYears]
GO
