USE S00165159SQLProject
GO
 
CREATE PROC SQL5b
AS
SELECT PremisesTbl.PremisesID, PremisesTbl.PremisesCity
FROM
PremisesTbl
LEFT JOIN PremisesAccountDetailsTbl ON PremisesTbl.PremisesID = PremisesAccountDetailsTbl.PremisesID
WHERE PremisesAccountDetailsTbl.PremisesID IS NULL