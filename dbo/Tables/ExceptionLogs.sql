CREATE TABLE [dbo].[ExceptionLogs] (
    [ID]           INT              IDENTITY (1, 1) NOT NULL,
    [User]         VARCHAR (100)    NOT NULL,
    [Application]  VARCHAR (100)    NOT NULL,
    [GUID]         UNIQUEIDENTIFIER NULL,
    [Version]      VARCHAR (20)     NOT NULL,
    [Caller]       VARCHAR (MAX)    NOT NULL,
    [Timestamp]    DATETIME         CONSTRAINT [DF_Exception_Date] DEFAULT (getdate()) NOT NULL,
    [Exception]    VARCHAR (MAX)    NOT NULL,
    [StackTrace]   VARCHAR (MAX)    NULL,
    [ErrorMessage] VARCHAR (MAX)    NULL,
    [ErrorCode]    INT              NULL,
    CONSTRAINT [PK_Exception] PRIMARY KEY CLUSTERED ([ID] ASC)
);

