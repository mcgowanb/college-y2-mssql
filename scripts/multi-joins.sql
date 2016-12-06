SELECT c.CustomerID, CustomerName
FROM dbo.CustomerTBL as c
INNER JOIN dbo.OrderTBL as o on
c.CustomerID = o.CustomerID
INNER JOIN dbo.OrderDetailTBL as dt on
o.SalesOrderID = dt.SalesOrderID
WHERE ProductID  = 1