USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spAddCampSupportAssistance]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spAddCampSupportAssistance]

		@YearId							tinyint			=NULL,
		@CountryId						tinyint			=NULL,
		@CampId							smallint		=NULL,
		@PermitId						smallint		=NULL,
		@VisaId							tinyint			=NULL,
		@AdvertisementId				tinyint			=NULL,
		@AccommodationId				tinyint			=NULL,
		@PhysicainRegStatus				varchar(1)		=NULL,
		@TranslatorsRegStatus			varchar(1)		=NULL,
		@TranslatorsRemark				nvarchar(100)	=NULL,
		@CustomsClearanceId				tinyint			=NULL,
		@TransportationId				tinyint			=NULL,
		@VolunteersRegStatus			varchar(1)		=NULL,
		@VolunteersRemark				nvarchar(100)	=NULL,
		@OrganizationalTeamStatus		varchar(1)		=NULL,
		@OrganizationalTeamRemark		nvarchar(100)	=NULL,
		@AddBy							smallint		=NULL,
		@UpdatedBy						smallint		=NULL

AS


BEGIN

IF NOT EXISTS(SELECT        CampSupportAssistanceId FROM dbo.tblCampSupportAssistance 
							WHERE        (YearId = @YearId) 
											AND (CountryId = @CountryId) 
											AND (CampId = @CampId))
											BEGIN
												BEGIN		--AUTO NUMBER
													DECLARE @CampSupportAssistanceId	int
													SELECT   @CampSupportAssistanceId= ISNULL (MAX(CampSupportAssistanceId),0)+1 FROM            dbo.tblCampSupportAssistance
												 END
												 BEGIN		-- INSERT 
														INSERT INTO dbo.tblCampSupportAssistance
																	(CampSupportAssistanceId, YearId, CountryId, CampId, PermitId, VisaId,AdvertisementId, AccommodationId, 
																	PhysicainRegStatus, TranslatorsRegStatus, TranslatorsRemark, CreationDate, AddBy,
																	CustomsClearanceId,TransportationId,VolunteersRegStatus,VolunteersRemark,OrganizationalTeamStatus,OrganizationalTeamRemark)
															VALUES(@CampSupportAssistanceId, @YearId, @CountryId, @CampId, @PermitId, @VisaId,@AdvertisementId, @AccommodationId, 
																	@PhysicainRegStatus, @TranslatorsRegStatus, @TranslatorsRemark, GETDATE(), @AddBy,
																	@CustomsClearanceId,@TransportationId,@VolunteersRegStatus,@VolunteersRemark,@OrganizationalTeamStatus,@OrganizationalTeamRemark)
												END
											END
											ELSE
											BEGIN

															UPDATE dbo.tblCampSupportAssistance SET
															AccommodationId=@AccommodationId,
															PhysicainRegStatus=@PhysicainRegStatus,
															TranslatorsRegStatus=@TranslatorsRegStatus,
															TranslatorsRemark=@TranslatorsRemark,
															CustomsClearanceId=@CustomsClearanceId,
															TransportationId=@TransportationId,
															VolunteersRegStatus=@VolunteersRegStatus,
															VolunteersRemark=@VolunteersRemark,
															OrganizationalTeamStatus=@OrganizationalTeamStatus,
															OrganizationalTeamRemark=@OrganizationalTeamRemark,
															UpdatedBy=@UpdatedBy,
															UpdatedDate=UpdatedDate
															WHERE		(YearId = @YearId) 
																		AND (CountryId = @CountryId) 
																		AND (CampId = @CampId) 
																	


											END


END
GO
