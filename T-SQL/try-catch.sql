BEGIN TRY
DELETE
FROM  dbo.CustomerTBL
WHERE CustomerID = 1
END TRY
BEGIN CATCH
;throw
END CATCH


USE S00165159
GO

BEGIN TRY
UPDATE dbo.ProductTBL
SET ProductPrice = 500
WHERE ProductID = 1
END TRY
BEGIN CATCH
;THROW
END CATCH

USE S00165159
GO

CREATE PROC updateProduct
@id int,
@price money
AS 
BEGIN TRY
UPDATE dbo.ProductTBL
SET ProductPrice = @price
WHERE ProductID = @id
END TRY
BEGIN CATCH
;THROW
END CATCH
--exec updateProduct @id=1, @price=250
