-- =============================================
-- Author:		RTG
-- Create date: 12/2022
-- Description:	Get Activity log for API
-- =============================================
CREATE PROCEDURE [dbo].[SELECT_ServiceActivityLog] 
	-- Add the parameters for the stored procedure here
	@ServiceID uniqueIdentifier 
AS
BEGIN
	SELECT 
	   [ID]
      ,[User]
      ,[Version]
      ,[Timestamp]
      ,[LogCategoryID]
      ,[Objectlog]
      ,[LogInformation]
  FROM [KFApplicationLogging].[dbo].[LogData]
  WHERE GUID = @ServiceID
  --'B1686CAD-6CEF-4646-B739-659250A92077'
  order by timestamp desc
 

END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SELECT_ServiceActivityLog] TO [ApiSettingsRole]
    AS [dbo];

