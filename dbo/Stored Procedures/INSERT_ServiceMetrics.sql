-- =============================================
-- Author:		RTG
-- Create date: 12/2022
-- Description:	insert metrics for API
-- =============================================
CREATE PROCEDURE [dbo].[INSERT_ServiceMetrics] 
	@ServiceID uniqueidentifier, 
	@ServerName varchar(128),
    @ServiceName varchar(128),
    @VersionNumber decimal, 
    @Windows bit,
	@IO_Speed int,
	@IO_Measure varchar(10),
	@CPU decimal,
	@RAM decimal,
	@RAM_Measure varchar(10)
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

		  INSERT INTO [dbo].[ServiceMetrics]
           ([ServiceID]
           ,[ServerName]
           ,[ServiceName]
           ,[VersionNumber]
           ,[Date]
           ,[Windows]
           ,[IO_Speed]
           ,[IO_Measure]
           ,[CPU]
           ,[RAM]
           ,[RAM_Measure])
     VALUES
           (@ServiceID
           ,@ServerName
           ,@ServiceName
           ,@VersionNumber
           ,getdate()
           ,@Windows
           ,@IO_Speed
		   ,@IO_Measure
           ,@CPU
           ,@RAM
           ,@RAM_Measure
           )
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
    ON OBJECT::[dbo].[INSERT_ServiceMetrics] TO [ApiSettingsRole]
    AS [dbo];

