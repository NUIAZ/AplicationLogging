CREATE TABLE [dbo].[ServiceCategory] (
    [ID]           INT            IDENTITY (1, 1) NOT NULL,
    [Type]         NVARCHAR (50)  NOT NULL,
    [Description]  NVARCHAR (250) NULL,
    [Internal]     BIT            CONSTRAINT [DF_ServiceCategory_Internal] DEFAULT ((1)) NOT NULL,
    [OS]           CHAR (1)       CONSTRAINT [DF_ServiceCategory_Cloud] DEFAULT ('((L))') NOT NULL,
    [TLS_required] BIT            CONSTRAINT [DF_ServiceCategory_TLS_required] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_ServiceCategory] PRIMARY KEY CLUSTERED ([ID] ASC)
);

