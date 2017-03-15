ALTER PROC [dbo].[stats1]
AS
/****** Object:  Statistic [NameStats]    Script Date: 16/02/2017 17:43:09 ******/
CREATE STATISTICS [NameStats] ON [dbo].[CustomerTBL]([CustomerName])
 WITH SAMPLE 50 PERCENT; 


DBCC SHOW_STATISTICS ("dbo.CustomerTBL", NameStats);  
GO 


ALTER INDEX PK_ProductTbl ON dbo.ProductTbl REBUILD;  
