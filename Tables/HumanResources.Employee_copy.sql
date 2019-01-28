CREATE TABLE [HumanResources].[Employee_copy] (
  [BusinessEntityID] [int] NOT NULL,
  [NationalIDNumber] [nvarchar](15) NOT NULL,
  [LoginID] [nvarchar](256) NOT NULL,
  [OrganizationNode] [hierarchyid] NULL,
  [OrganizationLevel] AS ([OrganizationNode].[GetLevel]()),
  [JobTitle] [nvarchar](50) NOT NULL,
  [BirthDate] [date] NOT NULL,
  [MaritalStatus] [nchar](1) NOT NULL,
  [Gender] [nchar](1) NOT NULL,
  [HireDate] [date] NOT NULL,
  [SalariedFlag] [dbo].[Flag] NOT NULL CONSTRAINT [DF_Employee_SalariedFlag_copy] DEFAULT (1),
  [VacationHours] [smallint] NOT NULL CONSTRAINT [DF_Employee_VacationHours_copy] DEFAULT (0),
  [SickLeaveHours] [smallint] NOT NULL CONSTRAINT [DF_Employee_SickLeaveHours_copy] DEFAULT (0),
  [CurrentFlag] [dbo].[Flag] NOT NULL CONSTRAINT [DF_Employee_CurrentFlag_copy] DEFAULT (1),
  [rowguid] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Employee_rowguid_copy] DEFAULT (newid()) ROWGUIDCOL,
  [ModifiedDate] [datetime] NOT NULL CONSTRAINT [DF_Employee_ModifiedDate_copy] DEFAULT (getdate()),
  CONSTRAINT [PK_Employee_BusinessEntityID_copy] PRIMARY KEY CLUSTERED ([BusinessEntityID]),
  CONSTRAINT [CK_Employee_BirthDate_copy] CHECK ([BirthDate]>='1930-01-01' AND [BirthDate]<=dateadd(year,(-18),getdate())),
  CONSTRAINT [CK_Employee_Gender_copy] CHECK (upper([Gender])='F' OR upper([Gender])='M'),
  CONSTRAINT [CK_Employee_HireDate_copy] CHECK ([HireDate]>='1996-07-01' AND [HireDate]<=dateadd(day,(1),getdate())),
  CONSTRAINT [CK_Employee_MaritalStatus_copy] CHECK (upper([MaritalStatus])='S' OR upper([MaritalStatus])='M'),
  CONSTRAINT [CK_Employee_SickLeaveHours_copy] CHECK ([SickLeaveHours]>=(0) AND [SickLeaveHours]<=(120)),
  CONSTRAINT [CK_Employee_VacationHours_copy] CHECK ([VacationHours]>=(-40) AND [VacationHours]<=(240))
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [AK_Employee_LoginID]
  ON [HumanResources].[Employee_copy] ([LoginID])
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX [AK_Employee_NationalIDNumber]
  ON [HumanResources].[Employee_copy] ([NationalIDNumber])
  ON [PRIMARY]
GO

CREATE UNIQUE INDEX [AK_Employee_rowguid]
  ON [HumanResources].[Employee_copy] ([rowguid])
  ON [PRIMARY]
GO

CREATE INDEX [IX_Employee_OrganizationLevel_OrganizationNode]
  ON [HumanResources].[Employee_copy] ([OrganizationLevel], [OrganizationNode])
  ON [PRIMARY]
GO

CREATE INDEX [IX_Employee_OrganizationNode]
  ON [HumanResources].[Employee_copy] ([OrganizationNode])
  ON [PRIMARY]
GO

ALTER TABLE [HumanResources].[Employee_copy]
  ADD CONSTRAINT [FK_Employee_Person_BusinessEntityID_copy] FOREIGN KEY ([BusinessEntityID]) REFERENCES [Person].[Person] ([BusinessEntityID])
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Foreign key constraint referencing Person.BusinessEntityID.', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee_copy', 'CONSTRAINT', N'FK_Employee_Person_BusinessEntityID_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Employee information such as salary, department, and title.', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee_copy'
GO

EXEC sys.sp_addextendedproperty N'VirtualFolder', N'HumanResources', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key for Employee records.  Foreign key to BusinessEntity.BusinessEntityID', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee_copy', 'COLUMN', N'BusinessEntityID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique national identification number such as a social security number.', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee_copy', 'COLUMN', N'NationalIDNumber'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Network login.', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee_copy', 'COLUMN', N'LoginID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Where the employee is located in corporate hierarchy.', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee_copy', 'COLUMN', N'OrganizationNode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'The depth of the employee in the corporate hierarchy.', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee_copy', 'COLUMN', N'OrganizationLevel'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Work title such as Buyer or Sales Representative.', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee_copy', 'COLUMN', N'JobTitle'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date of birth.', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee_copy', 'COLUMN', N'BirthDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'M = Married, S = Single', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee_copy', 'COLUMN', N'MaritalStatus'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'M = Male, F = Female', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee_copy', 'COLUMN', N'Gender'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Employee hired on this date.', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee_copy', 'COLUMN', N'HireDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Job classification. 0 = Hourly, not exempt from collective bargaining. 1 = Salaried, exempt from collective bargaining.', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee_copy', 'COLUMN', N'SalariedFlag'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Number of available vacation hours.', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee_copy', 'COLUMN', N'VacationHours'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Number of available sick leave hours.', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee_copy', 'COLUMN', N'SickLeaveHours'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'0 = Inactive, 1 = Active', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee_copy', 'COLUMN', N'CurrentFlag'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'ROWGUIDCOL number uniquely identifying the record. Used to support a merge replication sample.', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee_copy', 'COLUMN', N'rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Date and time the record was last updated.', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee_copy', 'COLUMN', N'ModifiedDate'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index.', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee_copy', 'INDEX', N'AK_Employee_LoginID'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index.', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee_copy', 'INDEX', N'AK_Employee_NationalIDNumber'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index. Used to support replication samples.', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee_copy', 'INDEX', N'AK_Employee_rowguid'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index.', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee_copy', 'INDEX', N'IX_Employee_OrganizationLevel_OrganizationNode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Unique nonclustered index.', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee_copy', 'INDEX', N'IX_Employee_OrganizationNode'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Clustered index created by a primary key constraint.', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee_copy', 'INDEX', N'PK_Employee_BusinessEntityID_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Primary key (clustered) constraint', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee_copy', 'CONSTRAINT', N'PK_Employee_BusinessEntityID_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [BirthDate] >= ''1930-01-01'' AND [BirthDate] <= dateadd(year,(-18),GETDATE())', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee_copy', 'CONSTRAINT', N'CK_Employee_BirthDate_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [Gender]=''f'' OR [Gender]=''m'' OR [Gender]=''F'' OR [Gender]=''M''', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee_copy', 'CONSTRAINT', N'CK_Employee_Gender_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [HireDate] >= ''1996-07-01'' AND [HireDate] <= dateadd(day,(1),GETDATE())', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee_copy', 'CONSTRAINT', N'CK_Employee_HireDate_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [MaritalStatus]=''s'' OR [MaritalStatus]=''m'' OR [MaritalStatus]=''S'' OR [MaritalStatus]=''M''', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee_copy', 'CONSTRAINT', N'CK_Employee_MaritalStatus_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [SickLeaveHours] >= (0) AND [SickLeaveHours] <= (120)', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee_copy', 'CONSTRAINT', N'CK_Employee_SickLeaveHours_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Check constraint [VacationHours] >= (-40) AND [VacationHours] <= (240)', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee_copy', 'CONSTRAINT', N'CK_Employee_VacationHours_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 1', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee_copy', 'CONSTRAINT', N'DF_Employee_CurrentFlag_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of GETDATE()', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee_copy', 'CONSTRAINT', N'DF_Employee_ModifiedDate_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of NEWID()', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee_copy', 'CONSTRAINT', N'DF_Employee_rowguid_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 1 (TRUE)', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee_copy', 'CONSTRAINT', N'DF_Employee_SalariedFlag_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 0', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee_copy', 'CONSTRAINT', N'DF_Employee_SickLeaveHours_copy'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Default constraint value of 0', 'SCHEMA', N'HumanResources', 'TABLE', N'Employee_copy', 'CONSTRAINT', N'DF_Employee_VacationHours_copy'
GO