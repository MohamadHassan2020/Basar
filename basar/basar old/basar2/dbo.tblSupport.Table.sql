USE [Basar]
GO
/****** Object:  Table [dbo].[tblSupport]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSupport](
	[SupportId] [tinyint] IDENTITY(1,1) NOT NULL,
	[SupportDescAr] [nvarchar](50) NULL,
	[SupportDescEn] [nvarchar](50) NULL,
	[SupportStatus] [bit] NULL,
	[SupportOrder] [tinyint] NULL,
	[CreationDate] [smalldatetime] NULL,
	[CreationBy] [smallint] NULL,
	[UpdatedDate] [smalldatetime] NULL,
	[UpdatedBy] [smallint] NULL,
 CONSTRAINT [PK_tblSupport] PRIMARY KEY CLUSTERED 
(
	[SupportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblSupport] ON 

INSERT [dbo].[tblSupport] ([SupportId], [SupportDescAr], [SupportDescEn], [SupportStatus], [SupportOrder], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'الجهة الداعمة', NULL, 1, NULL, CAST(N'2017-06-24T13:44:00' AS SmallDateTime), NULL, NULL, NULL)
INSERT [dbo].[tblSupport] ([SupportId], [SupportDescAr], [SupportDescEn], [SupportStatus], [SupportOrder], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'إدارة المخيمات', NULL, 1, NULL, CAST(N'2017-06-24T13:44:00' AS SmallDateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblSupport] OFF
ALTER TABLE [dbo].[tblSupport] ADD  CONSTRAINT [DF_tblSupport_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
