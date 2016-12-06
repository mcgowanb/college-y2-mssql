USE S00165159SQLProject
GO

CREATE PROC SQL4
AS
SELECT PremisesID, PremisesCity, AccountTotal
FROM PremisesTbl
WHERE AccountTotal =  (SELECT MAX(AccountTotal) FROM PremisesTbl)