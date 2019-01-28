CREATE TABLE [dbo].[Comma] (
  [DepartmentID] [int] IDENTITY,
  [Name] [varchar](50) NULL,
  [GroupName] [varchar](50) NULL,
  [ModifiedDate] [datetime2] NULL,
  CONSTRAINT [PK_Comma] PRIMARY KEY CLUSTERED ([DepartmentID])
)
ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'VirtualFolder', N'dbo', 'SCHEMA', N'dbo', 'TABLE', N'Comma'
GO