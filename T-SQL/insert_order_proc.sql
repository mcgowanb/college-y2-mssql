ALTER PROC insertOrder
--external variables
@CustomerID int, @ProductID int, @OrderQty decimal(18,2)
AS
--internal variables
DECLARE @CustomerCreditLimit smallmoney, @NoOfOrders smallint, @QtyInStock smallint
DECLARE @ProductPrice smallmoney, @NewSalesOrder int, @TotalDue smallmoney
--read in data
-- Customer Credit limit
SELECT @CustomerCreditLimit = CustomerCreditLimit
FROM CustomerTBL
WHERE CustomerID = @CustomerID
-- No Of Orders
SELECT @NoOfOrders =  COUNT(*)
FROM OrderTBL
WHERE CustomerID = @CustomerID AND DATEDIFF(dd, SalesOrderDate, GETDATE()) <= 5
-- QTY in stock & Product Price
SELECT @QtyInStock = QuantityInStock, @ProductPrice = ProductPrice
FROM ProductTBL
WHERE ProductID = @ProductID
-- Product Price
SELECT @ProductPrice = ProductPrice 
FROM ProductTBL 
WHERE ProductID = @ProductID
-- Add discount if applicable
IF @NoOfOrders > 10
BEGIN
SELECT @ProductPrice *= .9
END
-- Calculate total due
SELECT @TotalDue = @OrderQty * @ProductPrice
-- Check for credit
IF @TotalDue > @CustomerCreditLimit
BEGIN
;THROW 51001, 'Not enough Credit Order is refused', 1
END
-- check for stock level
IF @OrderQty > @QtyInStock
BEGIN
;THROW 51002, 'Not enough stock, order is refused', 1
END
--insert order
BEGIN TRY
INSERT INTO OrderTBL (SalesOrderDate, CustomerID, TotalDue)
VALUES(GETDATE(), @CustomerID, @TotalDue)
END TRY
BEGIN CATCH
;THROW
END CATCH
--get salesorderid
SELECT @NewSalesOrder = SCOPE_IDENTITY()
-- insert into order details
BEGIN TRY
INSERT INTO OrderDetailTBL (SalesOrderID, ProductID, OrderQuantity)
VALUES(@NewSalesOrder, @ProductID, @OrderQty)
END TRY
BEGIN CATCH
;THROW
END CATCH

;THROW 50003, 'Order Inserted - thankyou', 1