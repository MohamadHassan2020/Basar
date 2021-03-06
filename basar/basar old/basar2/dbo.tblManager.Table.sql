USE [Basar]
GO
/****** Object:  Table [dbo].[tblManager]    Script Date: 4/29/2020 2:10:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblManager](
	[ManagerId] [smallint] NOT NULL,
	[ManagerName] [nvarchar](50) NULL,
	[ManagerNameEN] [nvarchar](50) NULL,
	[CreationDate] [smalldatetime] NULL,
	[CreationBy] [smallint] NULL,
	[UpdatedDate] [smalldatetime] NULL,
	[UpdatedBy] [smallint] NULL,
	[ManagerOrder] [smallint] NULL,
	[ManagerStatus] [bit] NULL,
	[ManagerFlag] [nvarchar](100) NULL,
	[ManagerType] [varchar](1) NULL,
 CONSTRAINT [PK_tblManager] PRIMARY KEY CLUSTERED 
(
	[ManagerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblManager] ([ManagerId], [ManagerName], [ManagerNameEN], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [ManagerOrder], [ManagerStatus], [ManagerFlag], [ManagerType]) VALUES (1, N'د زياد السويدان', N'د زياد السويدان', CAST(N'2019-03-17T11:12:00' AS SmallDateTime), 1, NULL, NULL, 1, 1, NULL, N'1')
INSERT [dbo].[tblManager] ([ManagerId], [ManagerName], [ManagerNameEN], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [ManagerOrder], [ManagerStatus], [ManagerFlag], [ManagerType]) VALUES (2, N'د صادق', N'د صادق', CAST(N'2019-03-17T11:12:00' AS SmallDateTime), 1, NULL, NULL, 1, 1, NULL, N'2')
ALTER TABLE [dbo].[tblManager] ADD  CONSTRAINT [DF_tblManager_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[tblManager] ADD  CONSTRAINT [DF_Table_1_TeamStatus_3]  DEFAULT ((1)) FOR [ManagerStatus]
GO
