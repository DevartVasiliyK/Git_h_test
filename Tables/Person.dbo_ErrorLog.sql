CREATE TABLE [Person].[dbo_ErrorLog] (
  [column1] [nvarchar](500) NULL,
  [column2] [datetime2] NULL,
  [column3] [nvarchar](50) NULL,
  [column4] [int] NULL,
  [column5] [int] NULL,
  [column6] [int] NULL,
  [column7] [nvarchar](100) NULL,
  [column8] [int] NULL,
  [column9] [nvarchar](100) NULL
)
ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'VirtualFolder', N'Person', 'SCHEMA', N'Person', 'TABLE', N'dbo_ErrorLog'
GO