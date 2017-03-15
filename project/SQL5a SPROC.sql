USE S00165159SQLProject
GO
CREATE PROC SQL5a
AS
SELECT DISTINCT PremisesTbl.PremisesID, PremisesTbl.PremisesCity
FROM
PremisesTbl
INNER JOIN PremisesAccountDetailsTbl ON PremisesTbl.PremisesID = PremisesAccountDetailsTbl.PremisesID
