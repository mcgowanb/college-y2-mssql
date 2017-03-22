
ALTER proc [SQL7]
as
select c.ClientID, ClientName, count(*) as NumberOfPremises
from dbo.ClientTbl as c
inner join dbo.PremisesTbl as o on
c.ClientID = o.ClientID
group by c.ClientID, ClientName