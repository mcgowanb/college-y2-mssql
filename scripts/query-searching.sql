USE S00165159
GO

SELECT * 
FROM CustomerTBL
WHERE CustomerAddress2 LIKE '%a%'

USE S00165159
GO

SELECT * 
FROM CustomerTBL
WHERE CustomerAddress1 LIKE '_ain%'

USE S00165159
GO

SELECT * 
FROM CustomerTBL
WHERE CustomerAddress2 LIKE '[a-t]ligo'

USE S00165159
GO

SELECT * 
FROM CustomerTBL
WHERE CustomerAddress2 NOT LIKE '[a-t]ligo'
WHERE CustomerAddress2 LIKE '[^a-t]ligo' --same as above