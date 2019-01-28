CREATE TABLE [dbo].[AccountProfiles] (
  [AccountId] [int] NOT NULL,
  [ExternalCustomerId] [uniqueidentifier] NOT NULL,
  [AccountName] [nvarchar](128) NULL,
  [CreatedAt] [date] NULL,
  [OwnerName] [nvarchar](128) NULL,
  [OwnerEmail] [nvarchar](128) NULL,
  [SubscriptionPlan] [nvarchar](128) NULL,
  [SubscriptionReference] [nvarchar](50) NULL,
  [IsTrialUsed] [bit] NOT NULL DEFAULT (0),
  [HasPurchases] [bit] NULL DEFAULT (0),
  [ActiveMembers] [int] NULL,
  [LockedMembers] [int] NULL,
  [LockedBySubscriptionMembers] [int] NULL,
  [LastTimeEntryDate] [date] NULL
)
ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'VirtualFolder', N'dbo', 'SCHEMA', N'dbo', 'TABLE', N'AccountProfiles'
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'1', 'SCHEMA', N'dbo', 'TABLE', N'AccountProfiles', 'COLUMN', N'LastTimeEntryDate'
GO