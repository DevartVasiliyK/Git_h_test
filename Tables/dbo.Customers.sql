CREATE TABLE [dbo].[Customers] (
  [CustomerID] [nchar](5) NOT NULL,
  [CompanyName] [nvarchar](40) NOT NULL,
  [ContactName] [nvarchar](30) NULL,
  [ContactTitle] [nvarchar](30) NULL,
  [Address] [nvarchar](60) NULL,
  [City] [nvarchar](15) NULL,
  [Region] [nvarchar](15) NULL,
  [PostalCode] [nvarchar](10) NULL,
  [Country] [nvarchar](15) NULL,
  [Phone] [nvarchar](24) NULL,
  [Fax] [nvarchar](24) NULL,
  [LastEditDate] [datetime] NULL CONSTRAINT [DF_Customers_LastEditDate] DEFAULT (getutcdate()),
  [CreationDate] [datetime] NULL CONSTRAINT [DF_Customers_CreationDate] DEFAULT (getutcdate()),
  CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED ([CustomerID])
)
ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'VirtualFolder', N'dbo', 'SCHEMA', N'dbo', 'TABLE', N'Customers'
GO