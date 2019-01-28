CREATE TABLE [Person].[Person_json] (
  [PersonID] [int] IDENTITY NOT FOR REPLICATION,
  [PersonType] [nchar](2) NOT NULL,
  [NameStyle] [dbo].[NameStyle] NOT NULL DEFAULT (0),
  [Title] [nvarchar](8) NULL,
  [FirstName] [dbo].[Name] NOT NULL,
  [MiddleName] [dbo].[Name] NULL,
  [LastName] [dbo].[Name] NOT NULL,
  [Suffix] [nvarchar](10) NULL,
  [EmailPromotion] [int] NOT NULL DEFAULT (0),
  [AdditionalContactInfo] [nvarchar](max) NULL,
  [Demographics] [nvarchar](max) NULL,
  [rowguid] [uniqueidentifier] NOT NULL DEFAULT (newid()) ROWGUIDCOL,
  [ModifiedDate] [datetime] NOT NULL DEFAULT (getdate()),
  CONSTRAINT [PK_Person_json_PersonID] PRIMARY KEY CLUSTERED ([PersonID]),
  CONSTRAINT [AdditionalContactInfo must be formatted as JSON] CHECK (isjson([AdditionalContactInfo])>(0)),
  CONSTRAINT [Demographics must be formatted as JSON] CHECK (isjson([Demographics])>(0))
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'VirtualFolder', N'Person', 'SCHEMA', N'Person', 'TABLE', N'Person_json'
GO