USE S00165159
GO

SELECT ProductID, ProductDesc
FROM ProductTBL as b
WHERE ProductPrice > 
(
SELECT avg(ProductPrice) 
FROM ProductTBL
WHERE bin = b.bin
)