USE S00165159SQLProject
GO
CREATE PROC SQL8
AS
SELECT PremisesID, PremisesCity, NoOfAlarms
FROM PremisesTbl
WHERE NoOfAlarms > (SELECT AVG(NoOfAlarms) FROM PremisesTbl)