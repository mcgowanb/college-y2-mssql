select c.CustomerID, c.CustomerName
from dbo.CustomerTBL as c
inner join dbo.OrderTBL as o on
c.CustomerID = o.CustomerID
inner join dbo.OrderDetailTBL as dt on
o.SalesOrderID=dt.SalesOrderID
where dt.ProductID = 1
intersect
select c.CustomerID, c.CustomerName
from dbo.CustomerTBL as c
inner join dbo.LoyaltyCardTBL as l on
c.CustomerID=l.CustomerID
where Points =200