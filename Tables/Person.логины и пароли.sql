CREATE TABLE [Person].[логины и пароли] (
  [column1] [varchar](150) NULL
)
ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'VirtualFolder', N'Person', 'SCHEMA', N'Person', 'TABLE', N'логины и пароли'
GO