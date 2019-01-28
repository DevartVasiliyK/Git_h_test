CREATE TABLE [dbo].[DMDT_OPEN-OUR NORMAL XML FILE] (
  [DatabaseName] [varchar](512) NULL,
  [IndexLocation] [varchar](512) NULL,
  [IndexName] [varchar](512) NULL,
  [IndexUsed] [varchar](512) NULL,
  [IndexUpdated] [varchar](512) NULL,
  [TotalRows] [varchar](512) NULL,
  [DataRefreshed] [varchar](512) NULL
)
ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'VirtualFolder', N'dbo', 'SCHEMA', N'dbo', 'TABLE', N'DMDT_OPEN-OUR NORMAL XML FILE'
GO