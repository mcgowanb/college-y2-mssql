USE S00165159 
GO
CREATE PROC rebuild_index
AS
ALTER INDEX MyExampleClusteredIndex ON CustomerTBL
REORGANIZE
--Slide 35 on indexes1.pptx


--Covering Filtered Index
--add fill factor and pad index if heavily updated
--Use the field in the where and any additional fields wanted in the query

--Views -- Index Views Make Schema Bound and Views slides 17 - 18
-- Index views are created as normal, but need to use countbig and isNull(value, 0)
-- When using a sum column to add an index. see have nots and info below in comments for one already created
USE [s00165159]
GO

/****** Object:  Index [FilteredCoveringIndex]    Script Date: 02/03/2017 17:08:35 ******/
CREATE NONCLUSTERED INDEX [FilteredCoveringIndex] ON [dbo].[CustomerTBL]
(
	[CustomerCreditLimit] ASC
)
INCLUDE ( 	[CustomerID],
	[CustomerName]) 
WHERE ([CustomerCreditLimit]>(50))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE VIEW [dbo].[FancyViewEncrypted]
WITH SCHEMABINDING , VIEW_METADATA, ENCRYPTION
--Scripting to new view and add ENCRYPTION to encrypt view


--SELECT        dbo.CustomerTBL.CustomerID, dbo.CustomerTBL.CustomerName, dbo.OrderDetailTBL.ProductID, SUM(ISNULL(dbo.OrderDetailTBL.OrderQuantity, 0)) 
--                         AS TotalOrderQty, COUNT_BIG(*) AS Expr1
--FROM            dbo.CustomerTBL INNER JOIN
--                         dbo.OrderTBL ON dbo.CustomerTBL.CustomerID = dbo.OrderTBL.CustomerID INNER JOIN
--                         dbo.OrderDetailTBL ON dbo.OrderTBL.SalesOrderID = dbo.OrderDetailTBL.SalesOrderID
--WHERE        (dbo.OrderDetailTBL.ProductID = 3)
--GROUP BY dbo.CustomerTBL.CustomerID, dbo.CustomerTBL.CustomerName, dbo.OrderDetailTBL.Product
