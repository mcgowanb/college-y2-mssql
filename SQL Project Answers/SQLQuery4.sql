

ALTER proc [SQL4]
as
select PremisesID, PremisesCity
from dbo.PremisesTbl
where AccountTotal = (select max(AccountTotal)From dbo.PremisesTbl)