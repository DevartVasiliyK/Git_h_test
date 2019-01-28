CREATE TABLE [HumanResources].[Department_New] (
  [DepartmentID] [int] NULL,
  [Name] [nvarchar](50) NULL,
  [GroupName] [nvarchar](50) NULL,
  [ModifiedDate] [datetime2] NULL
)
ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'VirtualFolder', N'HumanResources', 'SCHEMA', N'HumanResources', 'TABLE', N'Department_New'
GO