-- =============================================
-- Author:		RTG
-- Create date: 12/2022
-- Description:	Get Exception log for API
-- =============================================
CREATE PROCEDURE [dbo].[SELECT_ServiceExceptionLog] 
	-- Add the parameters for the stored procedure here
	@ServiceID uniqueIdentifier 
AS
BEGIN
SELECT  [ID]
      ,[User]
      ,[Version]
      ,[Caller]
      ,[Timestamp]
      ,[Exception]
      ,[StackTrace]
      ,[ErrorMessage]
      ,[ErrorCode]
  FROM [KFApplicationLogging].[dbo].[ExceptionLogs]
  WHERE GUID = @ServiceID
  --'B1686CAD-6CEF-4646-B739-659250A92077'
  order by timestamp desc

END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SELECT_ServiceExceptionLog] TO [ApiSettingsRole]
    AS [dbo];

