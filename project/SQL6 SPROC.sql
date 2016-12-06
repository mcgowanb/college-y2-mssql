USE S00165159SQLProject
GO

CREATE PROC SQL6
@id int,
@password text
AS
BEGIN TRY
UPDATE ClientTbl
SET ClientPassword = @password
WHERE ClientID = @id
END TRY
BEGIN CATCH
;THROW
END CATCH
