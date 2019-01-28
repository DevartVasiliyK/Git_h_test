﻿CREATE TABLE [Purchasing].[ShipMethod] (
  [ShipMethodID] [int] IDENTITY,
  [Name] [dbo].[Name] NOT NULL,
  [ShipBase] [money] NOT NULL CONSTRAINT [DF_ShipMethod_ShipBase] DEFAULT (0.00),
  [ShipRate] [money] NOT NULL CONSTRAINT [DF_ShipMethod_ShipRate] DEFAULT (0.00),
  [rowguid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_ShipMethod_rowguid] DEFAULT (newid()) ROWGUIDCOL,
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_ShipMethod_ModifiedDate] DEFAULT (getdate()),
  CONSTRAINT [PK_ShipMethod_ShipMethodID] PRIMARY KEY CLUSTERED ([ShipMethodID]),
  CONSTRAINT [CK_ShipMethod_ShipBase] CHECK ([ShipBase]>(0.00)),
  CONSTRAINT [CK_ShipMethod_ShipRate] CHECK ([ShipRate]>(0.00))
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [AK_ShipMethod_Name]
  ON [Purchasing].[ShipMethod] ([Name])
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX [AK_ShipMethod_rowguid]
  ON [Purchasing].[ShipMethod] ([rowguid])
  ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Shipping company lookup table.', 'SCHEMA', N'Purchasing', 'TABLE', N'ShipMethod'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for ShipMethod records.', 'SCHEMA', N'Purchasing', 'TABLE', N'ShipMethod', 'COLUMN', N'ShipMethodID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Shipping company name.', 'SCHEMA', N'Purchasing', 'TABLE', N'ShipMethod', 'COLUMN', N'Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Minimum shipping charge.', 'SCHEMA', N'Purchasing', 'TABLE', N'ShipMethod', 'COLUMN', N'ShipBase'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Shipping charge per pound.', 'SCHEMA', N'Purchasing', 'TABLE', N'ShipMethod', 'COLUMN', N'ShipRate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'Purchasing', 'TABLE', N'ShipMethod', 'COLUMN', N'rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Purchasing', 'TABLE', N'ShipMethod', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index.', 'SCHEMA', N'Purchasing', 'TABLE', N'ShipMethod', 'INDEX', N'AK_ShipMethod_Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index. Used to support replication samples.', 'SCHEMA', N'Purchasing', 'TABLE', N'ShipMethod', 'INDEX', N'AK_ShipMethod_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Purchasing', 'TABLE', N'ShipMethod', 'INDEX', N'PK_ShipMethod_ShipMethodID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Purchasing', 'TABLE', N'ShipMethod', 'CONSTRAINT', N'PK_ShipMethod_ShipMethodID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [ShipBase] > (0.00)', 'SCHEMA', N'Purchasing', 'TABLE', N'ShipMethod', 'CONSTRAINT', N'CK_ShipMethod_ShipBase'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [ShipRate] > (0.00)', 'SCHEMA', N'Purchasing', 'TABLE', N'ShipMethod', 'CONSTRAINT', N'CK_ShipMethod_ShipRate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Purchasing', 'TABLE', N'ShipMethod', 'CONSTRAINT', N'DF_ShipMethod_ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'Purchasing', 'TABLE', N'ShipMethod', 'CONSTRAINT', N'DF_ShipMethod_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 0.0', 'SCHEMA', N'Purchasing', 'TABLE', N'ShipMethod', 'CONSTRAINT', N'DF_ShipMethod_ShipBase'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 0.0', 'SCHEMA', N'Purchasing', 'TABLE', N'ShipMethod', 'CONSTRAINT', N'DF_ShipMethod_ShipRate'
GO