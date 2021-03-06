USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spAddAnnualPlan]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spAddAnnualPlan]

				@AnnualPlanId			int					=NULL,
				@YearId					tinyint				=NULL,
				@TeamId					smallint			=NULL,
				@TourId					smallint			=NULL,
				@CountryId				tinyint				=NULL,
				@CampId					smallint			=NULL,
				@SponsorId				smallint			=NULL,
				@AnnualPlanStartDate	date				=NULL,
				@AnnualPlanEndDate		date				=NULL,
				@AnnualPlanAddBy		smallint			=NULL,
				@AnnualPlanUpdatedBy	smallint			=NULL,
				@AnnualPlanStatus		bit					=NULL,
				@AnnualPlanRemark		nvarchar(200)		=NULL,
				@PreliminaryStatus		bit					=NULL,
				@CampStatusId			smallint			=NULL,
				@AnnualPlanIdOut		int OUT	,
				@MsgOut					NVARCHAR(100) OUT
AS
			BEGIN
			 
										IF NOT EXISTS (SELECT AnnualPlanId FROM     dbo.tblAnnualPlan WHERE    (AnnualPlanId = @AnnualPlanId))

											BEGIN
			
												INSERT INTO dbo.tblAnnualPlan (YearId, TeamId, TourId, CountryId, CampId, SponsorId,CampStatusId, AnnualPlanStartDate, AnnualPlanEndDate, AnnualPlanAddBy, AnnualPlanUpdatedBy, AnnualPlanCreationDate,
																					AnnualPlanUpdatedDate, AnnualPlanStatus,AnnualPlanRemark,PreliminaryStatus)
																		VALUES			(@YearId, @TeamId, @TourId, @CountryId, @CampId, @SponsorId,@CampStatusId, @AnnualPlanStartDate, @AnnualPlanEndDate, @AnnualPlanAddBy, @AnnualPlanUpdatedBy, GETDATE(),
																					GETDATE(), @AnnualPlanStatus,@AnnualPlanRemark,@PreliminaryStatus)
																SELECT @AnnualPlanIdOut=SCOPE_IDENTITY()
																SELECT @MsgOut=N'تم الحفظ بنجاح'
												END
												ELSE
												BEGIN
																UPDATE dbo.tblAnnualPlan SET YearId=@YearId,
																TeamId=@TeamId,
																TourId=@TourId,
																CampId=@CampId,
																CountryId=@CountryId,
																SponsorId=@SponsorId,
																CampStatusId=@CampStatusId,
																AnnualPlanStartDate=@AnnualPlanStartDate,
																AnnualPlanUpdatedBy=@AnnualPlanUpdatedBy,
																AnnualPlanUpdatedDate=GETDATE(),
																AnnualPlanEndDate=@AnnualPlanEndDate,
																AnnualPlanStatus=@AnnualPlanStatus,
																AnnualPlanRemark=@AnnualPlanRemark,
																PreliminaryStatus=@PreliminaryStatus
																WHERE AnnualPlanId=@AnnualPlanId
																SELECT @AnnualPlanIdOut =@AnnualPlanId
																SELECT @MsgOut=N'تم التعديل بنجاح'
												END
					END
GO
