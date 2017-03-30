CREATE PROC insertOrder
--declare external variables before the as
@CustomerID int, @ProductID int, @OrderQty decimal(18,2) --datatype to match the datataype of the matching table

AS
--declare internal variables after the as
DECLARE @CustomerCreditLimit money, @NoOfOrders smallint, @QtyInStock smallint, @ProductPrice smallmoney
DECLARE @NewSalesOrder int

-- reads in the format of select from where
SELECT @CustomerCreditLimit = CustomerCreditLimit 
FROM CustomerTBL 
WHERE CustomerID = @CustomerID

SELECT @QtyInStock = QtyInStock, @ProductPrice = ProductPrice
FROM ProductTBL
WHERE ProductID = @ProductID

