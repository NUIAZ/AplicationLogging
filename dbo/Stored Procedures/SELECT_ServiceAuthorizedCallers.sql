-- =============================================
-- Author:		RTG
-- Create date: 10/15/21
-- Description:	Get Authorized Callers for API
-- =============================================
CREATE PROCEDURE [dbo].[SELECT_ServiceAuthorizedCallers]
	-- Add the parameters for the stored procedure here
	@AppID uniqueIdentifier
AS
BEGIN
	SELECT [CallerAppID]
	 ,UsageKey
  FROM [KFApplicationLogging].[dbo].[ServiceAuthorizedCaller] ss
   join  [KFApplicationLogging].[dbo].[Service] s on ss.ServiceID = s.ServiceID 
  where ss.ServiceID = @AppID

END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SELECT_ServiceAuthorizedCallers] TO [ApiSettingsRole]
    AS [dbo];

