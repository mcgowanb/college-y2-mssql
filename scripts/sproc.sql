USE S00165159
GO
CREATE PROC MyFirstSproc
@CreditLimit money
AS
SELECT CustomerID, CustomerName, CustomerAddress1
FROM CustomerTBL
WHERE CustomerCreditLimit > @CreditLimit