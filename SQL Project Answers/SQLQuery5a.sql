

ALTER proc [SQL5b]
as

select distinct p.PremisesID, PremisesCity
from dbo.PremisesTbl as p
inner join dbo.PremisesAccountDetailsTbl as pa on
p.PremisesID = pa.PremisesID

