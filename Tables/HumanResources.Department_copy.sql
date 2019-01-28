CREATE TABLE [HumanResources].[Department_copy] (
  [BusinessEntityID] [int] IDENTITY,
  [NationalIDNumber] [int] NULL,
  [LoginID] [nvarchar](50) NULL,
  [OrganizationNode] [nvarchar](50) NULL,
  [OrganizationLevel] [int] NULL,
  [JobTitle] [nvarchar](100) NULL,
  [BirthDate] [date] NULL,
  [MaritalStatus] [nvarchar](50) NULL,
  [Gender] [nvarchar](50) NULL,
  [HireDate] [date] NULL,
  [SalariedFlag] [bit] NULL,
  [VacationHours] [int] NULL,
  [SickLeaveHours] [int] NULL,
  [CurrentFlag] [bit] NULL,
  [rowguid] [nvarchar](50) NULL,
  [ModifiedDate] [datetime2] NULL,
  CONSTRAINT [PK_Department_copy] PRIMARY KEY CLUSTERED ([BusinessEntityID])
)
ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'VirtualFolder', N'HumanResources', 'SCHEMA', N'HumanResources', 'TABLE', N'Department_copy'
GO