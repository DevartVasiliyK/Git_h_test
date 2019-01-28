CREATE TABLE [Purchasing].[Vendor_copy] (
  [BusinessEntityID] [int] NOT NULL,
  [AccountNumber] [dbo].[AccountNumber] NOT NULL,
  [Name] [dbo].[Name] NOT NULL,
  [CreditRating] [tinyint] NOT NULL,
  [PreferredVendorStatus] [dbo].[Flag] NOT NULL CONSTRAINT [DF_Vendor_PreferredVendorStatus_copy] DEFAULT (1),
  [ActiveFlag] [dbo].[Flag] NOT NULL CONSTRAINT [DF_Vendor_ActiveFlag_copy] DEFAULT (1),
  [PurchasingWebServiceURL] [nvarchar](1024) NULL,
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_Vendor_ModifiedDate_copy] DEFAULT (getdate()),
  CONSTRAINT [PK_Vendor_BusinessEntityID_copy] PRIMARY KEY CLUSTERED ([BusinessEntityID])
)
ON [PRIMARY]
GO

ALTER TABLE [Purchasing].[Vendor_copy] WITH NOCHECK
  ADD CONSTRAINT [CK_Vendor_CreditRating_copy] CHECK ([CreditRating]>=(1) AND [CreditRating]<=(5))
GO

CREATE UNIQUE INDEX [AK_Vendor_AccountNumber]
  ON [Purchasing].[Vendor_copy] ([AccountNumber])
  ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [CreditRating] BETWEEN (1) AND (5)', 'SCHEMA', N'Purchasing', 'TABLE', N'Vendor_copy', 'CONSTRAINT', N'CK_Vendor_CreditRating_copy'
GO

ALTER TABLE [Purchasing].[Vendor_copy] WITH NOCHECK
  ADD CONSTRAINT [FK_Vendor_BusinessEntity_BusinessEntityID_copy] FOREIGN KEY ([BusinessEntityID]) REFERENCES [Person].[BusinessEntity] ([BusinessEntityID])
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing BusinessEntity.BusinessEntityID', 'SCHEMA', N'Purchasing', 'TABLE', N'Vendor_copy', 'CONSTRAINT', N'FK_Vendor_BusinessEntity_BusinessEntityID_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Companies from whom Adventure Works Cycles purchases parts or other goods.', 'SCHEMA', N'Purchasing', 'TABLE', N'Vendor_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for Vendor records.  Foreign key to BusinessEntity.BusinessEntityID', 'SCHEMA', N'Purchasing', 'TABLE', N'Vendor_copy', 'COLUMN', N'BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Vendor account (identification) number.', 'SCHEMA', N'Purchasing', 'TABLE', N'Vendor_copy', 'COLUMN', N'AccountNumber'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Company name.', 'SCHEMA', N'Purchasing', 'TABLE', N'Vendor_copy', 'COLUMN', N'Name'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'1 = Superior, 2 = Excellent, 3 = Above average, 4 = Average, 5 = Below average', 'SCHEMA', N'Purchasing', 'TABLE', N'Vendor_copy', 'COLUMN', N'CreditRating'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'0 = Do not use if another vendor is available. 1 = Preferred over other vendors supplying the same product.', 'SCHEMA', N'Purchasing', 'TABLE', N'Vendor_copy', 'COLUMN', N'PreferredVendorStatus'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'0 = Vendor no longer used. 1 = Vendor is actively used.', 'SCHEMA', N'Purchasing', 'TABLE', N'Vendor_copy', 'COLUMN', N'ActiveFlag'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Vendor URL.', 'SCHEMA', N'Purchasing', 'TABLE', N'Vendor_copy', 'COLUMN', N'PurchasingWebServiceURL'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Purchasing', 'TABLE', N'Vendor_copy', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index.', 'SCHEMA', N'Purchasing', 'TABLE', N'Vendor_copy', 'INDEX', N'AK_Vendor_AccountNumber'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Purchasing', 'TABLE', N'Vendor_copy', 'INDEX', N'PK_Vendor_BusinessEntityID_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Purchasing', 'TABLE', N'Vendor_copy', 'CONSTRAINT', N'PK_Vendor_BusinessEntityID_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 1 (TRUE)', 'SCHEMA', N'Purchasing', 'TABLE', N'Vendor_copy', 'CONSTRAINT', N'DF_Vendor_ActiveFlag_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Purchasing', 'TABLE', N'Vendor_copy', 'CONSTRAINT', N'DF_Vendor_ModifiedDate_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 1 (TRUE)', 'SCHEMA', N'Purchasing', 'TABLE', N'Vendor_copy', 'CONSTRAINT', N'DF_Vendor_PreferredVendorStatus_copy'
GO