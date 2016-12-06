create proc UpdExample
-- put in the external variable here
-- remeber the variable data type must match it's column type
-- also remeber that you must be in at least SQL Server management Studio 2012
@ProductID int, @Newprice money
as
begin try
update dbo.ProductTBL
set ProductPrice=@Newprice
where ProductID = @ProductID
end try
begin catch
;throw
end catch