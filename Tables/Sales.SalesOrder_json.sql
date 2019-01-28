CREATE TABLE [Sales].[SalesOrder_json] (
  [SalesOrderID] [int] NOT NULL,
  [RevisionNumber] [tinyint] NOT NULL CONSTRAINT [DF_SalesOrder_RevisionNumber] DEFAULT (0),
  [OrderDate] [datetime] NOT NULL CONSTRAINT [DF_SalesOrder_OrderDate] DEFAULT (getdate()),
  [DueDate] [datetime] NOT NULL,
  [ShipDate] [datetime] NULL,
  [Status] [tinyint] NOT NULL CONSTRAINT [DF_SalesOrder_Status] DEFAULT (1),
  [OnlineOrderFlag] [dbo].[Flag] NOT NULL CONSTRAINT [DF_SalesOrder_OnlineOrderFlag] DEFAULT (1),
  [SalesOrderNumber] AS (isnull(N'SO'+CONVERT([nvarchar](23),[SalesOrderID]),N'*** ERROR ***')),
  [PurchaseOrderNumber] [dbo].[OrderNumber] NULL,
  [AccountNumber] [dbo].[AccountNumber] NULL,
  [CustomerID] [int] NOT NULL,
  [SalesPersonID] [int] NULL,
  [TerritoryID] [int] NULL,
  [BillToAddressID] [int] NULL,
  [ShipToAddressID] [int] NULL,
  [ShipMethodID] [int] NULL,
  [CreditCardID] [int] NULL,
  [CreditCardApprovalCode] [varchar](15) NULL,
  [CurrencyRateID] [int] NULL,
  [SubTotal] [money] NOT NULL CONSTRAINT [DF_SalesOrder_SubTotal] DEFAULT (0.00),
  [TaxAmt] [money] NOT NULL CONSTRAINT [DF_SalesOrder_TaxAmt] DEFAULT (0.00),
  [Freight] [money] NOT NULL CONSTRAINT [DF_SalesOrder_Freight] DEFAULT (0.00),
  [TotalDue] AS (isnull(([SubTotal]+[TaxAmt])+[Freight],(0))),
  [Comment] [nvarchar](128) NULL,
  [rowguid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_SalesOrder_rowguid] DEFAULT (newid()) ROWGUIDCOL,
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_SalesOrder_ModifiedDate] DEFAULT (getdate()),
  CONSTRAINT [PK_SalesOrder__json_SalesOrderID] PRIMARY KEY CLUSTERED ([SalesOrderID])
)
ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'VirtualFolder', N'Sales', 'SCHEMA', N'Sales', 'TABLE', N'SalesOrder_json'
GO