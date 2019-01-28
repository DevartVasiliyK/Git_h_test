CREATE TABLE [dbo].[ProductPhoto] (
  [ProductPhotoID] [varchar](512) NULL,
  [ThumbNailPhoto] [varchar](512) NULL,
  [ThumbnailPhotoFileName] [varchar](512) NULL,
  [LargePhoto] [varchar](512) NULL,
  [LargePhotoFileName] [varchar](512) NULL,
  [ModifiedDate] [varchar](512) NULL
)
ON [PRIMARY]
GO

EXEC sys.sp_addextendedproperty N'VirtualFolder', N'dbo', 'SCHEMA', N'dbo', 'TABLE', N'ProductPhoto'
GO