CREATE TABLE [dbo].[t3] (
  [c1] [varchar](50) NULL
)
ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'VirtualFolder', N'dbo', 'SCHEMA', N'dbo', 'TABLE', N't3'
GO