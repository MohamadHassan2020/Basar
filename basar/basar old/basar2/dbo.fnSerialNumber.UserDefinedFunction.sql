USE [Basar]
GO
/****** Object:  UserDefinedFunction [dbo].[fnSerialNumber]    Script Date: 4/29/2020 2:10:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE function [dbo].[fnSerialNumber]
	(
	 @strValue	NVARCHAR(20)
	)
RETURNS  Nvarchar(20) 
AS
/*

*/
begin

 
DECLARE @Sn nvarchar(20)
DECLARE @SnLast nvarchar(2)
DECLARE @NewSn NVARCHAR(2)
DECLARE @DocumentNumberDaily NVARCHAR(20)

select @Sn= (select FORMAT(GETDATE(),@strValue))
select @SnLast=(SELECT substring (@Sn,9,2))

select @NewSn=(SELECT CAST(@SnLast AS TINYINT)+1)

 
SELECT @DocumentNumberDaily=
 CASE     
 WHEN @SnLast='' THEN @Sn+'01'
	ELSE
		CASE   
		WHEN @NewSn<=9 THEN    LEFT(@Sn,8)+'0' +  @NewSn
		ELSE
		LEFT(@Sn,8)+ @NewSn
		END
	END
   
   RETURN RIGHT (@DocumentNumberDaily,LEN(@DocumentNumberDaily)-2)
END


 
GO
