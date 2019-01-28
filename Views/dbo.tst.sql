SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE VIEW [dbo].[tst] 
AS SELECT

  StartDate
  ,EndDate
  ,ModifiedDate
FROM AdventureWorks2016CTP3.HumanResources.EmployeeDepartmentHistory
GO