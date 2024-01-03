CREATE TABLE [dbo].[Service] (
    [ID]            INT              IDENTITY (1, 1) NOT NULL,
    [ServiceID]     UNIQUEIDENTIFIER NOT NULL,
    [ServiceName]   VARCHAR (128)    NOT NULL,
    [VersionNumber] DECIMAL (18, 3)  NOT NULL,
    [Date]          DATETIME         CONSTRAINT [DF_Service_Date] DEFAULT (getdate()) NOT NULL,
    [CategoryID]    INT              NOT NULL,
    [Docker]        BIT              CONSTRAINT [DF_Service_Docker] DEFAULT ((1)) NOT NULL,
    [Active]        BIT              CONSTRAINT [DF_Service_Active_1] DEFAULT ((1)) NOT NULL,
    [Description]   VARCHAR (512)    NOT NULL,
    [Tier]          INT              CONSTRAINT [DF_Service_Tier_1] DEFAULT ((1)) NOT NULL,
    [DataCenter]    VARCHAR (20)     NOT NULL,
    [UsageKey]      NVARCHAR (25)    NOT NULL,
    [Port]          INT              NULL,
    CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_Service_ServiceCategory] FOREIGN KEY ([CategoryID]) REFERENCES [dbo].[ServiceCategory] ([ID]),
    CONSTRAINT [Unique_Service] UNIQUE NONCLUSTERED ([ServiceID] ASC)
);

