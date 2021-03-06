USE [Basar]
GO
/****** Object:  Table [dbo].[tblPreliminary]    Script Date: 4/29/2020 2:10:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPreliminary](
	[PreliminaryId] [int] NOT NULL,
	[YearId] [tinyint] NOT NULL,
	[CountryId] [tinyint] NOT NULL,
	[CampId] [smallint] NOT NULL,
	[SurveyCategoryId] [tinyint] NOT NULL,
	[IndicatorId] [smallint] NOT NULL,
	[IndicatorDivider] [bit] NULL,
	[RequiredNumber] [smallint] NULL,
	[AvailableNumber] [smallint] NULL,
	[MissingNumber] [smallint] NULL,
	[CampIndicatorStatus] [varchar](1) NULL,
	[CampIndicatorMemo] [nvarchar](200) NULL,
	[CreationDate] [smalldatetime] NULL,
	[AddBy] [smallint] NULL,
	[UpdatedDate] [smalldatetime] NULL,
	[UpdatedBy] [smallint] NULL,
 CONSTRAINT [PK_tblPreliminary] PRIMARY KEY CLUSTERED 
(
	[PreliminaryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblPreliminary] ([PreliminaryId], [YearId], [CountryId], [CampId], [SurveyCategoryId], [IndicatorId], [IndicatorDivider], [RequiredNumber], [AvailableNumber], [MissingNumber], [CampIndicatorStatus], [CampIndicatorMemo], [CreationDate], [AddBy], [UpdatedDate], [UpdatedBy]) VALUES (1, 2, 36, 66, 1, 7, 0, 2, 0, 0, N'', N'', CAST(N'2018-08-09T08:32:00' AS SmallDateTime), 2, NULL, 2)
INSERT [dbo].[tblPreliminary] ([PreliminaryId], [YearId], [CountryId], [CampId], [SurveyCategoryId], [IndicatorId], [IndicatorDivider], [RequiredNumber], [AvailableNumber], [MissingNumber], [CampIndicatorStatus], [CampIndicatorMemo], [CreationDate], [AddBy], [UpdatedDate], [UpdatedBy]) VALUES (2, 2, 36, 66, 1, 8, 0, 0, 0, 0, N'', N'', CAST(N'2018-08-09T08:32:00' AS SmallDateTime), 2, NULL, 2)
INSERT [dbo].[tblPreliminary] ([PreliminaryId], [YearId], [CountryId], [CampId], [SurveyCategoryId], [IndicatorId], [IndicatorDivider], [RequiredNumber], [AvailableNumber], [MissingNumber], [CampIndicatorStatus], [CampIndicatorMemo], [CreationDate], [AddBy], [UpdatedDate], [UpdatedBy]) VALUES (3, 2, 36, 66, 1, 9, 0, 0, 0, 0, N'', N'', CAST(N'2018-08-09T08:32:00' AS SmallDateTime), 2, NULL, 2)
INSERT [dbo].[tblPreliminary] ([PreliminaryId], [YearId], [CountryId], [CampId], [SurveyCategoryId], [IndicatorId], [IndicatorDivider], [RequiredNumber], [AvailableNumber], [MissingNumber], [CampIndicatorStatus], [CampIndicatorMemo], [CreationDate], [AddBy], [UpdatedDate], [UpdatedBy]) VALUES (4, 2, 36, 66, 1, 13, 0, 2, 0, 0, N'', N'', CAST(N'2018-08-09T08:32:00' AS SmallDateTime), 2, NULL, 2)
INSERT [dbo].[tblPreliminary] ([PreliminaryId], [YearId], [CountryId], [CampId], [SurveyCategoryId], [IndicatorId], [IndicatorDivider], [RequiredNumber], [AvailableNumber], [MissingNumber], [CampIndicatorStatus], [CampIndicatorMemo], [CreationDate], [AddBy], [UpdatedDate], [UpdatedBy]) VALUES (5, 2, 36, 66, 1, 16, 0, 4, 0, 0, N'', N'', CAST(N'2018-08-09T08:32:00' AS SmallDateTime), 2, NULL, 2)
INSERT [dbo].[tblPreliminary] ([PreliminaryId], [YearId], [CountryId], [CampId], [SurveyCategoryId], [IndicatorId], [IndicatorDivider], [RequiredNumber], [AvailableNumber], [MissingNumber], [CampIndicatorStatus], [CampIndicatorMemo], [CreationDate], [AddBy], [UpdatedDate], [UpdatedBy]) VALUES (6, 2, 36, 66, 1, 17, 0, 8, 0, 0, N'', N'', CAST(N'2018-08-09T08:32:00' AS SmallDateTime), 2, NULL, 2)
INSERT [dbo].[tblPreliminary] ([PreliminaryId], [YearId], [CountryId], [CampId], [SurveyCategoryId], [IndicatorId], [IndicatorDivider], [RequiredNumber], [AvailableNumber], [MissingNumber], [CampIndicatorStatus], [CampIndicatorMemo], [CreationDate], [AddBy], [UpdatedDate], [UpdatedBy]) VALUES (7, 2, 36, 66, 1, 18, 0, 5, 0, 0, N'', N'', CAST(N'2018-08-09T08:32:00' AS SmallDateTime), 2, NULL, 2)
INSERT [dbo].[tblPreliminary] ([PreliminaryId], [YearId], [CountryId], [CampId], [SurveyCategoryId], [IndicatorId], [IndicatorDivider], [RequiredNumber], [AvailableNumber], [MissingNumber], [CampIndicatorStatus], [CampIndicatorMemo], [CreationDate], [AddBy], [UpdatedDate], [UpdatedBy]) VALUES (8, 2, 36, 66, 1, 19, 0, 5, 0, 0, N'', N'', CAST(N'2018-08-09T08:32:00' AS SmallDateTime), 2, NULL, 2)
INSERT [dbo].[tblPreliminary] ([PreliminaryId], [YearId], [CountryId], [CampId], [SurveyCategoryId], [IndicatorId], [IndicatorDivider], [RequiredNumber], [AvailableNumber], [MissingNumber], [CampIndicatorStatus], [CampIndicatorMemo], [CreationDate], [AddBy], [UpdatedDate], [UpdatedBy]) VALUES (9, 2, 36, 66, 1, 20, 0, 3, 0, 0, N'', N'', CAST(N'2018-08-09T08:32:00' AS SmallDateTime), 2, NULL, 2)
INSERT [dbo].[tblPreliminary] ([PreliminaryId], [YearId], [CountryId], [CampId], [SurveyCategoryId], [IndicatorId], [IndicatorDivider], [RequiredNumber], [AvailableNumber], [MissingNumber], [CampIndicatorStatus], [CampIndicatorMemo], [CreationDate], [AddBy], [UpdatedDate], [UpdatedBy]) VALUES (10, 2, 36, 66, 1, 21, 0, 12, 8, 3, N'', N'جيد للمخيم 2', CAST(N'2018-08-09T08:32:00' AS SmallDateTime), 2, NULL, 2)
INSERT [dbo].[tblPreliminary] ([PreliminaryId], [YearId], [CountryId], [CampId], [SurveyCategoryId], [IndicatorId], [IndicatorDivider], [RequiredNumber], [AvailableNumber], [MissingNumber], [CampIndicatorStatus], [CampIndicatorMemo], [CreationDate], [AddBy], [UpdatedDate], [UpdatedBy]) VALUES (11, 2, 36, 66, 1, 22, 0, 10, 0, 0, N'', N'', CAST(N'2018-08-09T08:32:00' AS SmallDateTime), 2, NULL, 2)
ALTER TABLE [dbo].[tblPreliminary] ADD  CONSTRAINT [DF_tblPreliminary_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
