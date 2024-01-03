CREATE TABLE [dbo].[ServiceTesting] (
    [ID]                     INT              IDENTITY (1, 1) NOT NULL,
    [ServiceID]              UNIQUEIDENTIFIER NOT NULL,
    [PostObject]             VARCHAR (500)    NOT NULL,
    [Headers]                VARCHAR (150)    NOT NULL,
    [ExpectedResponseObject] VARCHAR (500)    NOT NULL,
    [ServiceURL]             VARCHAR (250)    NOT NULL,
    [Pass]                   BIT              NOT NULL,
    [ExpectedResponseCode]   VARCHAR (10)     NOT NULL,
    CONSTRAINT [PK_ServiceTesting] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ServiceTesting_Service] FOREIGN KEY ([ServiceID]) REFERENCES [dbo].[Service] ([ServiceID]) ON DELETE CASCADE
);

