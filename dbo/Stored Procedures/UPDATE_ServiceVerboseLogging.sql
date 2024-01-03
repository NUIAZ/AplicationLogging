-- =============================================
-- Author:		RTG
-- Create date: 12/2022
-- Description:	Update verbose logging for a API
-- =============================================
CREATE PROCEDURE [dbo].[UPDATE_ServiceVerboseLogging] 
	@VerboseSetting varchar(50), 
	@ServiceID uniqueidentifier 
AS

set xact_abort, nocount on
begin try

	-- Declare error variables
	declare @ERRORMESSAGE nvarchar(4000)
		   ,@ERRORSEVERITY int
		   ,@ERRORSTATE int
		   ,@ERRORPROCEDURE nvarchar(128)
		   ,@ERRORLINE int
		   ,@ERRORNUMBER int
		   ,@ErrMsg nvarchar(4000)

	begin transaction

		  UPDATE [KFApplicationLogging].[dbo].[ServiceSettings]
		  SET SettingValue = @VerboseSetting 
		  WHERE SettingKey = 'KochVerboseLogging' and ServiceID = @ServiceID

	commit

	return 0

end try
begin catch

    if (select @@TRANCOUNT) > 0 rollback
    select @ERRORMESSAGE = ERROR_MESSAGE(), @ERRORSEVERITY = ERROR_SEVERITY() ,@ERRORSTATE = ERROR_STATE() 
          ,@ERRORPROCEDURE = ERROR_PROCEDURE() ,@ERRORLINE = ERROR_LINE() ,@ERRORNUMBER = ERROR_NUMBER()
    set @ErrMsg = @ERRORMESSAGE + N' ErrorProcedure:' + @ERRORPROCEDURE + N' ErrorLine:' + convert(nvarchar(12),@ERRORLINE) + N' ' 
	raiserror(@ErrMsg ,@ERRORSEVERITY ,@ERRORSTATE)
	return 1

end catch
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[UPDATE_ServiceVerboseLogging] TO [ApiSettingsRole]
    AS [dbo];

