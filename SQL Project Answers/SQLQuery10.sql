
ALTER proc [SQL10]
as
select ClientID, ClientName
from dbo.ClientTbl as c
inner join dbo.ClientTypeTbl as o on
c.ClientTypeID = o.ClientTypeID
where o.ClientTypeDescription like 'high level'
except
select c.ClientID, ClientName
from dbo.ClientTbl as c
inner join dbo.PremisesTbl as m on
c.ClientId = m.ClientID
where m.PremisesCity like 'sligo'
