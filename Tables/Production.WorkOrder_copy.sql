CREATE TABLE [Production].[WorkOrder_copy] (
  [WorkOrderID] [int] IDENTITY,
  [ProductID] [int] NOT NULL,
  [OrderQty] [int] NOT NULL,
  [StockedQty] AS (isnull([OrderQty]-[ScrappedQty],(0))),
  [ScrappedQty] [smallint] NOT NULL,
  [StartDate] [datetime] NOT NULL,
  [EndDate] [datetime] NULL,
  [DueDate] [datetime] NOT NULL,
  [ScrapReasonID] [smallint] NULL,
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_WorkOrder_ModifiedDate_copy] DEFAULT (getdate()),
  CONSTRAINT [PK_WorkOrder_WorkOrderID_copy] PRIMARY KEY CLUSTERED ([WorkOrderID])
)
ON [PRIMARY]
GO

ALTER TABLE [Production].[WorkOrder_copy] WITH NOCHECK
  ADD CONSTRAINT [CK_WorkOrder_EndDate_copy] CHECK ([EndDate]>=[StartDate] OR [EndDate] IS NULL)
GO

ALTER TABLE [Production].[WorkOrder_copy] WITH NOCHECK
  ADD CONSTRAINT [CK_WorkOrder_OrderQty_copy] CHECK ([OrderQty]>(0))
GO

ALTER TABLE [Production].[WorkOrder_copy] WITH NOCHECK
  ADD CONSTRAINT [CK_WorkOrder_ScrappedQty_copy] CHECK ([ScrappedQty]>=(0))
GO

CREATE INDEX [IX_WorkOrder_ProductID]
  ON [Production].[WorkOrder_copy] ([ProductID])
  ON [PRIMARY]
GO

CREATE INDEX [IX_WorkOrder_ScrapReasonID]
  ON [Production].[WorkOrder_copy] ([ScrapReasonID])
  ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [EndDate] >= [StartDate] OR [EndDate] IS NULL', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder_copy', 'CONSTRAINT', N'CK_WorkOrder_EndDate_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [OrderQty] > (0)', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder_copy', 'CONSTRAINT', N'CK_WorkOrder_OrderQty_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [ScrappedQty] >= (0)', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder_copy', 'CONSTRAINT', N'CK_WorkOrder_ScrappedQty_copy'
GO

ALTER TABLE [Production].[WorkOrder_copy] WITH NOCHECK
  ADD CONSTRAINT [FK_WorkOrder_Product_ProductID_copy] FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product] ([ProductID])
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Product.ProductID.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder_copy', 'CONSTRAINT', N'FK_WorkOrder_Product_ProductID_copy'
GO

ALTER TABLE [Production].[WorkOrder_copy] WITH NOCHECK
  ADD CONSTRAINT [FK_WorkOrder_ScrapReason_ScrapReasonID_copy] FOREIGN KEY ([ScrapReasonID]) REFERENCES [Production].[ScrapReason] ([ScrapReasonID])
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing ScrapReason.ScrapReasonID.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder_copy', 'CONSTRAINT', N'FK_WorkOrder_ScrapReason_ScrapReasonID_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Manufacturing work orders.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for WorkOrder records.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder_copy', 'COLUMN', N'WorkOrderID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product identification number. Foreign key to Product.ProductID.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder_copy', 'COLUMN', N'ProductID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Product quantity to build.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder_copy', 'COLUMN', N'OrderQty'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Quantity built and put in inventory.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder_copy', 'COLUMN', N'StockedQty'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Quantity that failed inspection.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder_copy', 'COLUMN', N'ScrappedQty'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Work order start date.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder_copy', 'COLUMN', N'StartDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Work order end date.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder_copy', 'COLUMN', N'EndDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Work order due date.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder_copy', 'COLUMN', N'DueDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Reason for inspection failure.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder_copy', 'COLUMN', N'ScrapReasonID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder_copy', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder_copy', 'INDEX', N'IX_WorkOrder_ProductID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Nonclustered index.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder_copy', 'INDEX', N'IX_WorkOrder_ScrapReasonID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder_copy', 'INDEX', N'PK_WorkOrder_WorkOrderID_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder_copy', 'CONSTRAINT', N'PK_WorkOrder_WorkOrderID_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Production', 'TABLE', N'WorkOrder_copy', 'CONSTRAINT', N'DF_WorkOrder_ModifiedDate_copy'
GO