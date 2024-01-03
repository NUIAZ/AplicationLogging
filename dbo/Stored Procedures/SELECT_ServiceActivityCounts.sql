
-- =============================================
-- Author:		RTG
-- Create date: 12/2022
-- Description:	Get pass/fail count for API
-- =============================================
CREATE PROCEDURE [dbo].[SELECT_ServiceActivityCounts] 
	-- Add the parameters for the stored procedure here
	@ServiceID uniqueIdentifier 
AS
BEGIN
	 SELECT (SELECT count([PassFail]) 
  FROM [KFApplicationLogging].[dbo].[ServiceActivityLog]
  where [ServiceID] = @ServiceID
  AND [PassFail] = 1)as 'Pass',
  (SELECT count([PassFail]) 
  FROM [KFApplicationLogging].[dbo].[ServiceActivityLog]
  where [ServiceID] = @ServiceID
  AND [PassFail] = 0)as 'Fail'

END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SELECT_ServiceActivityCounts] TO [ApiSettingsRole]
    AS [dbo];

