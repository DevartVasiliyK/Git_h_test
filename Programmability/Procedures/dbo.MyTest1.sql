SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROC [dbo].[MyTest1] 
  @Age INT, 
  @Surname VARCHAR(50) 
AS 
  SELECT * FROM MyTable mt 
  WHERE mt.Age = @Age AND mt.Surname = @Surname
GO