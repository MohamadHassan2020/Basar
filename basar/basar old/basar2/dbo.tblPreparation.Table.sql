USE [Basar]
GO
/****** Object:  Table [dbo].[tblPreparation]    Script Date: 4/29/2020 2:10:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPreparation](
	[PreparationId] [smallint] NOT NULL,
	[YearId] [tinyint] NULL,
	[TeamId] [smallint] NULL,
	[TourId] [smallint] NULL,
	[CampId] [smallint] NULL,
	[SponsorId] [smallint] NULL,
	[PreparationRemark] [nvarchar](255) NULL,
	[PreparationDate] [smalldatetime] NULL,
	[PreparationBy] [smallint] NULL,
	[UpdatedDate] [smalldatetime] NULL,
	[UpdatedBy] [smallint] NULL,
 CONSTRAINT [PK_tblPreparation] PRIMARY KEY CLUSTERED 
(
	[PreparationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblPreparation] ADD  CONSTRAINT [DF_tblPreparation_CreationDate]  DEFAULT (getdate()) FOR [PreparationDate]
GO
