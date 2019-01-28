SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE VIEW [dbo].[view1] 
AS -- коммент
SELECT
  ap.AccountId
 ,ap.ExternalCustomerId
 ,ap.OwnerEmail
FROM AccountProfiles ap
GO