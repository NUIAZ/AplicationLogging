CREATE TABLE [dbo].[AdhocReports] (
    [Id]          INT            IDENTITY (1, 1) NOT NULL,
    [Name]        NVARCHAR (50)  NOT NULL,
    [Group]       NVARCHAR (50)  NOT NULL,
    [DivID]       INT            NULL,
    [Description] NVARCHAR (MAX) NULL,
    [SQL]         NVARCHAR (MAX) NOT NULL,
    [CreatedBy]   NVARCHAR (50)  NOT NULL,
    [CreatedDate] DATETIME       NOT NULL,
    [Hint]        VARCHAR (250)  NULL,
    CONSTRAINT [PK_AdhocReports] PRIMARY KEY CLUSTERED ([Id] ASC)
);

