use s00165159
go
alter proc SampleOrder
-- inline comment
-- input variables before as
@CustomerID int, @ProductID int
,@OrderQuantity int
as
-- declare all internal Variables here
declare @QuantityInStock int, @CreditLimit smallmoney
declare @OrderValue smallmoney
-- do all the reads here
-- read the quantiy in stock for an entered ProductID
-- into a chunk of memeory(AKA an internal variable called @QuantityInStock)
select @QuantityInStock  = QuantityInStock
, @OrderValue = (ProductPrice * @OrderQuantity)
from dbo.ProductTbl
where ProductID = @ProductID
-- read the CustomerCreditLimit for an entered CustomerID
-- into a chunk of memeory(AKA an internal variable called @CreditLimit)
SELECT @CreditLimit = CustomerCreditLimit
FROM dbo.CustomerTBL
WHERE  CustomerID = @CustomerID;
-- read the value of the order (ProductPrice*QuantityOrdered) for an entered ProductID
-- into a chunk of memeory(AKA an internal variable called @OrderValue)



-- do all the business logic here
if @QuantityInStock < @OrderQuantity 
Begin
;throw 510001, 'Order Rejected Not Enough Stock', 1
end

if @CreditLimit < @OrderValue
BEGIN
;THROW 510001, 'Order Rejected not enough credit', 1
END


-- perform all actions here NOTE wrap them in Try/Catch Blocks


 