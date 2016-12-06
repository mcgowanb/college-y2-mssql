USE S00165159SQLProject
GO

CREATE PROC SQL9
@NoOfPremises int
AS

SELECT KeyholderTbl.KeyholderID, KeyholderName, COUNT(PremisesKeyHolderTbl.PremisesID) As TotalPremises
FROM PremisesKeyholderTbl
INNER JOIN KeyholderTbl on PremisesKeyholderTbl.KeyholderID = KeyholderTbl.KeyholderID
GROUP BY KeyholderTbl.KeyholderID, KeyholderName 
HAVING COUNT(PremisesKeyHolderTbl.PremisesID) > @NoOfPremises