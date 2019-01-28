CREATE TABLE [dbo].[HumanResources_EmployeePayHistory] (
  [OrderTrackingID] [int] NULL,
  [SalesOrderID] [int] NULL,
  [CarrierTrackingNumber] [nvarchar](50) NULL,
  [TrackingEventID] [int] NULL,
  [EventDetails] [nvarchar](100) NULL,
  [EventDateTime] [datetime2] NULL
)
ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'VirtualFolder', N'dbo', 'SCHEMA', N'dbo', 'TABLE', N'HumanResources_EmployeePayHistory'
GO