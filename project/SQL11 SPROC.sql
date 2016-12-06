USE S00165159SQLProject
GO

CREATE PROC SQL11
AS
SELECT CTB.ClientID, ClientName
FROM ClientTbl as CTB
WHERE NoOfKeyHolders > (SELECT AVG(NoOfKeyHolders) FROM ClientTbl WHERE ClientTypeID = CTB.ClientTypeID) 