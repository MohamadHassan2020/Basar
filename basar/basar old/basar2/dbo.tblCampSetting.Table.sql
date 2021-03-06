USE [Basar]
GO
/****** Object:  Table [dbo].[tblCampSetting]    Script Date: 4/29/2020 2:10:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCampSetting](
	[CampSettingId] [tinyint] IDENTITY(1,1) NOT NULL,
	[CampSettingDescAr] [nvarchar](50) NULL,
	[CampSettingDescEn] [nvarchar](50) NULL,
	[CampSettingStatus] [bit] NULL,
	[CampSettingOrder] [tinyint] NULL,
	[CreationDate] [smalldatetime] NULL,
	[CreationBy] [smallint] NULL,
	[UpdatedDate] [smalldatetime] NULL,
	[UpdatedBy] [smallint] NULL,
 CONSTRAINT [PK_tblCampSetting] PRIMARY KEY CLUSTERED 
(
	[CampSettingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCampSetting] ADD  CONSTRAINT [DF_tblCampSetting_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
