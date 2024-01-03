CREATE TABLE [dbo].[ServiceSettings] (
    [ID]           INT              IDENTITY (1, 1) NOT NULL,
    [SettingKey]   VARCHAR (50)     NOT NULL,
    [SettingValue] VARCHAR (50)     NOT NULL,
    [ServiceID]    UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_ServiceSettings] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ServiceSettings_Service] FOREIGN KEY ([ServiceID]) REFERENCES [dbo].[Service] ([ServiceID]) ON DELETE CASCADE
);

