CREATE TABLE [dbo].[SettingLogs] (
    [Id]        INT            IDENTITY (1, 1) NOT NULL,
    [Timestamp] DATETIME       NOT NULL,
    [UserName]  NVARCHAR (50)  NOT NULL,
    [Values]    NVARCHAR (MAX) NOT NULL,
    CONSTRAINT [PK_SettingLogs] PRIMARY KEY CLUSTERED ([Id] ASC)
);

