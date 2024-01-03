ALTER ROLE [db_owner] ADD MEMBER [AppLogger];


GO
ALTER ROLE [db_ddladmin] ADD MEMBER [stewsql];


GO
ALTER ROLE [db_datawriter] ADD MEMBER [CORP\Svc_ExceptionLogging];


GO
ALTER ROLE [db_datawriter] ADD MEMBER [AppLogger];


GO
ALTER ROLE [db_datawriter] ADD MEMBER [stewsql];


GO
ALTER ROLE [db_datareader] ADD MEMBER [CORP\Svc_ExceptionLogging];


GO
ALTER ROLE [db_datareader] ADD MEMBER [AppLogger];


GO
ALTER ROLE [db_datareader] ADD MEMBER [stewsql];

