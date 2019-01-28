CREATE TABLE [dbo].[dbo_AWBuildVersion] (
  [column2] [nvarchar](50) NOT NULL,
  [column1] [nvarchar](250) NOT NULL,
  [column3] [nvarchar](50) NOT NULL,
  [column4] [nvarchar](50) NULL
)
ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'VirtualFolder', N'dbo', 'SCHEMA', N'dbo', 'TABLE', N'dbo_AWBuildVersion'
GO