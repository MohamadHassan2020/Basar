USE [Basar]
GO
/****** Object:  StoredProcedure [dbo].[spAddCampEquipment]    Script Date: 4/29/2020 2:10:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spAddCampEquipment]

			 
		@YearId						tinyint						=NULL,
		@CountryId					tinyint						=NULL,		
		@CampId						smallint					=NULL,
		@EquipmentId				smallint					=NULL,
		@RequiredNumber				smallint					=NULL,
		@AvailableNumber			smallint					=NULL,
		@CampEquipmentStatus		varchar(1)					=NULL,
		@CampEquipmentMemo			nvarchar(200)				=NULL,
		@AddBy						smallint					=NULL,
		@UpdatedBy					smallint					=NULL

AS


BEGIN

IF NOT EXISTS(SELECT        CampEquipmentId FROM dbo.tblCampEquipment 
							WHERE        (YearId = @YearId) 
											AND (CountryId = @CountryId) 
											AND (CampId = @CampId)
											AND(EquipmentId=@EquipmentId) )
											BEGIN
												BEGIN		--AUTO NUMBER
													DECLARE @CampEquipmentId	int
													SELECT   @CampEquipmentId= ISNULL (MAX(CampEquipmentId),0)+1 FROM            dbo.tblCampEquipment
												 END
												 BEGIN		-- INSERT 
														INSERT INTO dbo.tblCampEquipment
																	(CampEquipmentId, YearId, CountryId, CampId,EquipmentId, RequiredNumber, AvailableNumber, CampEquipmentStatus, 
																	CampEquipmentMemo, CreationDate, AddBy)
															VALUES(@CampEquipmentId, @YearId, @CountryId, @CampId,@EquipmentId, @RequiredNumber, @AvailableNumber, @CampEquipmentStatus, @CampEquipmentMemo, GETDATE(), @AddBy)
												END
											END
											ELSE
											BEGIN

															UPDATE dbo.tblCampEquipment SET
															RequiredNumber=@RequiredNumber,
															AvailableNumber=@AvailableNumber,
															CampEquipmentStatus=@CampEquipmentStatus,
															CampEquipmentMemo=@CampEquipmentMemo,
															UpdatedBy=@UpdatedBy,
															UpdatedDate=UpdatedDate
															WHERE		(YearId = @YearId) 
																		AND (CountryId = @CountryId) 
																		AND (CampId = @CampId) 
																		AND(EquipmentId=@EquipmentId)
																		

											END


END
GO
