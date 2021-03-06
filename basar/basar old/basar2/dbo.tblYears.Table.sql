USE [Basar]
GO
/****** Object:  Table [dbo].[tblYears]    Script Date: 4/29/2020 2:10:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblYears](
	[YearId] [tinyint] NOT NULL,
	[YearNameAr] [smallint] NULL,
	[YearNameEn] [smallint] NULL,
	[CreationDate] [smalldatetime] NULL,
	[YearStatus] [bit] NULL,
	[YearOrder] [tinyint] NULL,
 CONSTRAINT [PK_tblYears] PRIMARY KEY CLUSTERED 
(
	[YearId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblYears] ([YearId], [YearNameAr], [YearNameEn], [CreationDate], [YearStatus], [YearOrder]) VALUES (1, 2017, 2017, CAST(N'2017-06-16T21:59:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[tblYears] ([YearId], [YearNameAr], [YearNameEn], [CreationDate], [YearStatus], [YearOrder]) VALUES (2, 2018, 2018, CAST(N'2017-06-16T21:59:00' AS SmallDateTime), 1, 2)
INSERT [dbo].[tblYears] ([YearId], [YearNameAr], [YearNameEn], [CreationDate], [YearStatus], [YearOrder]) VALUES (3, 2019, 2019, CAST(N'2017-06-16T21:59:00' AS SmallDateTime), 1, 3)
ALTER TABLE [dbo].[tblYears] ADD  CONSTRAINT [DF_tblYears_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[tblYears] ADD  CONSTRAINT [DF_tblYears_YearStatus]  DEFAULT ((1)) FOR [YearStatus]
GO
