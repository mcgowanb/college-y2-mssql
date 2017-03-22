USE S00165159SQLProject
GO
CREATE PROC SQL10
AS
SELECT ClientTbl.ClientID, ClientName
FROM ClientTbl
INNER JOIN ClientTypeTBL ON ClientTypeTbl.ClientTypeID = ClientTbl.ClientTypeID
WHERE ClientTypeDescription = 'High Level'
EXCEPT
SELECT ClientTbl.ClientID, ClientName
FROM ClientTbl
LEFT JOIN PremisesTbl ON ClientTbl.ClientID = PremisesTbl.PremisesID
WHERE PremisesCity LIKE 'Sligo'
