

ALTER proc [SQL5b]
as

select distinct p.PremisesID, PremisesCity
from dbo.PremisesTbl as p
left join dbo.PremisesAccountDetailsTbl as pa on
p.PremisesID = pa.PremisesID
where pa.PremisesID is null
