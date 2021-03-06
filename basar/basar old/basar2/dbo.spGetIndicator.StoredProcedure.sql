USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spGetIndicator]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spGetIndicator]
		@YearId					tinyint			=NULL,
		@CountryId				tinyint			=NULL,
		@CampId					smallint		=NULL,
		@IndicatorDivider		bit				=NULL,
		@SurveyCategoryId		tinyint			=NULL
		
		AS
BEGIN


IF NOT EXISTS(SELECT        PreliminaryId FROM dbo.tblPreliminary 
							WHERE        (YearId = @YearId) 
											AND (CountryId = @CountryId) 
											AND (CampId = @CampId) 
											AND (SurveyCategoryId = @SurveyCategoryId) 
											AND (IndicatorDivider=@IndicatorDivider))
											BEGIN




													SELECT        IndicatorId, SurveyCategoryId, IndicatorStatus, IndicatorDivider, IndicatorDescAr, IndicatorDescEn, IndicatorOrder, IndicatorNumber

													 ,NULL AS AvailableNumber,
													  NULL AS MissingNumber, 
													  NULL AS CampIndicatorStatus,
													   NULL AS CampIndicatorMemo,
													  NULL AS AddUserName,
													  NULL AS UpdatedUserName
														FROM            dbo.tblIndicator
														WHERE        (SurveyCategoryId = @SurveyCategoryId) AND (IndicatorDivider = @IndicatorDivider)



									END
									ELSE
									BEGIN
									 

										SELECT        dbo.tblIndicator.IndicatorId, dbo.tblIndicator.SurveyCategoryId, dbo.tblIndicator.IndicatorStatus, dbo.tblIndicator.IndicatorDivider, dbo.tblIndicator.IndicatorDescAr, dbo.tblIndicator.IndicatorDescEn, dbo.tblIndicator.IndicatorOrder, 
																 dbo.tblIndicator.IndicatorNumber, dbo.tblPreliminary.RequiredNumber, dbo.tblPreliminary.AvailableNumber, dbo.tblPreliminary.MissingNumber, dbo.tblPreliminary.CampIndicatorStatus, dbo.tblPreliminary.CampIndicatorMemo, 
																 dbo.tblUsers.UserName AS AddUserName, tblUsers_1.UserName AS UpdatedUserName
										FROM            dbo.tblIndicator INNER JOIN
																 dbo.tblPreliminary ON dbo.tblIndicator.IndicatorId = dbo.tblPreliminary.IndicatorId AND dbo.tblIndicator.SurveyCategoryId = dbo.tblPreliminary.SurveyCategoryId INNER JOIN
																 dbo.tblUsers ON dbo.tblPreliminary.AddBy = dbo.tblUsers.UserId LEFT OUTER JOIN
																 dbo.tblUsers AS tblUsers_1 ON dbo.tblPreliminary.UpdatedBy = tblUsers_1.UserId
										WHERE        (dbo.tblIndicator.SurveyCategoryId = @SurveyCategoryId) AND (dbo.tblIndicator.IndicatorDivider = @IndicatorDivider) AND (dbo.tblPreliminary.YearId = @YearId) AND (dbo.tblPreliminary.CountryId = @CountryId) AND 
																 (dbo.tblPreliminary.CampId = @CampId)
						 
						 		END

						END
GO
