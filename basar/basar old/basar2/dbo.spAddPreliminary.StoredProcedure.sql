USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spAddPreliminary]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spAddPreliminary]

		@YearId					tinyint			=NULL,
		@CountryId				tinyint			=NULL,
		@CampId					smallint		=NULL,
		@SurveyCategoryId		tinyint			=NULL,
		@IndicatorId			smallint		=NULL,
		@RequiredNumber			smallint		=NULL,
		@AvailableNumber		smallint		=NULL,
		@MissingNumber			smallint		=NULL,
		@IndicatorDivider		bit				=NULL,
		@CampIndicatorStatus	varchar(1)		=NULL,
		@CampIndicatorMemo		nvarchar(200)	=NULL,
		@AddBy					smallint		=NULL,
		@UpdatedBy				smallint		=NULL

AS


BEGIN

IF NOT EXISTS(SELECT        PreliminaryId FROM dbo.tblPreliminary 
							WHERE        (YearId = @YearId) 
											AND (CountryId = @CountryId) 
											AND (CampId = @CampId) 
											AND (SurveyCategoryId = @SurveyCategoryId) 
											AND (IndicatorId = @IndicatorId)
											AND(IndicatorDivider=@IndicatorDivider))
											BEGIN
												BEGIN		--AUTO NUMBER
													DECLARE @PreliminaryId	int
													SELECT   @PreliminaryId= ISNULL (MAX(PreliminaryId),0)+1 FROM            dbo.tblPreliminary
												 END
												 BEGIN		-- INSERT 
														INSERT INTO dbo.tblPreliminary
																	(PreliminaryId, YearId, CountryId, CampId, SurveyCategoryId, IndicatorId,IndicatorDivider, RequiredNumber, 
																	AvailableNumber, MissingNumber, CampIndicatorStatus, CampIndicatorMemo, CreationDate, AddBy)
															VALUES(@PreliminaryId, @YearId, @CountryId, @CampId, @SurveyCategoryId, @IndicatorId,@IndicatorDivider, @RequiredNumber, 
																	@AvailableNumber, @MissingNumber, @CampIndicatorStatus, @CampIndicatorMemo, GETDATE(), @AddBy)
												END
											END
											ELSE
											BEGIN

															UPDATE dbo.tblPreliminary SET
															RequiredNumber=@RequiredNumber,
															AvailableNumber=@AvailableNumber,
															MissingNumber=@MissingNumber,
															CampIndicatorStatus=@CampIndicatorStatus,
															CampIndicatorMemo=@CampIndicatorMemo,
															UpdatedBy=@UpdatedBy,
															UpdatedDate=UpdatedDate
															WHERE		(YearId = @YearId) 
																		AND (CountryId = @CountryId) 
																		AND (CampId = @CampId) 
																		AND (SurveyCategoryId = @SurveyCategoryId) 
																		AND (IndicatorId = @IndicatorId)
																		AND(IndicatorDivider=@IndicatorDivider)


											END


END
GO
