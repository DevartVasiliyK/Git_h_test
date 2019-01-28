CREATE TABLE [dbo].[Products] (
  [ProductID] [int] IDENTITY,
  [ProductName] [nvarchar](240) NOT NULL,
  [SupplierID] [int] NULL,
  [CategoryID] [int] NULL,
  [QuantityPerUnit] [nvarchar](220) NULL,
  [UnitPrice] [money] NULL CONSTRAINT [DF_Products_UnitPrice] DEFAULT (0),
  [UnitsInStock] [smallint] NULL CONSTRAINT [DF_Products_UnitsInStock] DEFAULT (0),
  [UnitsOnOrder] [smallint] NULL CONSTRAINT [DF_Products_UnitsOnOrder] DEFAULT (0),
  [ReorderLevel] [smallint] NULL CONSTRAINT [DF_Products_ReorderLevel] DEFAULT (0),
  [Discontinued] [bit] NOT NULL CONSTRAINT [DF_Products_Discontinued] DEFAULT (0),
  [DiscontinuedDate] [datetime] NULL,
  [LastEditDate] [datetime] NULL CONSTRAINT [DF_Products_LastEditDate] DEFAULT (getutcdate()),
  [CreationDate] [datetime] NULL CONSTRAINT [DF_Products_CreationDate] DEFAULT (getutcdate()),
  CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED ([ProductID]),
  CONSTRAINT [CK_Products_UnitPrice] CHECK ([UnitPrice]>=(0)),
  CONSTRAINT [CK_ReorderLevel] CHECK ([ReorderLevel]>=(0)),
  CONSTRAINT [CK_UnitsInStock] CHECK ([UnitsInStock]>=(0)),
  CONSTRAINT [CK_UnitsOnOrder] CHECK ([UnitsOnOrder]>=(0))
)
ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'VirtualFolder', N'dbo', 'SCHEMA', N'dbo', 'TABLE', N'Products'
GO