USE [Basar]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[UserId] [smallint] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[UserPassword] [nvarchar](100) NULL,
	[UserEmail] [nvarchar](100) NULL,
	[UserCode] [nvarchar](20) NULL,
	[CreationDate] [smalldatetime] NULL,
	[CreationBy] [smallint] NULL,
	[UpdatedDate] [smalldatetime] NULL,
	[UpdatedBy] [smallint] NULL,
	[OutlineStatus] [bit] NULL,
	[AdminStatus] [bit] NULL,
	[TeamStatus] [bit] NULL,
	[IsHome] [bit] NULL,
	[IsArchive] [bit] NULL,
	[IsReported] [bit] NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblUsers] ON 

INSERT [dbo].[tblUsers] ([UserId], [UserName], [UserPassword], [UserEmail], [UserCode], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [OutlineStatus], [AdminStatus], [TeamStatus], [IsHome], [IsArchive], [IsReported]) VALUES (1, N'د صادق الدعيس', N'7C4A8D09CA3762AF61E59520943DC26494F8941B', N'esc_free@yahoo.com', N'sadiq101', CAST(N'2017-06-29T22:43:00' AS SmallDateTime), 1, CAST(N'2017-06-29T22:43:00' AS SmallDateTime), 1, 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [UserPassword], [UserEmail], [UserCode], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [OutlineStatus], [AdminStatus], [TeamStatus], [IsHome], [IsArchive], [IsReported]) VALUES (2, N'د زياد السويدان', N'7C4A8D09CA3762AF61E59520943DC26494F8941B', N'esc_free@yahoo.com', N'100', CAST(N'2017-06-29T23:18:00' AS SmallDateTime), 1, CAST(N'2017-06-29T23:18:00' AS SmallDateTime), 1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [UserPassword], [UserEmail], [UserCode], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [OutlineStatus], [AdminStatus], [TeamStatus], [IsHome], [IsArchive], [IsReported]) VALUES (3, N'السودان', N'7C4A8D09CA3762AF61E59520943DC26494F8941B', N'', N'123456', CAST(N'2017-12-16T07:21:00' AS SmallDateTime), 1, NULL, NULL, 0, 0, 1, NULL, NULL, NULL)
INSERT [dbo].[tblUsers] ([UserId], [UserName], [UserPassword], [UserEmail], [UserCode], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy], [OutlineStatus], [AdminStatus], [TeamStatus], [IsHome], [IsArchive], [IsReported]) VALUES (4, N'مدير نظام السودان', N'7C4A8D09CA3762AF61E59520943DC26494F8941B', N'esc@yahoo.com', N'101010', CAST(N'2018-06-26T02:24:00' AS SmallDateTime), 2, CAST(N'2018-06-26T02:24:00' AS SmallDateTime), 2, 1, 1, 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tblUsers] OFF
ALTER TABLE [dbo].[tblUsers] ADD  CONSTRAINT [DF_tblUsers_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
