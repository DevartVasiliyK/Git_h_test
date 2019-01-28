CREATE TABLE [HumanResources].[Mapping] (
  [int] [int] NULL,
  [date] [date] NULL,
  [datetime] [datetime2] NULL,
  [money] [money] NULL,
  [varchar] [varchar](max) NULL,
  [nvarchar] [varchar](max) NULL,
  [bit] [bit] NULL,
  [decimal] [float] NULL,
  [dec25_9] [float] NULL
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'VirtualFolder', N'HumanResources', 'SCHEMA', N'HumanResources', 'TABLE', N'Mapping'
GO