USE [Basar]
GO
/****** Object:  Table [dbo].[tblMedicinesCategory]    Script Date: 4/29/2020 2:10:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMedicinesCategory](
	[MedicinesCategoryId] [tinyint] IDENTITY(1,1) NOT NULL,
	[MedicinesCategoryNameAr] [nvarchar](100) NULL,
	[MedicinesCategoryNameEn] [nvarchar](100) NULL,
	[CreationDate] [smalldatetime] NULL,
	[MedicinesCategoryStatus] [bit] NULL,
	[MedicinesCategoryOrder] [tinyint] NULL,
 CONSTRAINT [PK_tblMedicinesCategory] PRIMARY KEY CLUSTERED 
(
	[MedicinesCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblMedicinesCategory] ON 

INSERT [dbo].[tblMedicinesCategory] ([MedicinesCategoryId], [MedicinesCategoryNameAr], [MedicinesCategoryNameEn], [CreationDate], [MedicinesCategoryStatus], [MedicinesCategoryOrder]) VALUES (1, N'DROPS', N'DROPS', CAST(N'2017-07-29T13:53:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[tblMedicinesCategory] ([MedicinesCategoryId], [MedicinesCategoryNameAr], [MedicinesCategoryNameEn], [CreationDate], [MedicinesCategoryStatus], [MedicinesCategoryOrder]) VALUES (2, N'OINTMENTS', N'OINTMENTS', CAST(N'2017-07-29T13:53:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[tblMedicinesCategory] ([MedicinesCategoryId], [MedicinesCategoryNameAr], [MedicinesCategoryNameEn], [CreationDate], [MedicinesCategoryStatus], [MedicinesCategoryOrder]) VALUES (3, N'TABLETS', N'TABLETS', CAST(N'2017-07-29T13:54:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[tblMedicinesCategory] ([MedicinesCategoryId], [MedicinesCategoryNameAr], [MedicinesCategoryNameEn], [CreationDate], [MedicinesCategoryStatus], [MedicinesCategoryOrder]) VALUES (4, N'SPECTACLES', N'SPECTACLES', CAST(N'2017-07-29T13:54:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[tblMedicinesCategory] ([MedicinesCategoryId], [MedicinesCategoryNameAr], [MedicinesCategoryNameEn], [CreationDate], [MedicinesCategoryStatus], [MedicinesCategoryOrder]) VALUES (5, N'DISPOSABLE SYRINGE', N'DISPOSABLE SYRINGE', CAST(N'2017-07-29T13:54:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[tblMedicinesCategory] ([MedicinesCategoryId], [MedicinesCategoryNameAr], [MedicinesCategoryNameEn], [CreationDate], [MedicinesCategoryStatus], [MedicinesCategoryOrder]) VALUES (6, N'INJECTION', N'INJECTION', CAST(N'2017-07-29T13:54:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[tblMedicinesCategory] ([MedicinesCategoryId], [MedicinesCategoryNameAr], [MedicinesCategoryNameEn], [CreationDate], [MedicinesCategoryStatus], [MedicinesCategoryOrder]) VALUES (7, N'SURGICAL GLOVES', N'SURGICAL GLOVES', CAST(N'2017-07-29T13:54:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[tblMedicinesCategory] ([MedicinesCategoryId], [MedicinesCategoryNameAr], [MedicinesCategoryNameEn], [CreationDate], [MedicinesCategoryStatus], [MedicinesCategoryOrder]) VALUES (8, N'SUTURES', N'SUTURES', CAST(N'2017-07-29T13:54:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[tblMedicinesCategory] ([MedicinesCategoryId], [MedicinesCategoryNameAr], [MedicinesCategoryNameEn], [CreationDate], [MedicinesCategoryStatus], [MedicinesCategoryOrder]) VALUES (9, N'OTHER SUPPLIES', N'OTHER SUPPLIES', CAST(N'2017-07-29T13:54:00' AS SmallDateTime), 1, 1)
SET IDENTITY_INSERT [dbo].[tblMedicinesCategory] OFF
ALTER TABLE [dbo].[tblMedicinesCategory] ADD  CONSTRAINT [DF_tblMedicinesCategory_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[tblMedicinesCategory] ADD  CONSTRAINT [DF_Table_1_YearStatus]  DEFAULT ((1)) FOR [MedicinesCategoryStatus]
GO
