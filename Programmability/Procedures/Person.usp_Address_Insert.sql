SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROC [Person].[usp_Address_Insert] 
    @AddressID int,
    @AddressLine1 nvarchar(60),
    @AddressLine2 nvarchar(60),
    @City nvarchar(30),
    @StateProvinceID int,
    @PostalCode nvarchar(15),
    @SpatialLocation geography,
    @rowguid uniqueidentifier,
    @ModifiedDate datetime
AS 
    SET NOCOUNT ON 
    SET XACT_ABORT ON  

    BEGIN TRAN

    INSERT INTO Person.Address (AddressID, AddressLine1, AddressLine2, City, StateProvinceID, PostalCode, 
                                SpatialLocation, rowguid, ModifiedDate)
    SELECT @AddressID, @AddressLine1, @AddressLine2, @City, @StateProvinceID, @PostalCode, @SpatialLocation, 
           @rowguid, @ModifiedDate

    /*
    -- Begin Return row code block

    SELECT AddressID, AddressLine1, AddressLine2, City, StateProvinceID, PostalCode, SpatialLocation, 
           rowguid, ModifiedDate
    FROM   Person.Address
    WHERE  AddressID = @AddressID AND AddressLine1 = @AddressLine1 AND AddressLine2 = @AddressLine2 AND 
           City = @City AND StateProvinceID = @StateProvinceID AND PostalCode = @PostalCode AND SpatialLocation = @SpatialLocation AND 
           rowguid = @rowguid AND ModifiedDate = @ModifiedDate

    -- End Return row code block

    */
    COMMIT
GO