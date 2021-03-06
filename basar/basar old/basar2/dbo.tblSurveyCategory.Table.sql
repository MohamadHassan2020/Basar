USE [Basar]
GO
/****** Object:  Table [dbo].[tblSurveyCategory]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSurveyCategory](
	[SurveyCategoryId] [tinyint] IDENTITY(1,1) NOT NULL,
	[SurveyCategoryDescAr] [nvarchar](50) NULL,
	[SurveyCategoryDescEn] [nvarchar](50) NULL,
	[SurveyCategoryStatus] [bit] NULL,
	[SurveyCategoryOrder] [tinyint] NULL,
	[CreationDate] [smalldatetime] NULL,
	[CreationBy] [smallint] NULL,
	[UpdatedDate] [smalldatetime] NULL,
	[UpdatedBy] [smallint] NULL,
 CONSTRAINT [PK_tblSurveyCategory] PRIMARY KEY CLUSTERED 
(
	[SurveyCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblSurveyCategory] ON 

INSERT [dbo].[tblSurveyCategory] ([SurveyCategoryId], [SurveyCategoryDescAr], [SurveyCategoryDescEn], [SurveyCategoryStatus], [SurveyCategoryOrder], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy]) VALUES (1, N'قسم العمليات', N'OR', 1, 1, CAST(N'2017-11-30T20:17:00' AS SmallDateTime), 1, CAST(N'2017-11-30T20:17:00' AS SmallDateTime), 1)
INSERT [dbo].[tblSurveyCategory] ([SurveyCategoryId], [SurveyCategoryDescAr], [SurveyCategoryDescEn], [SurveyCategoryStatus], [SurveyCategoryOrder], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy]) VALUES (2, N'العنابر', N'WORD', 1, 1, CAST(N'2017-11-30T20:17:00' AS SmallDateTime), 1, CAST(N'2017-11-30T20:17:00' AS SmallDateTime), 1)
INSERT [dbo].[tblSurveyCategory] ([SurveyCategoryId], [SurveyCategoryDescAr], [SurveyCategoryDescEn], [SurveyCategoryStatus], [SurveyCategoryOrder], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy]) VALUES (3, N'العيادات', N'OPD', 1, 1, CAST(N'2017-12-03T17:28:00' AS SmallDateTime), 1, CAST(N'2017-12-03T17:29:00' AS SmallDateTime), 1)
INSERT [dbo].[tblSurveyCategory] ([SurveyCategoryId], [SurveyCategoryDescAr], [SurveyCategoryDescEn], [SurveyCategoryStatus], [SurveyCategoryOrder], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy]) VALUES (4, N'السكن', N'Accommodation', 1, 1, CAST(N'2017-12-03T17:29:00' AS SmallDateTime), 1, CAST(N'2017-12-03T17:29:00' AS SmallDateTime), 1)
INSERT [dbo].[tblSurveyCategory] ([SurveyCategoryId], [SurveyCategoryDescAr], [SurveyCategoryDescEn], [SurveyCategoryStatus], [SurveyCategoryOrder], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy]) VALUES (5, N'الكهرباء', N'Electricity', 1, 1, CAST(N'2017-12-03T17:30:00' AS SmallDateTime), 1, CAST(N'2017-12-03T17:30:00' AS SmallDateTime), 1)
INSERT [dbo].[tblSurveyCategory] ([SurveyCategoryId], [SurveyCategoryDescAr], [SurveyCategoryDescEn], [SurveyCategoryStatus], [SurveyCategoryOrder], [CreationDate], [CreationBy], [UpdatedDate], [UpdatedBy]) VALUES (6, N'القوه العاملة المحلية', N'Local Orgniziation', 1, 1, CAST(N'2017-12-03T17:31:00' AS SmallDateTime), 1, CAST(N'2017-12-03T17:31:00' AS SmallDateTime), 1)
SET IDENTITY_INSERT [dbo].[tblSurveyCategory] OFF
ALTER TABLE [dbo].[tblSurveyCategory] ADD  CONSTRAINT [DF_tblSurveyCategory_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
