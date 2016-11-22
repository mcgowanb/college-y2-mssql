--Create Sproc

CREATE PROC sample41a
AS
SELECT c.CustomerID, CustomerName, SalesOrderDate
FROM dbo.CustomerTBL as c
INNER JOIN dbo.OrderTBL as o on
c.CustomerID = o.CustomerID

--Local query window needs to be refreshed before altering using ctrl shift R
ALTER PROC sample41a
AS
SELECT c.CustomerID, CustomerName, SalesOrderDate
FROM dbo.CustomerTBL as c
INNER JOIN dbo.OrderTBL as o on
c.CustomerID = o.CustomerID