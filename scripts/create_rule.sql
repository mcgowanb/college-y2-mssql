USE S00165159
GO
CREATE RULE column_limit  
AS   
@limit>= 0;



USE S00165159
GO
EXEC sp_bindrule 'column_limit', '[dbo].ProductTbl.QuantityInStock';
