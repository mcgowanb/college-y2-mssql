
ALTER proc [SQL9]
@NumberOfPremises int
as
select c.KeyholderID, KeyholderName, count(*) as NumberOfPrem
from dbo.KeyholderTbl as c 
inner join dbo.PremisesKeyholderTbl as o on
c.KeyholderId = o.KeyholderID
Group by c.KeyholderID, KeyholderName
having count(*) > @NumberOfPremises