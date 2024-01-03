-- =============================================
-- Author:		RTG
-- Create date: 12/2022
-- Description:	insert service activity for API
-- =============================================
CREATE PROCEDURE [dbo].[INSERT_ServiceActivityLog] 
	@ServiceID uniqueidentifier, 
    @RunLocationName varchar(128),
	@PassFail bit
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

	INSERT INTO [dbo].[ServiceActivityLog]
           ([ServiceID]
           ,[RunLocationName]
           ,[ActivityDate]
           ,[PassFail])
     VALUES
           (@ServiceID
           ,@RunLocationName
           ,getdate()
           ,@PassFail)
		
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
    ON OBJECT::[dbo].[INSERT_ServiceActivityLog] TO [ApiSettingsRole]
    AS [dbo];

