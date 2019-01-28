SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE VIEW [HumanResources].[vEmployee_copy2] 
AS SELECT 
    e.[BusinessEntityID]
    ,p.[Title]
    ,p.[FirstName]
   
FROM [HumanResources].[Employee] e
	INNER JOIN [Person].[Person] p
	ON p.[BusinessEntityID] = e.[BusinessEntityID]
    INNER JOIN [Person].[BusinessEntityAddress] bea 
    ON bea.[BusinessEntityID] = e.[BusinessEntityID] 
    INNER JOIN [Person].[Address] a 
    ON a.[AddressID] = bea.[AddressID]
    INNER JOIN [Person].[StateProvince] sp 
    ON sp.[StateProvinceID] = a.[StateProvinceID]
    INNER JOIN [Person].[CountryRegion] cr 
    ON cr.[CountryRegionCode] = sp.[CountryRegionCode]
    LEFT OUTER JOIN [Person].[PersonPhone] pp
    ON pp.BusinessEntityID = p.[BusinessEntityID]
    LEFT OUTER JOIN [Person].[PhoneNumberType] pnt
    ON pp.[PhoneNumberTypeID] = pnt.[PhoneNumberTypeID]
    LEFT OUTER JOIN [Person].[EmailAddress] ea
    ON p.[BusinessEntityID] = ea.[BusinessEntityID]
GO

EXEC sys.sp_addextendedproperty N'MS_Description', N'Employee names and addresses.', 'SCHEMA', N'HumanResources', 'VIEW', N'vEmployee_copy2'
GO