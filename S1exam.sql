USE S00165159finalJan
GO
CREATE PROC sum_ex2a
AS 
SELECT AVG(LotTBL.SalesAmount) AS AverageSaleAmount
FROM LotTBL


USE S00165159finalJan
GO
CREATE PROC sum_ex2b
AS 
SELECT DISTINCT SellerID, FarmerFName, FarmerLName
FROM LotTBL
INNER JOIN FarmerTBL on SellerID = FarmerID





USE S00165159finalJan
GO
CREATE PROC sum_ex2c
AS 
SELECT AnimalID
FROM AnimalLotsTBL
GROUP BY AnimalID
HAVING COUNT(*) > 3

USE S00165159finalJan
GO
CREATE PROC sum_ex2d
AS 
SELECT SellerID as FarmerID, AnimalID, SalesAmount FROM
LotTBL
LEFT JOIN AnimalLotsTBL on LotTBL.LotNumber = AnimalLotsTBL.LotNumber 
WHERE SalesAmount > (SELECT AVG(LotTBL.SalesAmount)FROM LotTBL)


USE S00165159finalJan
GO
CREATE PROC sum_ex2e
AS 
SELECT DISTINCT FarmerID, FarmerFName, FarmerLName
FROM FarmerTBL
INNER JOIN LotTBL on FarmerID = LotTBL.BuyerID
EXCEPT
SELECT DISTINCT FarmerID, FarmerFName, FarmerLName
FROM FarmerTBL
INNER JOIN LotTBL on FarmerID = LotTBL.SellerID

USE S00165159finalJan
GO
CREATE PROC sum_ex2f
AS 
SELECT AnimalID, SellerID as FarmerID
FROM AnimalLotsTBL AS a
INNER JOIN LotTBL on a.LotNumber = LotTBL.LotNumber
WHERE SalesAmount > (SELECT AVG(SalesAmount)FROM LotTBL
INNER JOIN AnimalLotsTBL on LotTBL.LotNumber = AnimalLotsTBL.LotNumber
WHERE AnimalLotsTBL.PenNumber = a.PenNumber)