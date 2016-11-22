SELECT ProductID, ProductDesc
  FROM dbo.ProductTBL
  WHERE ProductPrice = (
	SELECT MIN(ProductPrice) 
	FROM ProductTBL
	)
