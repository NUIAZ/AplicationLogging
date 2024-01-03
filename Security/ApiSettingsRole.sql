CREATE ROLE [ApiSettingsRole]
    AUTHORIZATION [db_securityadmin];


GO
ALTER ROLE [ApiSettingsRole] ADD MEMBER [CORP\svcMSyardMgmtprod];


GO
ALTER ROLE [ApiSettingsRole] ADD MEMBER [CORP\MSYardmanagement];


GO
ALTER ROLE [ApiSettingsRole] ADD MEMBER [CORP\MSImageViewer];


GO
ALTER ROLE [ApiSettingsRole] ADD MEMBER [CORP\svcMSimageDb_Prod];


GO
ALTER ROLE [ApiSettingsRole] ADD MEMBER [ApiSettings];

