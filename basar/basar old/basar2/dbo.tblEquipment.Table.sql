USE [Basar]
GO
/****** Object:  Table [dbo].[tblEquipment]    Script Date: 4/29/2020 2:10:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEquipment](
	[EquipmentId] [smallint] IDENTITY(1,1) NOT NULL,
	[EquipmentDescEn] [nvarchar](100) NULL,
	[EquipmentDescEnAr] [nvarchar](100) NULL,
	[EquipmentRequiredNumber] [smallint] NULL,
	[EquipmentStatus] [bit] NULL,
	[CreationDate] [smalldatetime] NULL,
	[AddBy] [smallint] NULL,
	[EquipmentDivider] [bit] NULL,
	[EquipmentOrder] [smallint] NULL,
 CONSTRAINT [PK_tblEquipment] PRIMARY KEY CLUSTERED 
(
	[EquipmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblEquipment] ON 

INSERT [dbo].[tblEquipment] ([EquipmentId], [EquipmentDescEn], [EquipmentDescEnAr], [EquipmentRequiredNumber], [EquipmentStatus], [CreationDate], [AddBy], [EquipmentDivider], [EquipmentOrder]) VALUES (1, N'Autoclave with extra rubbers and wires', N'جهاز تعقيم بخاري', 1, 1, CAST(N'2017-07-29T12:52:00' AS SmallDateTime), 1, 0, 1)
INSERT [dbo].[tblEquipment] ([EquipmentId], [EquipmentDescEn], [EquipmentDescEnAr], [EquipmentRequiredNumber], [EquipmentStatus], [CreationDate], [AddBy], [EquipmentDivider], [EquipmentOrder]) VALUES (2, N'Hot-air Oven with one dozen Instruments Tray', N'فرن تعقيم هوائي', 2, 1, CAST(N'2017-07-29T12:52:00' AS SmallDateTime), 1, 0, 1)
INSERT [dbo].[tblEquipment] ([EquipmentId], [EquipmentDescEn], [EquipmentDescEnAr], [EquipmentRequiredNumber], [EquipmentStatus], [CreationDate], [AddBy], [EquipmentDivider], [EquipmentOrder]) VALUES (3, N'Drums for the Autoclave', N'وعاء تعقيم', 12, 1, CAST(N'2017-08-01T08:18:00' AS SmallDateTime), 1, 0, 1)
INSERT [dbo].[tblEquipment] ([EquipmentId], [EquipmentDescEn], [EquipmentDescEnAr], [EquipmentRequiredNumber], [EquipmentStatus], [CreationDate], [AddBy], [EquipmentDivider], [EquipmentOrder]) VALUES (4, N'Boiler', N'غلاية تعقيم', 1, 1, CAST(N'2017-08-01T08:24:00' AS SmallDateTime), 1, 0, 1)
INSERT [dbo].[tblEquipment] ([EquipmentId], [EquipmentDescEn], [EquipmentDescEnAr], [EquipmentRequiredNumber], [EquipmentStatus], [CreationDate], [AddBy], [EquipmentDivider], [EquipmentOrder]) VALUES (5, N'Chattels forceps with jar', N'ملقاط جتل مع وعاء', 2, 1, CAST(N'2017-08-01T08:25:00' AS SmallDateTime), 1, 0, 1)
INSERT [dbo].[tblEquipment] ([EquipmentId], [EquipmentDescEn], [EquipmentDescEnAr], [EquipmentRequiredNumber], [EquipmentStatus], [CreationDate], [AddBy], [EquipmentDivider], [EquipmentOrder]) VALUES (6, N'Kidney tray', N'حوض كلوي', 16, 1, CAST(N'2017-08-01T08:25:00' AS SmallDateTime), 1, 0, 1)
INSERT [dbo].[tblEquipment] ([EquipmentId], [EquipmentDescEn], [EquipmentDescEnAr], [EquipmentRequiredNumber], [EquipmentStatus], [CreationDate], [AddBy], [EquipmentDivider], [EquipmentOrder]) VALUES (7, N'Bowl big/small sizes', N'كورة تعقيم', 8, 1, CAST(N'2017-08-01T08:26:00' AS SmallDateTime), 1, 0, 1)
INSERT [dbo].[tblEquipment] ([EquipmentId], [EquipmentDescEn], [EquipmentDescEnAr], [EquipmentRequiredNumber], [EquipmentStatus], [CreationDate], [AddBy], [EquipmentDivider], [EquipmentOrder]) VALUES (8, N'Electric Board & Big Scissors (two each)', N'وصلات كهربائية ومقصات', 2, 1, CAST(N'2017-08-01T08:26:00' AS SmallDateTime), 1, 0, 1)
INSERT [dbo].[tblEquipment] ([EquipmentId], [EquipmentDescEn], [EquipmentDescEnAr], [EquipmentRequiredNumber], [EquipmentStatus], [CreationDate], [AddBy], [EquipmentDivider], [EquipmentOrder]) VALUES (9, N'Microscopes (Takagi OM5) ', N'ميكروسكوب تاكاجي', 3, 1, CAST(N'2017-08-01T08:26:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblEquipment] ([EquipmentId], [EquipmentDescEn], [EquipmentDescEnAr], [EquipmentRequiredNumber], [EquipmentStatus], [CreationDate], [AddBy], [EquipmentDivider], [EquipmentOrder]) VALUES (10, N'Phaco emulsifier machine (Ortely)', N'جهاز ازالة المياه البيضاء فيكو', 2, 1, CAST(N'2017-08-01T08:33:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblEquipment] ([EquipmentId], [EquipmentDescEn], [EquipmentDescEnAr], [EquipmentRequiredNumber], [EquipmentStatus], [CreationDate], [AddBy], [EquipmentDivider], [EquipmentOrder]) VALUES (11, N'A Scan or AB Scan', N'جهاز مقاس العدسة', 1, 1, CAST(N'2017-08-01T08:33:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblEquipment] ([EquipmentId], [EquipmentDescEn], [EquipmentDescEnAr], [EquipmentRequiredNumber], [EquipmentStatus], [CreationDate], [AddBy], [EquipmentDivider], [EquipmentOrder]) VALUES (12, N'Portable Slit-lamp', N'جهاز ضوئي محمول لفحص قاع العين', 1, 1, CAST(N'2017-08-01T08:33:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblEquipment] ([EquipmentId], [EquipmentDescEn], [EquipmentDescEnAr], [EquipmentRequiredNumber], [EquipmentStatus], [CreationDate], [AddBy], [EquipmentDivider], [EquipmentOrder]) VALUES (13, N'Ophthalmoscope/Retina-scope with charger', N'منظار يدوي', 6, 1, CAST(N'2017-08-01T08:33:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblEquipment] ([EquipmentId], [EquipmentDescEn], [EquipmentDescEnAr], [EquipmentRequiredNumber], [EquipmentStatus], [CreationDate], [AddBy], [EquipmentDivider], [EquipmentOrder]) VALUES (14, N'Trial Box and Vision Charts (10) ', N'حقيبة عدسات لفحص النظر', 1, 1, CAST(N'2017-08-01T08:33:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblEquipment] ([EquipmentId], [EquipmentDescEn], [EquipmentDescEnAr], [EquipmentRequiredNumber], [EquipmentStatus], [CreationDate], [AddBy], [EquipmentDivider], [EquipmentOrder]) VALUES (15, N'Tonometer (Schiotz) or Tonopen', N'مقاس ضغط العين', 4, 1, CAST(N'2017-08-01T08:33:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblEquipment] ([EquipmentId], [EquipmentDescEn], [EquipmentDescEnAr], [EquipmentRequiredNumber], [EquipmentStatus], [CreationDate], [AddBy], [EquipmentDivider], [EquipmentOrder]) VALUES (16, N'B.P Instrument with Stethoscope', N'قياس ضغط الدم مع سماعه', 3, 1, CAST(N'2017-08-01T08:33:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblEquipment] ([EquipmentId], [EquipmentDescEn], [EquipmentDescEnAr], [EquipmentRequiredNumber], [EquipmentStatus], [CreationDate], [AddBy], [EquipmentDivider], [EquipmentOrder]) VALUES (17, N'Torches', N'مصباح يديو', 6, 1, CAST(N'2017-08-01T08:33:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblEquipment] ([EquipmentId], [EquipmentDescEn], [EquipmentDescEnAr], [EquipmentRequiredNumber], [EquipmentStatus], [CreationDate], [AddBy], [EquipmentDivider], [EquipmentOrder]) VALUES (18, N'Extension Tee ', N'وصلة كهرباء', 5, 1, CAST(N'2017-08-01T08:33:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblEquipment] ([EquipmentId], [EquipmentDescEn], [EquipmentDescEnAr], [EquipmentRequiredNumber], [EquipmentStatus], [CreationDate], [AddBy], [EquipmentDivider], [EquipmentOrder]) VALUES (19, N'Stabilizers', N'منظم كهرباء', 1, 1, CAST(N'2017-08-01T08:33:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblEquipment] ([EquipmentId], [EquipmentDescEn], [EquipmentDescEnAr], [EquipmentRequiredNumber], [EquipmentStatus], [CreationDate], [AddBy], [EquipmentDivider], [EquipmentOrder]) VALUES (20, N'Bulbs: Ophthalmoscope, Retina-scope, Microscope & OT light (Approx)', N'لمبات منظار العين ولمبات منظار الشبكية', 1, 1, CAST(N'2017-08-01T08:33:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblEquipment] ([EquipmentId], [EquipmentDescEn], [EquipmentDescEnAr], [EquipmentRequiredNumber], [EquipmentStatus], [CreationDate], [AddBy], [EquipmentDivider], [EquipmentOrder]) VALUES (21, N'Cuttings Instruments (Two Brief Cases) ', N'مشارط جراحية', 25, 1, CAST(N'2017-08-01T08:33:00' AS SmallDateTime), 1, 1, 1)
INSERT [dbo].[tblEquipment] ([EquipmentId], [EquipmentDescEn], [EquipmentDescEnAr], [EquipmentRequiredNumber], [EquipmentStatus], [CreationDate], [AddBy], [EquipmentDivider], [EquipmentOrder]) VALUES (22, N'Towels', N'مناشف', 400, 1, CAST(N'2017-08-01T08:33:00' AS SmallDateTime), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[tblEquipment] OFF
ALTER TABLE [dbo].[tblEquipment] ADD  CONSTRAINT [DF_tblEquipment_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
