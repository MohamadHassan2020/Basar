USE [Basar]
GO
/****** Object:  Table [dbo].[tblCampSupportAssistance]    Script Date: 4/29/2020 2:10:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCampSupportAssistance](
	[CampSupportAssistanceId] [int] NOT NULL,
	[YearId] [tinyint] NOT NULL,
	[CountryId] [tinyint] NOT NULL,
	[CampId] [smallint] NOT NULL,
	[PermitId] [smallint] NULL,
	[VisaId] [tinyint] NULL,
	[AdvertisementId] [tinyint] NULL,
	[AccommodationId] [tinyint] NULL,
	[PhysicainRegStatus] [varchar](1) NULL,
	[TranslatorsRegStatus] [varchar](1) NULL,
	[TranslatorsRemark] [nvarchar](100) NULL,
	[CustomsClearanceId] [tinyint] NULL,
	[TransportationId] [tinyint] NULL,
	[VolunteersRegStatus] [varchar](1) NULL,
	[VolunteersRemark] [nvarchar](100) NULL,
	[OrganizationalTeamStatus] [varchar](1) NULL,
	[OrganizationalTeamRemark] [nvarchar](100) NULL,
	[CreationDate] [smalldatetime] NULL,
	[AddBy] [smallint] NULL,
	[UpdatedDate] [smalldatetime] NULL,
	[UpdatedBy] [smallint] NULL,
 CONSTRAINT [PK_tblCampSupportAssistance] PRIMARY KEY CLUSTERED 
(
	[CampSupportAssistanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblCampSupportAssistance] ([CampSupportAssistanceId], [YearId], [CountryId], [CampId], [PermitId], [VisaId], [AdvertisementId], [AccommodationId], [PhysicainRegStatus], [TranslatorsRegStatus], [TranslatorsRemark], [CustomsClearanceId], [TransportationId], [VolunteersRegStatus], [VolunteersRemark], [OrganizationalTeamStatus], [OrganizationalTeamRemark], [CreationDate], [AddBy], [UpdatedDate], [UpdatedBy]) VALUES (1, 2, 36, 66, 2, 3, 5, 2, N'0', N'1', N'', 4, 4, N'1', N'', N'2', N'', CAST(N'2018-08-10T20:04:00' AS SmallDateTime), 2, NULL, 2)
ALTER TABLE [dbo].[tblCampSupportAssistance] ADD  CONSTRAINT [DF_tblCampSupportAssistance_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
