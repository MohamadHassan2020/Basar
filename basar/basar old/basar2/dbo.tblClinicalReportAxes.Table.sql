USE [Basar]
GO
/****** Object:  Table [dbo].[tblClinicalReportAxes]    Script Date: 4/29/2020 2:10:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblClinicalReportAxes](
	[AxesId] [smallint] NOT NULL,
	[AxesName] [nvarchar](50) NULL,
	[AxesEN] [nvarchar](50) NULL,
	[CreationDate] [smalldatetime] NULL,
	[CreationBy] [smallint] NULL,
	[UpdatedDate] [smalldatetime] NULL,
	[UpdatedBy] [smallint] NULL,
	[AxesOrder] [smallint] NULL,
	[AxesStatus] [bit] NULL,
 CONSTRAINT [PK_tblClinicalReportAxes] PRIMARY KEY CLUSTERED 
(
	[AxesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblClinicalReportAxes] ([AxesId], [AxesName], [AxesEN], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [AxesOrder], [AxesStatus]) VALUES (1, N'PHACO with PC IOL', N'PHACO with PC IOL', CAST(N'2019-03-17T08:35:00' AS SmallDateTime), 1, NULL, NULL, 2, 1)
INSERT [dbo].[tblClinicalReportAxes] ([AxesId], [AxesName], [AxesEN], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [AxesOrder], [AxesStatus]) VALUES (2, N'ECCE with PC IOL', N'ECCE with PC IOL', CAST(N'2019-03-17T08:35:00' AS SmallDateTime), 1, NULL, NULL, 2, 1)
INSERT [dbo].[tblClinicalReportAxes] ([AxesId], [AxesName], [AxesEN], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [AxesOrder], [AxesStatus]) VALUES (3, N'Total no. of patients attended ‘OPD’', N'Total no. of patients attended ‘OPD’', CAST(N'2019-03-17T08:35:00' AS SmallDateTime), 1, NULL, NULL, 1, 1)
INSERT [dbo].[tblClinicalReportAxes] ([AxesId], [AxesName], [AxesEN], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [AxesOrder], [AxesStatus]) VALUES (4, N'Total no. of patients admitted for surgery', N'Total no. of patients admitted for surgery', CAST(N'2019-03-17T08:36:00' AS SmallDateTime), 1, NULL, NULL, 1, 1)
ALTER TABLE [dbo].[tblClinicalReportAxes] ADD  CONSTRAINT [DF_tblClinicalReportAxes_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[tblClinicalReportAxes] ADD  CONSTRAINT [DF_Table_2_ManagerStatus]  DEFAULT ((1)) FOR [AxesStatus]
GO
