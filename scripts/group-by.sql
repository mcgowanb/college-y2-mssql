SELECT p.ProductID, p.ProductDesc, COUNT(*) as NoOrdered
  FROM dbo.ProductTBL as p inner join dbo.OrderDetailTBL as o
  on p.ProductID = o.ProductID
  group by p.ProductID, p.ProductDesc