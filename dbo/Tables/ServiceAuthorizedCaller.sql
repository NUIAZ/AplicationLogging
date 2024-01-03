CREATE TABLE [dbo].[ServiceAuthorizedCaller] (
    [ID]          INT              IDENTITY (1, 1) NOT NULL,
    [CallerAppID] UNIQUEIDENTIFIER NOT NULL,
    [ServiceID]   UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_ServiceAuthorizedCaller] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ServiceAuthorizedCaller_Service] FOREIGN KEY ([ServiceID]) REFERENCES [dbo].[Service] ([ServiceID]) ON DELETE CASCADE
);

