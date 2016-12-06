USE S00165159SQLProject
GO

CREATE PROC SQL2
@clientType int
AS
SELECT ClientName
FROM ClientTbl
WHERE ClientTypeID = @clientType