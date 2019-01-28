﻿CREATE TABLE [Sales].[ShoppingCartItem] (
  [ShoppingCartItemID] [int] IDENTITY,
  [ShoppingCartID] [nvarchar](50) NOT NULL,
  [Quantity] [int] NOT NULL CONSTRAINT [DF_ShoppingCartItem_Quantity] DEFAULT (1),
  [ProductID] [int] NOT NULL,
  [DateCreated] [datetime] NOT NULL CONSTRAINT [DF_ShoppingCartItem_DateCreated] DEFAULT (getdate()),
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_ShoppingCartItem_ModifiedDate] DEFAULT (getdate()),
  CONSTRAINT [PK_ShoppingCartItem_ShoppingCartItemID] PRIMARY KEY CLUSTERED ([ShoppingCartItemID]),
  CONSTRAINT [CK_ShoppingCartItem_Quantity] CHECK ([Quantity]>=(1))
)
ON [PRIMARY]
GO

CREATE INDEX [IX_ShoppingCartItem_ShoppingCartID_ProductID]
  ON [Sales].[ShoppingCartItem] ([ShoppingCartID], [ProductID])
  ON [PRIMARY]
GO

ALTER TABLE [Sales].[ShoppingCartItem]
  ADD CONSTRAINT [FK_ShoppingCartItem_Product_ProductID] FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product] ([ProductID])
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Product.ProductID.', 'SCHEMA', N'Sales', 'TABLE', N'ShoppingCartItem', 'CONSTRAINT', N'FK_ShoppingCartItem_Product_ProductID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Contains online customer orders until the order is submitted or cancelled.', 'SCHEMA', N'Sales', 'TABLE', N'ShoppingCartItem'
GO

EXEC sys.sp_addextendedproperty N'VirtualFolder', N'Sales', 'SCHEMA', N'Sales', 'TABLE', N'ShoppingCartItem'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for ShoppingCartItem records.', 'SCHEMA', N'Sales', 'TABLE', N'ShoppingCartItem', 'COLUMN', N'ShoppingCartItemID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Shopping cart identification number.', 'SCHEMA', N'Sales', 'TABLE', N'ShoppingCartItem', 'COLUMN', N'ShoppingCartID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product quantity ordered.', 'SCHEMA', N'Sales', 'TABLE', N'ShoppingCartItem', 'COLUMN', N'Quantity'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product ordered. Foreign key to Product.ProductID.', 'SCHEMA', N'Sales', 'TABLE', N'ShoppingCartItem', 'COLUMN', N'ProductID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date the time the record was created.', 'SCHEMA', N'Sales', 'TABLE', N'ShoppingCartItem', 'COLUMN', N'DateCreated'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Sales', 'TABLE', N'ShoppingCartItem', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'Sales', 'TABLE', N'ShoppingCartItem', 'INDEX', N'IX_ShoppingCartItem_ShoppingCartID_ProductID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Sales', 'TABLE', N'ShoppingCartItem', 'INDEX', N'PK_ShoppingCartItem_ShoppingCartItemID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Sales', 'TABLE', N'ShoppingCartItem', 'CONSTRAINT', N'PK_ShoppingCartItem_ShoppingCartItemID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [Quantity] >= (1)', 'SCHEMA', N'Sales', 'TABLE', N'ShoppingCartItem', 'CONSTRAINT', N'CK_ShoppingCartItem_Quantity'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Sales', 'TABLE', N'ShoppingCartItem', 'CONSTRAINT', N'DF_ShoppingCartItem_DateCreated'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Sales', 'TABLE', N'ShoppingCartItem', 'CONSTRAINT', N'DF_ShoppingCartItem_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 1', 'SCHEMA', N'Sales', 'TABLE', N'ShoppingCartItem', 'CONSTRAINT', N'DF_ShoppingCartItem_Quantity'
GO