CREATE TABLE [Person].[New Text Document] (
  [column1] [int] NULL,
  [column2] [nvarchar](50) NULL,
  [column3] [nvarchar](50) NULL,
  [column4] [nvarchar](50) NULL,
  [column5] [int] NULL,
  [column6] [int] NULL,
  [column7] [nvarchar](255) NULL,
  [column8] [nvarchar](50) NULL,
  [column9] [datetime2] NULL
)
ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'VirtualFolder', N'Person', 'SCHEMA', N'Person', 'TABLE', N'New Text Document'
GO