CREATE TABLE [dbo].[LogCategory] (
    [ID]          INT            IDENTITY (1, 1) NOT NULL,
    [Name]        NVARCHAR (50)  NOT NULL,
    [Description] NVARCHAR (250) NULL,
    CONSTRAINT [PK_LogCategory] PRIMARY KEY CLUSTERED ([ID] ASC)
);

