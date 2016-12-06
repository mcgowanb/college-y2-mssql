USE S00165159SQLProject
GO
CREATE PROC SQL7
AS

SELECT ClientTbl.ClientID, ClientTbl.ClientName, COUNT(PremisesTbl.ClientID) as NoOfPremises
FROM ClientTbl
INNER JOIN PremisesTbl ON ClientTbl.ClientID = PremisesTbl.ClientID
GROUP BY ClientTbl.ClientID, ClientTbl.ClientName