USE s00165159
GO
CREATE DEFAULT EmpAdd2Dflt AS 'Dublin'

USE s00165159
GO  
sp_bindefault 'EmpAdd2Dflt',  '[exam1].EmployeeTBL.EmployeeAddress2' 