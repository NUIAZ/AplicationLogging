-- =============================================
-- Author:		RTG
-- Create date: 10/15/21
-- Description:	Get Application Settings for API
-- =============================================
CREATE PROCEDURE [dbo].[SELECT_ServiceSettings] 
	-- Add the parameters for the stored procedure here
	@AppID uniqueIdentifier 
AS
BEGIN
	SELECT 
      [SettingKey]
     ,[SettingValue]
  FROM [KFApplicationLogging].[dbo].[ServiceSettings] 
  where ServiceID = @AppID

END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SELECT_ServiceSettings] TO [ApiSettingsRole]
    AS [dbo];

