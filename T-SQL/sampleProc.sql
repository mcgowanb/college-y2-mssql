create proc SampleOrder
	-- inline comment
	--declare all external input variables before as
	@customerID int, @ProductID int, @OrderQty int
	as 
	--declare all internal variables here
	declare @QuantityInStock int, @CreditLimit smallmoney
	declare @OrderValue smallmoney
	--do all reads here

SELECT QuantityInStock = @QuantityInStock
FROM dbo.ProductTBL
WHERE PRoductID = @ProductID


	--- do all bsiness logic here

IF @QuantityInStock < @OrderQty
BEGIN
;THROW 510001, 'Order Rejected - Not enough stock', 1

END


	-- perform all actions here, and wrap in try catch