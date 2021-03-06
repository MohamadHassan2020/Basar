USE [Basar]
GO
/****** Object:  Table [dbo].[tblProcedureType]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProcedureType](
	[ProcedureTypeId] [tinyint] IDENTITY(1,1) NOT NULL,
	[ProcedureTypeDsecAr] [nvarchar](50) NULL,
	[ProcedureTypeDsecEn] [nvarchar](50) NULL,
	[CreationDate] [smalldatetime] NULL,
	[CreationBy] [smallint] NULL,
	[UpdatedDate] [smalldatetime] NULL,
	[UpdatedBy] [smallint] NULL,
	[ProcedureTypeOrder] [smallint] NULL,
	[ProcedureTypeStatus] [bit] NULL,
	[ProcedureTypeDivider] [varchar](1) NULL,
 CONSTRAINT [PK_tblProcedureType] PRIMARY KEY CLUSTERED 
(
	[ProcedureTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblProcedureType] ON 

INSERT [dbo].[tblProcedureType] ([ProcedureTypeId], [ProcedureTypeDsecAr], [ProcedureTypeDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [ProcedureTypeOrder], [ProcedureTypeStatus], [ProcedureTypeDivider]) VALUES (1, N'لا يحتاج', N'None', CAST(N'2017-07-22T12:26:00' AS SmallDateTime), 1, NULL, 1, NULL, 1, N'1')
INSERT [dbo].[tblProcedureType] ([ProcedureTypeId], [ProcedureTypeDsecAr], [ProcedureTypeDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [ProcedureTypeOrder], [ProcedureTypeStatus], [ProcedureTypeDivider]) VALUES (2, N'لا يحتاج', N'None', CAST(N'2017-07-22T12:26:00' AS SmallDateTime), 1, NULL, 1, NULL, 1, N'2')
INSERT [dbo].[tblProcedureType] ([ProcedureTypeId], [ProcedureTypeDsecAr], [ProcedureTypeDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [ProcedureTypeOrder], [ProcedureTypeStatus], [ProcedureTypeDivider]) VALUES (3, N'لا يحتاج', N'None', CAST(N'2017-07-22T12:26:00' AS SmallDateTime), 1, NULL, 1, NULL, 1, N'3')
INSERT [dbo].[tblProcedureType] ([ProcedureTypeId], [ProcedureTypeDsecAr], [ProcedureTypeDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [ProcedureTypeOrder], [ProcedureTypeStatus], [ProcedureTypeDivider]) VALUES (4, N'يحتاج تأشيرة', N'None', CAST(N'2017-07-22T12:26:00' AS SmallDateTime), 1, NULL, 1, NULL, 1, N'1')
INSERT [dbo].[tblProcedureType] ([ProcedureTypeId], [ProcedureTypeDsecAr], [ProcedureTypeDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [ProcedureTypeOrder], [ProcedureTypeStatus], [ProcedureTypeDivider]) VALUES (5, N'تحت الإجراء', N'None', CAST(N'2017-07-22T12:26:00' AS SmallDateTime), 1, NULL, 1, NULL, 1, N'1')
INSERT [dbo].[tblProcedureType] ([ProcedureTypeId], [ProcedureTypeDsecAr], [ProcedureTypeDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [ProcedureTypeOrder], [ProcedureTypeStatus], [ProcedureTypeDivider]) VALUES (6, N'تم طلب تأشيرة', N'None', CAST(N'2017-07-22T12:26:00' AS SmallDateTime), 1, NULL, 1, NULL, 1, N'1')
INSERT [dbo].[tblProcedureType] ([ProcedureTypeId], [ProcedureTypeDsecAr], [ProcedureTypeDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [ProcedureTypeOrder], [ProcedureTypeStatus], [ProcedureTypeDivider]) VALUES (7, N'تم إصدارة تأشيرة', N'None', CAST(N'2017-07-22T12:26:00' AS SmallDateTime), 1, NULL, 1, NULL, 1, N'1')
INSERT [dbo].[tblProcedureType] ([ProcedureTypeId], [ProcedureTypeDsecAr], [ProcedureTypeDsecEn], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [ProcedureTypeOrder], [ProcedureTypeStatus], [ProcedureTypeDivider]) VALUES (8, N'يحتاج تصريح', N'None', CAST(N'2017-07-22T12:26:00' AS SmallDateTime), 1, NULL, 1, NULL, 1, N'2')
SET IDENTITY_INSERT [dbo].[tblProcedureType] OFF
ALTER TABLE [dbo].[tblProcedureType] ADD  CONSTRAINT [DF_tblProcedureType_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[tblProcedureType] ADD  CONSTRAINT [DF_Table_1_TeamClassStatus_1]  DEFAULT ((1)) FOR [ProcedureTypeStatus]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=Visa,2=Permit,3=Ticket' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblProcedureType', @level2type=N'COLUMN',@level2name=N'ProcedureTypeDivider'
GO
