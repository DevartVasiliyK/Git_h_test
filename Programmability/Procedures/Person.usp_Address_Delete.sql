SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROC [Person].[usp_Address_Delete] 
@AddressID int,
@AddressLine1 nvarchar(60),
@AddressLine2 nvarchar(60),
@City nvarchar(30),
@StateProvinceID int,
@PostalCode nvarchar(15),
@rowguid uniqueidentifier
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRAN

    DELETE
    FROM   Person.Address
    WHERE  AddressID = @AddressID AND AddressLine1 = @AddressLine1 AND AddressLine2 = @AddressLine2 AND City = @City AND StateProvinceID = @StateProvinceID AND PostalCode = @PostalCode AND rowguid = @rowguid

    COMMIT
GO