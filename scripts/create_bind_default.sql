USE AdventureWorks2012;  
GO  
CREATE DEFAULT phonedflt AS 'unknown';  

USE AdventureWorks2012;  
GO  
sp_bindefault 'phonedflt', 'Person.PersonPhone.PhoneNumber'; 

sp_bindefault 'phonedflt', '[schema].tableName.Column'; 