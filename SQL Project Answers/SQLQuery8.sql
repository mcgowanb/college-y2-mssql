
ALTER proc [SQL8]
as
select PremisesID, PremisesCity
from dbo.PremisesTbl
where NoOfAlarms > (select avg(NoOfAlarms) from dbo.PremisesTbl)