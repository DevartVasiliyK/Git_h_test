CREATE TABLE [Person].[Person_copy] (
  [BusinessEntityID] [int] NOT NULL,
  [PersonType] [nchar](2) NOT NULL,
  [NameStyle] [dbo].[NameStyle] NOT NULL CONSTRAINT [DF_Person_NameStyle_copy] DEFAULT (0),
  [Title] [nvarchar](8) NULL,
  [FirstName] [dbo].[Name] NOT NULL,
  [MiddleName] [dbo].[Name] NULL,
  [LastName] [dbo].[Name] NOT NULL,
  [Suffix] [nvarchar](10) NULL,
  [EmailPromotion] [int] NOT NULL CONSTRAINT [DF_Person_EmailPromotion_copy] DEFAULT (0),
  [AdditionalContactInfo] [xml] (CONTENT Person.AdditionalContactInfoSchemaCollection) NULL,
  [Demographics] [xml] (CONTENT Person.IndividualSurveySchemaCollection) NULL,
  [rowguid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Person_rowguid_copy] DEFAULT (newid()) ROWGUIDCOL,
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_Person_ModifiedDate_copy] DEFAULT (getdate()),
  CONSTRAINT [PK_Person_BusinessEntityID_copy] PRIMARY KEY CLUSTERED ([BusinessEntityID])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [Person].[Person_copy] WITH NOCHECK
  ADD CONSTRAINT [CK_Person_EmailPromotion_copy] CHECK ([EmailPromotion]>=(0) AND [EmailPromotion]<=(2))
GO

ALTER TABLE [Person].[Person_copy] WITH NOCHECK
  ADD CONSTRAINT [CK_Person_PersonType_copy] CHECK ([PersonType] IS NULL OR (upper([PersonType])='GC' OR upper([PersonType])='SP' OR upper([PersonType])='EM' OR upper([PersonType])='IN' OR upper([PersonType])='VC' OR upper([PersonType])='SC'))
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PRIMARY XML INDEX [PXML_Person_Demographics]
  ON [Person].[Person_copy] ([Demographics])
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PRIMARY XML INDEX [PXML_Person_AddContact]
  ON [Person].[Person_copy] ([AdditionalContactInfo])
GO

CREATE UNIQUE INDEX [AK_Person_rowguid]
  ON [Person].[Person_copy] ([rowguid])
  ON [PRIMARY]
GO

CREATE INDEX [IX_Person_LastName_FirstName_MiddleName]
  ON [Person].[Person_copy] ([LastName], [FirstName], [MiddleName])
  ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE XML INDEX [XMLPATH_Person_Demographics]
  ON [Person].[Person_copy] ([Demographics])
  USING XML INDEX [PXML_Person_Demographics] FOR PATH
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE XML INDEX [XMLPROPERTY_Person_Demographics]
  ON [Person].[Person_copy] ([Demographics])
  USING XML INDEX [PXML_Person_Demographics] FOR PROPERTY
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE XML INDEX [XMLVALUE_Person_Demographics]
  ON [Person].[Person_copy] ([Demographics])
  USING XML INDEX [PXML_Person_Demographics] FOR VALUE
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [EmailPromotion] >= (0) AND [EmailPromotion] <= (2)', 'SCHEMA', N'Person', 'TABLE', N'Person_copy', 'CONSTRAINT', N'CK_Person_EmailPromotion_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [PersonType] is one of SC, VC, IN, EM or SP.', 'SCHEMA', N'Person', 'TABLE', N'Person_copy', 'CONSTRAINT', N'CK_Person_PersonType_copy'
GO

ALTER TABLE [Person].[Person_copy] WITH NOCHECK
  ADD CONSTRAINT [FK_Person_BusinessEntity_BusinessEntityID_copy] FOREIGN KEY ([BusinessEntityID]) REFERENCES [Person].[BusinessEntity] ([BusinessEntityID])
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing BusinessEntity.BusinessEntityID.', 'SCHEMA', N'Person', 'TABLE', N'Person_copy', 'CONSTRAINT', N'FK_Person_BusinessEntity_BusinessEntityID_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary XML index.', 'SCHEMA', N'Person', 'TABLE', N'Person_copy', 'INDEX', N'PXML_Person_Demographics'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary XML index.', 'SCHEMA', N'Person', 'TABLE', N'Person_copy', 'INDEX', N'PXML_Person_AddContact'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Secondary XML index for path.', 'SCHEMA', N'Person', 'TABLE', N'Person_copy', 'INDEX', N'XMLPATH_Person_Demographics'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Secondary XML index for property.', 'SCHEMA', N'Person', 'TABLE', N'Person_copy', 'INDEX', N'XMLPROPERTY_Person_Demographics'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Secondary XML index for value.', 'SCHEMA', N'Person', 'TABLE', N'Person_copy', 'INDEX', N'XMLVALUE_Person_Demographics'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Human beings involved with AdventureWorks: employees, customer contacts, and vendor contacts.', 'SCHEMA', N'Person', 'TABLE', N'Person_copy'
GO

EXEC sys.sp_addextendedproperty N'VirtualFolder', N'Person', 'SCHEMA', N'Person', 'TABLE', N'Person_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for Person records.', 'SCHEMA', N'Person', 'TABLE', N'Person_copy', 'COLUMN', N'BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary type of person: SC = Store Contact, IN = Individual (retail) customer, SP = Sales person, EM = Employee (non-sales), VC = Vendor contact, GC = General contact', 'SCHEMA', N'Person', 'TABLE', N'Person_copy', 'COLUMN', N'PersonType'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'0 = The data in FirstName and LastName are stored in western style (first name, last name) order.  1 = Eastern style (last name, first name) order.', 'SCHEMA', N'Person', 'TABLE', N'Person_copy', 'COLUMN', N'NameStyle'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'A courtesy title. For example, Mr. or Ms.', 'SCHEMA', N'Person', 'TABLE', N'Person_copy', 'COLUMN', N'Title'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'First name of the person.', 'SCHEMA', N'Person', 'TABLE', N'Person_copy', 'COLUMN', N'FirstName'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Middle name or middle initial of the person.', 'SCHEMA', N'Person', 'TABLE', N'Person_copy', 'COLUMN', N'MiddleName'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Last name of the person.', 'SCHEMA', N'Person', 'TABLE', N'Person_copy', 'COLUMN', N'LastName'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Surname suffix. For example, Sr. or Jr.', 'SCHEMA', N'Person', 'TABLE', N'Person_copy', 'COLUMN', N'Suffix'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'0 = Contact does not wish to receive e-mail promotions, 1 = Contact does wish to receive e-mail promotions from AdventureWorks, 2 = Contact does wish to receive e-mail promotions from AdventureWorks and selected partners. ', 'SCHEMA', N'Person', 'TABLE', N'Person_copy', 'COLUMN', N'EmailPromotion'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Additional contact information about the person stored in xml format. ', 'SCHEMA', N'Person', 'TABLE', N'Person_copy', 'COLUMN', N'AdditionalContactInfo'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Personal information such as hobbies, and income collected from online shoppers. Used for sales analysis.', 'SCHEMA', N'Person', 'TABLE', N'Person_copy', 'COLUMN', N'Demographics'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'Person', 'TABLE', N'Person_copy', 'COLUMN', N'rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'Person', 'TABLE', N'Person_copy', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index. Used to support replication samples.', 'SCHEMA', N'Person', 'TABLE', N'Person_copy', 'INDEX', N'AK_Person_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'Person', 'TABLE', N'Person_copy', 'INDEX', N'PK_Person_BusinessEntityID_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'Person', 'TABLE', N'Person_copy', 'CONSTRAINT', N'PK_Person_BusinessEntityID_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 0', 'SCHEMA', N'Person', 'TABLE', N'Person_copy', 'CONSTRAINT', N'DF_Person_EmailPromotion_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'Person', 'TABLE', N'Person_copy', 'CONSTRAINT', N'DF_Person_ModifiedDate_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 0', 'SCHEMA', N'Person', 'TABLE', N'Person_copy', 'CONSTRAINT', N'DF_Person_NameStyle_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'Person', 'TABLE', N'Person_copy', 'CONSTRAINT', N'DF_Person_rowguid_copy'
GO