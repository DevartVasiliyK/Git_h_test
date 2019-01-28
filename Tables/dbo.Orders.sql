CREATE TABLE [dbo].[Orders] (
  [OrderID] [int] IDENTITY,
  [CustomerID] [nchar](5) NULL,
  [EmployeeID] [int] NULL,
  [OrderDate] [datetime] NULL,
  [RequiredDate] [datetime] NULL,
  [ShippedDate] [datetime] NULL,
  [Freight] [money] NULL CONSTRAINT [DF_Orders_Freight] DEFAULT (0),
  [ShipName] [nvarchar](40) NULL,
  [ShipAddress] [nvarchar](60) NULL,
  [ShipCity] [nvarchar](15) NULL,
  [ShipRegion] [nvarchar](15) NULL,
  [ShipPostalCode] [nvarchar](10) NULL,
  [ShipCountry] [nvarchar](15) NULL,
  [LastEditDate] [datetime] NULL CONSTRAINT [DF_Orders_LastEditDate] DEFAULT (getutcdate()),
  [CreationDate] [datetime] NULL CONSTRAINT [DF_Orders_CreationDate] DEFAULT (getutcdate()),
  CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED ([OrderID])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[Orders]
  ADD CONSTRAINT [FK_Orders_Customers] FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[Customers] ([CustomerID])
GO

EXEC sys.sp_addextendedproperty N'VirtualFolder', N'dbo', 'SCHEMA', N'dbo', 'TABLE', N'Orders'
GO