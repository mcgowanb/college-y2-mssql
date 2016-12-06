
create proc DelExample
@productid int
as
BEGIN TRY
DELETE
FROM DBO.CustomerTBL
WHERE CustomerID = @productid
END TRY
BEGIN CATCH
;THROW
END CATCH