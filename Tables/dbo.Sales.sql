CREATE TABLE [dbo].[Sales] (
  [OrderID] [int] NULL,
  [SalesItem] [nvarchar](40) NULL,
  [Price] [int] NULL,
  [Discount] [int] NULL
)
ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'VirtualFolder', N'dbo', 'SCHEMA', N'dbo', 'TABLE', N'Sales'
GO