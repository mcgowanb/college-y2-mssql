use Bsc21617
go
create proc InsertExample
@ProductDesc varchar(50), @ProductPrice money, @Quantity int
as
begin try
insert into dbo.producttbl
(ProductDesc,ProductPrice, QuantityInStock)
values
(@ProductDesc, @ProductPrice,@Quantity)
end try
begin catch
;throw
end catch