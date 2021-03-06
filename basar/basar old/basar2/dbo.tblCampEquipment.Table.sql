USE [Basar]
GO
/****** Object:  Table [dbo].[tblCampEquipment]    Script Date: 4/29/2020 2:10:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCampEquipment](
	[CampEquipmentId] [int] NOT NULL,
	[YearId] [tinyint] NOT NULL,
	[CountryId] [tinyint] NOT NULL,
	[CampId] [smallint] NOT NULL,
	[EquipmentId] [smallint] NOT NULL,
	[RequiredNumber] [smallint] NULL,
	[AvailableNumber] [smallint] NULL,
	[CampEquipmentStatus] [varchar](1) NULL,
	[CampEquipmentMemo] [nvarchar](200) NULL,
	[CreationDate] [smalldatetime] NULL,
	[AddBy] [smallint] NULL,
	[UpdatedDate] [smalldatetime] NULL,
	[UpdatedBy] [smallint] NULL,
 CONSTRAINT [PK_tblCampEquipment] PRIMARY KEY CLUSTERED 
(
	[CampEquipmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblCampEquipment] ([CampEquipmentId], [YearId], [CountryId], [CampId], [EquipmentId], [RequiredNumber], [AvailableNumber], [CampEquipmentStatus], [CampEquipmentMemo], [CreationDate], [AddBy], [UpdatedDate], [UpdatedBy]) VALUES (1, 2, 36, 66, 1, 1, 1, N'1', N'', CAST(N'2018-08-12T13:26:00' AS SmallDateTime), 2, NULL, 2)
INSERT [dbo].[tblCampEquipment] ([CampEquipmentId], [YearId], [CountryId], [CampId], [EquipmentId], [RequiredNumber], [AvailableNumber], [CampEquipmentStatus], [CampEquipmentMemo], [CreationDate], [AddBy], [UpdatedDate], [UpdatedBy]) VALUES (2, 2, 36, 66, 2, 2, 1, N'1', N'', CAST(N'2018-08-12T13:26:00' AS SmallDateTime), 2, NULL, 2)
INSERT [dbo].[tblCampEquipment] ([CampEquipmentId], [YearId], [CountryId], [CampId], [EquipmentId], [RequiredNumber], [AvailableNumber], [CampEquipmentStatus], [CampEquipmentMemo], [CreationDate], [AddBy], [UpdatedDate], [UpdatedBy]) VALUES (3, 2, 36, 66, 3, 12, 2, N'0', N'لا يكفي', CAST(N'2018-08-12T13:26:00' AS SmallDateTime), 2, NULL, 2)
INSERT [dbo].[tblCampEquipment] ([CampEquipmentId], [YearId], [CountryId], [CampId], [EquipmentId], [RequiredNumber], [AvailableNumber], [CampEquipmentStatus], [CampEquipmentMemo], [CreationDate], [AddBy], [UpdatedDate], [UpdatedBy]) VALUES (4, 2, 36, 66, 4, 1, 1, N'1', N'', CAST(N'2018-08-12T13:26:00' AS SmallDateTime), 2, NULL, 2)
INSERT [dbo].[tblCampEquipment] ([CampEquipmentId], [YearId], [CountryId], [CampId], [EquipmentId], [RequiredNumber], [AvailableNumber], [CampEquipmentStatus], [CampEquipmentMemo], [CreationDate], [AddBy], [UpdatedDate], [UpdatedBy]) VALUES (5, 2, 36, 66, 5, 2, 1, N'2', N'', CAST(N'2018-08-12T13:26:00' AS SmallDateTime), 2, NULL, 2)
INSERT [dbo].[tblCampEquipment] ([CampEquipmentId], [YearId], [CountryId], [CampId], [EquipmentId], [RequiredNumber], [AvailableNumber], [CampEquipmentStatus], [CampEquipmentMemo], [CreationDate], [AddBy], [UpdatedDate], [UpdatedBy]) VALUES (6, 2, 36, 66, 6, 16, 9, N'0', N'', CAST(N'2018-08-12T13:26:00' AS SmallDateTime), 2, NULL, 2)
INSERT [dbo].[tblCampEquipment] ([CampEquipmentId], [YearId], [CountryId], [CampId], [EquipmentId], [RequiredNumber], [AvailableNumber], [CampEquipmentStatus], [CampEquipmentMemo], [CreationDate], [AddBy], [UpdatedDate], [UpdatedBy]) VALUES (7, 2, 36, 66, 7, 8, 5, N'1', N'', CAST(N'2018-08-12T13:26:00' AS SmallDateTime), 2, NULL, 2)
INSERT [dbo].[tblCampEquipment] ([CampEquipmentId], [YearId], [CountryId], [CampId], [EquipmentId], [RequiredNumber], [AvailableNumber], [CampEquipmentStatus], [CampEquipmentMemo], [CreationDate], [AddBy], [UpdatedDate], [UpdatedBy]) VALUES (8, 2, 36, 66, 8, 2, 1, N'2', N'', CAST(N'2018-08-12T13:26:00' AS SmallDateTime), 2, NULL, 2)
ALTER TABLE [dbo].[tblCampEquipment] ADD  CONSTRAINT [DF_tblCampEquipment_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
