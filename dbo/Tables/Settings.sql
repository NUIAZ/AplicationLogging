CREATE TABLE [dbo].[Settings] (
    [Id]                      INT            IDENTITY (1, 1) NOT NULL,
    [RefreshRate]             INT            NOT NULL,
    [SharepointTraining]      NVARCHAR (500) NULL,
    [SharepointExceptionCode] NVARCHAR (500) NULL,
    [GreenConfiguration]      INT            NOT NULL,
    [YellowConfiguration]     INT            NOT NULL,
    [RedConfiguration]        INT            NOT NULL,
    CONSTRAINT [PK_Settings] PRIMARY KEY CLUSTERED ([Id] ASC)
);

