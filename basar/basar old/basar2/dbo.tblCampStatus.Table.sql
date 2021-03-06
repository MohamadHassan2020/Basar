USE [Basar]
GO
/****** Object:  Table [dbo].[tblCampStatus]    Script Date: 4/29/2020 2:10:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCampStatus](
	[CampStatusId] [smallint] NOT NULL,
	[CampStatusDescAR] [nvarchar](50) NULL,
	[CampStatusDescEN] [nvarchar](50) NULL,
	[CreationDate] [smalldatetime] NULL,
	[CampStatusEnabled] [bit] NULL,
	[AddBy] [smallint] NULL,
	[UpdatedDate] [smalldatetime] NULL,
	[UpdatedBy] [smallint] NULL,
	[CampStatusOrder] [smallint] NULL,
	[CampStatusImage] [nvarchar](20) NULL,
 CONSTRAINT [PK_tblCampStatus] PRIMARY KEY CLUSTERED 
(
	[CampStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblCampStatus] ([CampStatusId], [CampStatusDescAR], [CampStatusDescEN], [CreationDate], [CampStatusEnabled], [AddBy], [UpdatedDate], [UpdatedBy], [CampStatusOrder], [CampStatusImage]) VALUES (1, N'تحت التجهيز', N' ', CAST(N'2018-10-22T10:30:00' AS SmallDateTime), 1, NULL, NULL, NULL, NULL, N'schudle.gif')
INSERT [dbo].[tblCampStatus] ([CampStatusId], [CampStatusDescAR], [CampStatusDescEN], [CreationDate], [CampStatusEnabled], [AddBy], [UpdatedDate], [UpdatedBy], [CampStatusOrder], [CampStatusImage]) VALUES (2, N'تم الانتهاء', N' ', CAST(N'2018-10-22T10:31:00' AS SmallDateTime), 1, NULL, NULL, NULL, NULL, N'completed.gif')
INSERT [dbo].[tblCampStatus] ([CampStatusId], [CampStatusDescAR], [CampStatusDescEN], [CreationDate], [CampStatusEnabled], [AddBy], [UpdatedDate], [UpdatedBy], [CampStatusOrder], [CampStatusImage]) VALUES (3, N'تأجيل', N' ', CAST(N'2018-10-22T10:32:00' AS SmallDateTime), 1, NULL, NULL, NULL, NULL, N'lodding-orange.gif')
INSERT [dbo].[tblCampStatus] ([CampStatusId], [CampStatusDescAR], [CampStatusDescEN], [CreationDate], [CampStatusEnabled], [AddBy], [UpdatedDate], [UpdatedBy], [CampStatusOrder], [CampStatusImage]) VALUES (4, N'مجدولة', N'', CAST(N'2018-11-29T13:46:00' AS SmallDateTime), 1, NULL, NULL, NULL, NULL, N'time-Clock.gif')
ALTER TABLE [dbo].[tblCampStatus] ADD  CONSTRAINT [DF_tblCampStatus_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
