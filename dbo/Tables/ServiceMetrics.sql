CREATE TABLE [dbo].[ServiceMetrics] (
    [ID]            INT              IDENTITY (1, 1) NOT NULL,
    [ServiceID]     UNIQUEIDENTIFIER NOT NULL,
    [ServerName]    VARCHAR (128)    NOT NULL,
    [ServiceName]   VARCHAR (128)    NOT NULL,
    [VersionNumber] DECIMAL (18, 3)  NOT NULL,
    [Date]          DATETIME         CONSTRAINT [DF_ServiceMetrics_Date] DEFAULT (getdate()) NOT NULL,
    [Windows]       BIT              CONSTRAINT [DF_ServiceMetrics_Windows] DEFAULT ((1)) NOT NULL,
    [IO_Speed]      INT              CONSTRAINT [DF_Table_1_Active] DEFAULT ((1)) NOT NULL,
    [IO_Measure]    VARCHAR (10)     CONSTRAINT [DF_ServiceMetrics_IO_Measure] DEFAULT ('KBs') NOT NULL,
    [CPU]           DECIMAL (18, 2)  CONSTRAINT [DF_Table_1_Tier] DEFAULT ((1)) NOT NULL,
    [RAM]           DECIMAL (18)     NULL,
    [RAM_Measure]   VARCHAR (10)     CONSTRAINT [DF_ServiceMetrics_RAM_Measure] DEFAULT ('MB') NULL,
    CONSTRAINT [PK_ServiceMetrics] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ServiceMetrics_Service] FOREIGN KEY ([ServiceID]) REFERENCES [dbo].[Service] ([ServiceID])
);

