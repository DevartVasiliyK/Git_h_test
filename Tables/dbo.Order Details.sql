CREATE TABLE [dbo].[Order Details] (
  [OrderID] [int] NOT NULL,
  [ProductID] [int] NOT NULL,
  [UnitPrice] [money] NOT NULL CONSTRAINT [DF_Order_Details_UnitPrice] DEFAULT (0),
  [Quantity] [smallint] NOT NULL CONSTRAINT [DF_Order_Details_Quantity] DEFAULT (1),
  [Discount] [real] NOT NULL CONSTRAINT [DF_Order_Details_Discount] DEFAULT (0),
  [LastEditDate] [datetime] NULL CONSTRAINT [DF_Order Details_LastEditDate] DEFAULT (getutcdate()),
  [CreationDate] [datetime] NULL CONSTRAINT [DF_Order Details_CreationDate] DEFAULT (getutcdate()),
  CONSTRAINT [PK_Order_Details] PRIMARY KEY CLUSTERED ([OrderID], [ProductID]),
  CONSTRAINT [CK_Discount] CHECK ([Discount]>=(0) AND [Discount]<=(1)),
  CONSTRAINT [CK_Quantity] CHECK ([Quantity]>(0)),
  CONSTRAINT [CK_UnitPrice] CHECK ([UnitPrice]>=(0))
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[Order Details]
  ADD CONSTRAINT [FK_Order_Details_Orders] FOREIGN KEY ([OrderID]) REFERENCES [dbo].[Orders] ([OrderID])
GO

ALTER TABLE [dbo].[Order Details]
  ADD CONSTRAINT [FK_Order_Details_Products] FOREIGN KEY ([ProductID]) REFERENCES [dbo].[Products] ([ProductID])
GO

EXEC sys.sp_addextendedproperty N'VirtualFolder', N'dbo', 'SCHEMA', N'dbo', 'TABLE', N'Order Details'
GO