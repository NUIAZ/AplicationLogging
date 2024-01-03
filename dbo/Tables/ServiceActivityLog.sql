CREATE TABLE [dbo].[ServiceActivityLog] (
    [ID]              INT              IDENTITY (1, 1) NOT NULL,
    [ServiceID]       UNIQUEIDENTIFIER NOT NULL,
    [RunLocationName] VARCHAR (128)    NOT NULL,
    [ActivityDate]    DATETIME         CONSTRAINT [DF_ServiceActivityLog_ActivityDate] DEFAULT (getdate()) NOT NULL,
    [PassFail]        BIT              CONSTRAINT [DF_ServiceActivityLog_PassFail] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_ServiceActivityLog] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ServiceActivityLog_Service] FOREIGN KEY ([ServiceID]) REFERENCES [dbo].[Service] ([ServiceID])
);

