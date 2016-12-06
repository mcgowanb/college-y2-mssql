USE S00165159SQLProject
GO

CREATE PROC SQL10
AS
SELECT ClientTbl.ClientID, ClientName
FROM ClientTbl
WHERE ClientTypeID = 3
EXCEPT
SELECT ClientTbl.ClientID, ClientName
FROM ClientTbl
LEFT JOIN PremisesTbl ON ClientTbl.ClientID = PremisesTbl.PremisesID
WHERE PremisesCity LIKE 'Sligo'