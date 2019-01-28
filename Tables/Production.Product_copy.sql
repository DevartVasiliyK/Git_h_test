CREATE TABLE [Production].[Product_copy] (
  [ProductID] [int] IDENTITY,
  [Name] [dbo].[Name] NOT NULL,
  [ProductNumber] [nvarchar](25) NOT NULL,
  [MakeFlag] [dbo].[Flag] NOT NULL CONSTRAINT [DF_Product_MakeFlag_copy] DEFAULT (1),
  [FinishedGoodsFlag] [dbo].[Flag] NOT NULL CONSTRAINT [DF_Product_FinishedGoodsFlag_copy] DEFAULT (1),
  [Color] [nvarchar](15) NULL,
  [SafetyStockLevel] [smallint] NOT NULL,
  [ReorderPoint] [smallint] NOT NULL,
  [StandardCost] [money] NOT NULL,
  [ListPrice] [money] NOT NULL,
  [Size] [nvarchar](5) NULL,
  [SizeUnitMeasureCode] [nchar](3) NULL,
  [WeightUnitMeasureCode] [nchar](3) NULL,
  [Weight] [decimal](8, 2) NULL,
  [DaysToManufacture] [int] NOT NULL,
  [ProductLine] [nchar](2) NULL,
  [Class] [nchar](2) NULL,
  [Style] [nchar](2) NULL,
  [ProductSubcategoryID] [int] NULL,
  [ProductModelID] [int] NULL,
  [SellStartDate] [datetime] NOT NULL,
  [SellEndDate] [datetime] NULL,
  [DiscontinuedDate] [datetime] NULL,
  [rowguid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Product_rowguid_copy] DEFAULT (newid()) ROWGUIDCOL,
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_Product_ModifiedDate_copy] DEFAULT (getdate()),
  CONSTRAINT [PK_Product_ProductID_copy] PRIMARY KEY CLUSTERED ([ProductID])
)
ON [PRIMARY]
GO

ALTER TABLE [Production].[Product_copy] WITH NOCHECK
  ADD CONSTRAINT [CK_Product_Class_copy] CHECK (upper([Class])='H' OR upper([Class])='M' OR upper([Class])='L' OR [Class] IS NULL)
GO

ALTER TABLE [Production].[Product_copy] WITH NOCHECK
  ADD CONSTRAINT [CK_Product_DaysToManufacture_copy] CHECK ([DaysToManufacture]>=(0))
GO

ALTER TABLE [Production].[Product_copy] WITH NOCHECK
  ADD CONSTRAINT [CK_Product_ListPrice_copy] CHECK ([ListPrice]>=(0.00))
GO

ALTER TABLE [Production].[Product_copy] WITH NOCHECK
  ADD CONSTRAINT [CK_Product_ProductLine_copy] CHECK (upper([ProductLine])='R' OR upper([ProductLine])='M' OR upper([ProductLine])='T' OR upper([ProductLine])='S' OR [ProductLine] IS NULL)
GO

ALTER TABLE [Production].[Product_copy] WITH NOCHECK
  ADD CONSTRAINT [CK_Product_ReorderPoint_copy] CHECK ([ReorderPoint]>(0))
GO

ALTER TABLE [Production].[Product_copy] WITH NOCHECK
  ADD CONSTRAINT [CK_Product_SafetyStockLevel_copy] CHECK ([SafetyStockLevel]>(0))
GO

ALTER TABLE [Production].[Product_copy] WITH NOCHECK
  ADD CONSTRAINT [CK_Product_SellEndDate_copy] CHECK ([SellEndDate]>=[SellStartDate] OR [SellEndDate] IS NULL)
GO

ALTER TABLE [Production].[Product_copy] WITH NOCHECK
  ADD CONSTRAINT [CK_Product_StandardCost_copy] CHECK ([StandardCost]>=(0.00))
GO

ALTER TABLE [Production].[Product_copy] WITH NOCHECK
  ADD CONSTRAINT [CK_Product_Style_copy] CHECK (upper([Style])='U' OR upper([Style])='M' OR upper([Style])='W' OR [Style] IS NULL)
GO

ALTER TABLE [Production].[Product_copy] WITH NOCHECK
  ADD CONSTRAINT [CK_Product_Weight_copy] CHECK ([Weight]>(0.00))
GO

CREATE UNIQUE INDEX [AK_Product_Name]
  ON [Production].[Product_copy] ([Name])
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX [AK_Product_ProductNumber]
  ON [Production].[Product_copy] ([ProductNumber])
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX [AK_Product_rowguid]
  ON [Production].[Product_copy] ([rowguid])
  ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [Class]=''h'' OR [Class]=''m'' OR [Class]=''l'' OR [Class]=''H'' OR [Class]=''M'' OR [Class]=''L'' OR [Class] IS NULL', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'CONSTRAINT', N'CK_Product_Class_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [DaysToManufacture] >= (0)', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'CONSTRAINT', N'CK_Product_DaysToManufacture_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [ListPrice] >= (0.00)', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'CONSTRAINT', N'CK_Product_ListPrice_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [ProductLine]=''r'' OR [ProductLine]=''m'' OR [ProductLine]=''t'' OR [ProductLine]=''s'' OR [ProductLine]=''R'' OR [ProductLine]=''M'' OR [ProductLine]=''T'' OR [ProductLine]=''S'' OR [ProductLine] IS NULL', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'CONSTRAINT', N'CK_Product_ProductLine_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [ReorderPoint] > (0)', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'CONSTRAINT', N'CK_Product_ReorderPoint_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [SafetyStockLevel] > (0)', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'CONSTRAINT', N'CK_Product_SafetyStockLevel_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [SellEndDate] >= [SellStartDate] OR [SellEndDate] IS NULL', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'CONSTRAINT', N'CK_Product_SellEndDate_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [SafetyStockLevel] > (0)', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'CONSTRAINT', N'CK_Product_StandardCost_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [Style]=''u'' OR [Style]=''m'' OR [Style]=''w'' OR [Style]=''U'' OR [Style]=''M'' OR [Style]=''W'' OR [Style] IS NULL', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'CONSTRAINT', N'CK_Product_Style_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [Weight] > (0.00)', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'CONSTRAINT', N'CK_Product_Weight_copy'
GO

ALTER TABLE [Production].[Product_copy] WITH NOCHECK
  ADD CONSTRAINT [FK_Product_ProductModel_ProductModelID_copy] FOREIGN KEY ([ProductModelID]) REFERENCES [Production].[ProductModel] ([ProductModelID])
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing ProductModel.ProductModelID.', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'CONSTRAINT', N'FK_Product_ProductModel_ProductModelID_copy'
GO

ALTER TABLE [Production].[Product_copy] WITH NOCHECK
  ADD CONSTRAINT [FK_Product_ProductSubcategory_ProductSubcategoryID_copy] FOREIGN KEY ([ProductSubcategoryID]) REFERENCES [Production].[ProductSubcategory] ([ProductSubcategoryID])
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing ProductSubcategory.ProductSubcategoryID.', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'CONSTRAINT', N'FK_Product_ProductSubcategory_ProductSubcategoryID_copy'
GO

ALTER TABLE [Production].[Product_copy] WITH NOCHECK
  ADD CONSTRAINT [FK_Product_UnitMeasure_SizeUnitMeasureCode_copy] FOREIGN KEY ([SizeUnitMeasureCode]) REFERENCES [Production].[UnitMeasure] ([UnitMeasureCode])
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing UnitMeasure.UnitMeasureCode.', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'CONSTRAINT', N'FK_Product_UnitMeasure_SizeUnitMeasureCode_copy'
GO

ALTER TABLE [Production].[Product_copy] WITH NOCHECK
  ADD CONSTRAINT [FK_Product_UnitMeasure_WeightUnitMeasureCode_copy] FOREIGN KEY ([WeightUnitMeasureCode]) REFERENCES [Production].[UnitMeasure] ([UnitMeasureCode])
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing UnitMeasure.UnitMeasureCode.', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'CONSTRAINT', N'FK_Product_UnitMeasure_WeightUnitMeasureCode_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Products sold or used in the manfacturing of sold products.', 'SCHEMA', N'Production', 'TABLE', N'Product_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for Product records.', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'COLUMN', N'ProductID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Name of the product.', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'COLUMN', N'Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique product identification number.', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'COLUMN', N'ProductNumber'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'0 = Product is purchased, 1 = Product is manufactured in-house.', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'COLUMN', N'MakeFlag'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'0 = Product is not a salable item. 1 = Product is salable.', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'COLUMN', N'FinishedGoodsFlag'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product color.', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'COLUMN', N'Color'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Minimum inventory quantity. ', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'COLUMN', N'SafetyStockLevel'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Inventory level that triggers a purchase order or work order. ', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'COLUMN', N'ReorderPoint'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Standard cost of the product.', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'COLUMN', N'StandardCost'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Selling price.', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'COLUMN', N'ListPrice'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product size.', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'COLUMN', N'Size'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unit of measure for Size column.', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'COLUMN', N'SizeUnitMeasureCode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unit of measure for Weight column.', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'COLUMN', N'WeightUnitMeasureCode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product weight.', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'COLUMN', N'Weight'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Number of days required to manufacture the product.', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'COLUMN', N'DaysToManufacture'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'R = Road, M = Mountain, T = Touring, S = Standard', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'COLUMN', N'ProductLine'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'H = High, M = Medium, L = Low', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'COLUMN', N'Class'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'W = Womens, M = Mens, U = Universal', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'COLUMN', N'Style'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product is a member of this product subcategory. Foreign key to ProductSubCategory.ProductSubCategoryID. ', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'COLUMN', N'ProductSubcategoryID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product is a member of this product model. Foreign key to ProductModel.ProductModelID.', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'COLUMN', N'ProductModelID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date the product was available for sale.', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'COLUMN', N'SellStartDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date the product was no longer available for sale.', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'COLUMN', N'SellEndDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date the product was discontinued.', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'COLUMN', N'DiscontinuedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'COLUMN', N'rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index.', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'INDEX', N'AK_Product_Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index.', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'INDEX', N'AK_Product_ProductNumber'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index. Used to support replication samples.', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'INDEX', N'AK_Product_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'INDEX', N'PK_Product_ProductID_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'CONSTRAINT', N'PK_Product_ProductID_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of  1', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'CONSTRAINT', N'DF_Product_FinishedGoodsFlag_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of  1', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'CONSTRAINT', N'DF_Product_MakeFlag_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'CONSTRAINT', N'DF_Product_ModifiedDate_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'Production', 'TABLE', N'Product_copy', 'CONSTRAINT', N'DF_Product_rowguid_copy'
GO