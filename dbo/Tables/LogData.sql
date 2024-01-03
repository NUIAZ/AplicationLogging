CREATE TABLE [dbo].[LogData] (
    [ID]             INT              IDENTITY (1, 1) NOT NULL,
    [User]           VARCHAR (100)    NOT NULL,
    [Application]    VARCHAR (100)    NOT NULL,
    [GUID]           UNIQUEIDENTIFIER NULL,
    [Version]        VARCHAR (20)     NOT NULL,
    [Caller]         VARCHAR (256)    NOT NULL,
    [Timestamp]      DATETIME         CONSTRAINT [DF_Logging_Date] DEFAULT (getdate()) NOT NULL,
    [LogCategoryID]  INT              NOT NULL,
    [Objectlog]      VARCHAR (MAX)    NULL,
    [LogInformation] VARCHAR (1000)   NOT NULL,
    [ShortViewLog]   VARCHAR (100)    NULL,
    CONSTRAINT [PK_Logging] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_LogData_LogCategory] FOREIGN KEY ([LogCategoryID]) REFERENCES [dbo].[LogCategory] ([ID])
);

